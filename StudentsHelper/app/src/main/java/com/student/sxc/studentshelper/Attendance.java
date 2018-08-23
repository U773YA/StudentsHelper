package com.student.sxc.studentshelper;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TableLayout;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Attendance extends AppCompatActivity {

    private TableLayout mTable;
    private int mResult;
    private int mSem;
    private View[] mViews;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_table);
        TextView Header=(TextView)findViewById(R.id.text_header);
        Header.setText("ATTENDANCE");

        mTable =(TableLayout)findViewById(R.id.tl);
        LayoutInflater inflater=getLayoutInflater();
        View tr1=inflater.inflate(R.layout.table_row_layout_attendance,null,false);
        tr1.findViewById(R.id.tr_row).setBackgroundResource(R.drawable.table_row_first_bg);
        mTable.addView(tr1);

        String json=getIntent().getStringExtra("json");

        try{
            JSONObject jsonObject=new JSONObject(json);
            JSONArray jsonArray=jsonObject.getJSONArray("result");
            JSONObject j=jsonArray.getJSONObject(0);
            mSem =j.getInt("sem");
            j=jsonArray.getJSONObject(1);
            mResult =j.getInt("result");
            mViews=new View[mResult];
            for(int i = 0; i< mResult; i++){
                JSONObject j1=jsonArray.getJSONObject(i+2);
                mViews[i]=inflater.inflate(R.layout.table_row_layout_attendance,null,false);
                TextView Subject_Code=(TextView)mViews[i].findViewById(R.id.code);
                Subject_Code.setText(j1.getString("Code"));
                //if(Subject_Code.getText().toString().equalsIgnoreCase("null") || Subject_Code.getText().toString().isEmpty())
                //    Subject_Code.setText("--");
                TextView CA=(TextView)mViews[i].findViewById(R.id.ca);
                //CA.setText(Integer.toString(j1.getInt("Classes attended")));
                //if(CA.getText().toString().equalsIgnoreCase("null") || CA.getText().toString().isEmpty())
                //   CA.setText("--");
                TextView CT=(TextView)mViews[i].findViewById(R.id.ct);
                //CT.setText(Integer.toString(j1.getInt("Total classes")));
                //if(CT.getText().toString().equalsIgnoreCase("null") || CT.getText().toString().isEmpty())
                //   CT.setText("--");
                String cl=j1.getString("Classes attended");
                String total=j1.getString("Total classes");
                if(cl.equalsIgnoreCase("null"))
                    CA.setText("--");
                else
                    CA.setText(cl);
                if(total.equalsIgnoreCase("null"))
                    CT.setText("--");
                else
                    CT.setText(total);
                TextView PER=(TextView)mViews[i].findViewById(R.id.per);
                if(cl.equalsIgnoreCase("null") || total.equalsIgnoreCase("null"))
                    PER.setText("--");
                else
                    PER.setText(String.format("%.2f",Float.parseFloat(cl)/Float.parseFloat(total)*100));
                mViews[i].findViewById(R.id.tr_row).setBackgroundResource(R.drawable.table_row_bg);
                mTable.addView(mViews[i]);
            }
        }catch (JSONException e){
            Log.e("JSON","JSON Parsing error");
        }
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, Attendance.class);
        return i;
    }
}

