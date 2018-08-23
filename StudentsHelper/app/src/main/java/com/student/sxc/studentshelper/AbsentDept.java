package com.student.sxc.studentshelper;

import android.app.ProgressDialog;
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
import android.widget.Toast;

import com.student.sxc.studentshelper.Networking.AsyncCallback;
import com.student.sxc.studentshelper.Networking.HttpGetAsync;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class AbsentDept extends AppCompatActivity {

    private RecyclerView mAbsentList;

    private List<String> alist=new ArrayList<>();
    private AbsentAdapter mAdapter;
    private ProgressDialog load;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.simple_recyclerview);

        mAbsentList =(RecyclerView)findViewById(R.id.simple_recycler_view);
        mAbsentList.setLayoutManager(new LinearLayoutManager(getApplicationContext()));

        String ipaddress = QueryPreferences.getipaddress(AbsentDept.this);
        if (ipaddress.isEmpty()) {
            Toast.makeText(AbsentDept.this, "IP Address not given.", Toast.LENGTH_SHORT).show();
        } else {
            String uri= Uri.parse("http://"+ipaddress+"/myapp/absent1.php").buildUpon()
                    .build().toString();
            new HttpGetAsync(uri, new AsyncCallback(){
                @Override
                public void onStart() {
                    load=ProgressDialog.show(AbsentDept.this,"","loading");
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
                                    String dept=j.getString("Department_Code");
                                    alist.add(dept);
                                }
                            }
                            mAdapter=new AbsentAdapter(alist);
                            mAbsentList.setAdapter(mAdapter);
                        }catch(JSONException e){
                            Log.e("JSONError", "JSON Parsing error");
                        }
                    }else{
                        Toast.makeText(AbsentDept.this,"IP Address error.", Toast.LENGTH_SHORT).show();
                    }
                }
            }).execute();
        }
    }

    private class AbsentHolder extends RecyclerView.ViewHolder {

        private String mTeachers;

        private TextView mDept;

        public AbsentHolder(View itemView){
            super(itemView);
            mDept=(TextView)itemView.findViewById(R.id.item_header);
        }

        public void bindAbsent(String teachers){
            mTeachers=teachers;
            mDept.setText(mTeachers);
        }

    }

    private class AbsentAdapter extends RecyclerView.Adapter<AbsentHolder>{
        private List<String> mTeachers;

        public AbsentAdapter(List<String> teachers){
            mTeachers=teachers;
        }

        @Override
        public AbsentHolder onCreateViewHolder(ViewGroup parent, int viewType){
            LayoutInflater layoutInflater= LayoutInflater.from(parent.getContext());
            View view=layoutInflater.inflate(R.layout.item_dept_list,parent,false);
            view.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    int pos= mAbsentList.getChildAdapterPosition(v);
                    String dept=alist.get(pos);
                    String uri=Uri.parse("http://"+QueryPreferences.getipaddress(getApplicationContext())+"/myapp/absent2.php?").buildUpon()
                            .appendQueryParameter("dept",dept)
                            .build().toString();
                    new HttpGetAsync(uri, new AsyncCallback() {
                        @Override
                        public void onStart() {
                            load=ProgressDialog.show(AbsentDept.this,"","loading");
                        }

                        @Override
                        public void onFinish(String jsonReceive) {
                            load.cancel();
                            if(!jsonReceive.isEmpty()) {
                                ArrayList<String> mResources = new ArrayList<String>();
                                try {
                                    JSONObject jsonObject = new JSONObject(jsonReceive);
                                    JSONArray jsonArray=jsonObject.getJSONArray("result");
                                    JSONObject j=jsonArray.getJSONObject(0);
                                    int result=j.getInt("result");
                                    if(result>0){
                                        for(int i=1;i<=result;i++){
                                            j=jsonArray.getJSONObject(i);
                                            String item=j.getString("Teacher_Name")+";"+j.getString("Department_Code")+";"+j.getString("Date_of_Absence");
                                            mResources.add(item);
                                        }
                                    }
                                    SingletonClass obj=SingletonClass.getInstance();
                                    obj.setAbsent(mResources);
                                    Intent intent=AbsentTeachers.newIntent(getApplicationContext());
                                    startActivity(intent);
                                } catch (JSONException e) {
                                    Log.e("JSONError", "JSON Parsing error");
                                }
                            }else{
                                Toast.makeText(AbsentDept.this,"IP Address error.", Toast.LENGTH_SHORT).show();
                            }
                        }
                    }).execute();
                }
            });
            return new AbsentHolder(view);
        }

        @Override
        public void onBindViewHolder(AbsentHolder holder,int position){
            String teachers=mTeachers.get(position);
            holder.bindAbsent(teachers);
        }

        @Override
        public int getItemCount(){
            return mTeachers.size();
        }
    }

    @Override
    protected void onResume(){
        super.onResume();
        mAdapter=new AbsentAdapter(alist);
        mAbsentList.setAdapter(mAdapter);
    }
}
