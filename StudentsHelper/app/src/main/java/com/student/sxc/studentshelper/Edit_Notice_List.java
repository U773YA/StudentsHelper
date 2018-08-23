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
import android.widget.TextView;

import com.student.sxc.studentshelper.Networking.AsyncCallback;
import com.student.sxc.studentshelper.Networking.HttpGetAsync;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class Edit_Notice_List extends AppCompatActivity {

    private RecyclerView mNoticeList;
    private List<String> nlist=new ArrayList<>();
    private NoticeAdapter mNoticeAdapter;
    private ProgressDialog load;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.list_notice);

        mNoticeList =(RecyclerView)findViewById(R.id.notice_list_recycler_view);
        mNoticeList.setLayoutManager(new LinearLayoutManager(getApplicationContext()));

        String ipaddress=QueryPreferences.getipaddress(getApplicationContext());
        String uri= Uri.parse("http://"+ipaddress+"/myapp/notices.php").buildUpon()
                .build().toString();
        new HttpGetAsync(uri, new AsyncCallback() {
            @Override
            public void onStart() {
                load= ProgressDialog.show(Edit_Notice_List.this,"","loading");
            }
            @Override
            public void onFinish(String jsonReceive) {
                load.cancel();
                if(!jsonReceive.isEmpty()){
                    try{
                        JSONObject jsonObj=new JSONObject(jsonReceive);
                        JSONArray jsonArray=jsonObj.getJSONArray("result");
                        JSONObject j=jsonArray.getJSONObject(0);
                        int result= Integer.parseInt(j.getString("result"));
                        if(result>0) {
                            for (int i = 1; i <= result; i++) {
                                j=jsonArray.getJSONObject(i);
                                String item=j.getString("Text_File_Name")+";"+j.getString("Date_of_Entry");
                                nlist.add(item);
                            }
                        }
                        mNoticeAdapter=new NoticeAdapter(nlist);
                        mNoticeList.setAdapter(mNoticeAdapter);
                        mNoticeAdapter.notifyDataSetChanged();
                    }catch (JSONException e){
                        Log.e("JSONError", "JSON Parsing error");
                    }
                }
            }
        }).execute();
    }

    private class NoticeHolder extends RecyclerView.ViewHolder{

        private String mNotices;

        private TextView mDate;
        private TextView mHeader;

        public NoticeHolder(View itemView){
            super(itemView);
            mDate=(TextView)itemView.findViewById(R.id.item_date);
            mHeader=(TextView)itemView.findViewById(R.id.item_header);
        }

        public void bindNotices(String notices){
            mNotices=notices;
            String asplit[]=mNotices.split(";");
            mDate.setText(asplit[1]);
            mHeader.setText(asplit[0]);
        }

    }

    private class NoticeAdapter extends RecyclerView.Adapter<NoticeHolder>{

        private List<String> mNotices;

        public NoticeAdapter(List<String> notices){
            mNotices=notices;
        }

        @Override
        public NoticeHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater layoutInflater= LayoutInflater.from(parent.getContext());
            View view=layoutInflater.inflate(R.layout.item_notice,parent,false);
            view.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    int pos= mNoticeList.getChildAdapterPosition(v);
                    SingletonClass obj=SingletonClass.getInstance();
                    obj.setNotice(nlist.get(pos));
                    Intent i= Edit_Notice_Page.newIntent(getApplicationContext());
                    startActivity(i);
                }
            });
            return new NoticeHolder(view);
        }

        @Override
        public void onBindViewHolder(NoticeHolder holder, int position) {
            String notices=mNotices.get(position);
            holder.bindNotices(notices);

        }

        @Override
        public int getItemCount() {
            return mNotices.size();
        }
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, Edit_Notice_List.class);
        return i;
    }

    @Override
    protected void onResume(){
        super.onResume();
        mNoticeAdapter=new NoticeAdapter(nlist);
        mNoticeList.setAdapter(mNoticeAdapter);
    }

}