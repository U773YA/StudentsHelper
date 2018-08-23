package com.student.sxc.studentshelper;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.Toast;

import com.student.sxc.studentshelper.Networking.AsyncCallback;
import com.student.sxc.studentshelper.Networking.DownloadImageTask;
import com.student.sxc.studentshelper.Networking.HttpGetAsync;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class Notice_Images extends AppCompatActivity {

    private RecyclerView mImageList;

    private List<String> ilist=new ArrayList<>();
    private ImageAdapter mAdapter;
    private ProgressDialog load;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.simple_recyclerview);

        mImageList =(RecyclerView)findViewById(R.id.simple_recycler_view);
        mImageList.setLayoutManager(new LinearLayoutManager(getApplicationContext()));

        String ipaddress = QueryPreferences.getipaddress(getApplicationContext());
        if (ipaddress.isEmpty()) {
            Toast.makeText(getApplicationContext(), "IP Address not given.", Toast.LENGTH_SHORT).show();
        } else {
            String uri= Uri.parse("http://"+ipaddress+"/myapp/noticeimage.php").buildUpon()
                    .build().toString();
            new HttpGetAsync(uri, new AsyncCallback(){
                @Override
                public void onStart() {
                    load=ProgressDialog.show(Notice_Images.this,"","loading");
                }

                @Override
                public void onFinish(String jsonReceive) {
                    load.cancel();
                    if (!jsonReceive.isEmpty()) {
                        try {
                            JSONObject jsonObj=new JSONObject(jsonReceive);
                            JSONArray jsonArray=jsonObj.getJSONArray("result");
                            JSONObject j=jsonArray.getJSONObject(0);
                            int result= Integer.parseInt(j.getString("result"));
                            if(result>0){
                                for(int i=1;i<=result;i++){
                                    j=jsonArray.getJSONObject(i);
                                    String image=j.getString("Image_File_Name");
                                    ilist.add(image);
                                }
                            }
                            mAdapter=new ImageAdapter(ilist);
                            mImageList.setAdapter(mAdapter);
                        }catch(JSONException e){
                            Log.e("JSONError", "JSON Parsing error");
                        }
                    }else{
                        Toast.makeText(getApplicationContext(),"IP Address error.", Toast.LENGTH_SHORT).show();
                    }
                }
            }).execute();
        }
    }

    private class ImageHolder extends RecyclerView.ViewHolder {

        private String mImages;

        private ImageView mImage;

        public ImageHolder(View itemView){
            super(itemView);
            mImage=(ImageView)itemView.findViewById(R.id.item_image);
        }

        public void bindAbsent(String images){
            mImages=images;
            new DownloadImageTask(mImage).execute("http://"+QueryPreferences.getipaddress(getApplicationContext())+"/images/Notice_Images/"+images);
        }

    }

    private class ImageAdapter extends RecyclerView.Adapter<ImageHolder>{
        private List<String> mImages;

        public ImageAdapter(List<String> images){
            mImages=images;
        }

        @Override
        public ImageHolder onCreateViewHolder(ViewGroup parent, int viewType){
            LayoutInflater layoutInflater= LayoutInflater.from(parent.getContext());
            View view=layoutInflater.inflate(R.layout.item_imageview,parent,false);
            return new ImageHolder(view);
        }

        @Override
        public void onBindViewHolder(ImageHolder holder, int position){
            String images=mImages.get(position);
            holder.bindAbsent(images);
        }

        @Override
        public int getItemCount(){
            return mImages.size();
        }
    }

    @Override
    protected void onResume(){
        super.onResume();
        mAdapter=new ImageAdapter(ilist);
        mImageList.setAdapter(mAdapter);
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, Notice_Images.class);
        return i;
    }
}