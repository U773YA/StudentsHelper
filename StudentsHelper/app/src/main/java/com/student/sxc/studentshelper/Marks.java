package com.student.sxc.studentshelper;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TableLayout;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Marks extends AppCompatActivity {

    private TableLayout mTable;
    private int mResult;
    private View[] mViews;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_table);
        TextView Header=(TextView)findViewById(R.id.text_header);
        Header.setText("MARKS");
        mTable =(TableLayout)findViewById(R.id.tl);
        LayoutInflater inflater=getLayoutInflater();
        View tr1=inflater.inflate(R.layout.table_row_layout_marks_header,null,false);

        mTable.addView(tr1);
        String json=getIntent().getStringExtra("json");
        int sem=getIntent().getIntExtra("sem",0);
        try{
            JSONObject jsonObject=new JSONObject(json);
            JSONArray jsonArray=jsonObject.getJSONArray("result");
            JSONObject j=jsonArray.getJSONObject(0);
            mResult =j.getInt("result");
            mViews=new View[mResult];
            for(int i = 0; i< mResult; i++){
                JSONObject j1=jsonArray.getJSONObject(i+1);
                mViews[i]=inflater.inflate(R.layout.table_row_layout_marks,null,false);
                TextView Paper_Code=(TextView)mViews[i].findViewById(R.id.paper_code);
                Paper_Code.setText(j1.getString("Code"));
                Paper_Code.setBackground(ContextCompat.getDrawable(getApplicationContext(), R.drawable.squarecorner));
                TextView FM=(TextView)mViews[i].findViewById(R.id.fm);
                FM.setBackground(ContextCompat.getDrawable(getApplicationContext(), R.drawable.squarecorner));
                FM.setPadding(10,10,10,10);
                TextView QM=(TextView)mViews[i].findViewById(R.id.qm);
                QM.setText(Integer.toString(j1.getInt("Qualify")));
                QM.setBackground(ContextCompat.getDrawable(getApplicationContext(), R.drawable.squarecorner));
                QM.setPadding(10,10,10,10);
                TextView CIA=(TextView)mViews[i].findViewById(R.id.cia);
                CIA.setPadding(10,10,10,10);
                TextView SE=(TextView)mViews[i].findViewById(R.id.se);
                SE.setBackground(ContextCompat.getDrawable(getApplicationContext(), R.drawable.squarecorner));
                SE.setPadding(10,10,10,10);
                TextView Total=(TextView)mViews[i].findViewById(R.id.total);
                Total.setBackground(ContextCompat.getDrawable(getApplicationContext(), R.drawable.squarecorner));
                Total.setPadding(10,10,10,10);
                TextView Grade=(TextView)mViews[i].findViewById(R.id.grade);
                Grade.setBackground(ContextCompat.getDrawable(getApplicationContext(), R.drawable.squarecorner));
                Grade.setPadding(10,10,10,10);
                String cia=j1.getString("Cia_Marks");
                String se=j1.getString("Sem_Marks");
                String ciat=j1.getString("Cia_total");
                String semt=j1.getString("Sem_total");
                if(ciat.equalsIgnoreCase("null"))
                    FM.setText(semt);
                else
                    FM.setText(Integer.toString(Integer.parseInt(ciat)+Integer.parseInt(semt)));
                if(cia.equalsIgnoreCase("null"))
                    CIA.setText("--");
                else
                    CIA.setText(cia);
                if(se.equalsIgnoreCase("null"))
                    SE.setText("--");
                else
                    SE.setText(se);
                if(cia.equalsIgnoreCase("null") || se.equalsIgnoreCase("null"))
                    Total.setText("--");
                else
                    Total.setText(Integer.toString(Integer.parseInt(cia)+Integer.parseInt(se)));
                if(Total.getText().toString().equalsIgnoreCase("--"))
                    Grade.setText("--");
                else{
                    String gra;
                    float per=Float.parseFloat(Total.getText().toString())/Float.parseFloat(FM.getText().toString())*100;
                    if(per>=90)
                        gra="O";
                    else if(per>=80)
                        gra="A+";
                    else if(per>=70)
                        gra="A";
                    else if(per>=60)
                        gra="B+";
                    else if(per>=50)
                        gra="B";
                    else if(per>=40)
                        gra="C";
                    else if(per>=30)
                        gra="D";
                    else
                        gra="E";
                    Grade.setText(gra);
                }
                mViews[i].findViewById(R.id.tr_row).setBackgroundResource(R.drawable.table_row_bg);
                mTable.addView(mViews[i]);
            }
        }catch (JSONException e){
            Log.e("JSON","JSON Parsing error");
        }
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, Marks.class);
        return i;
    }
}

