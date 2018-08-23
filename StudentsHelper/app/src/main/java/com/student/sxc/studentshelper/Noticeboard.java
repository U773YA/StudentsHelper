package com.student.sxc.studentshelper;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

public class Noticeboard extends AppCompatActivity {

    private TextView txt_Absent;
    private TextView txt_Notices;
    private TextView txt_NoticeImages;
    private TextView txt_Events;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_noticeboard);

        txt_Absent=(TextView)findViewById(R.id.absent);
        txt_Absent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Noticeboard.this,AbsentDept.class);
                startActivity(i);
            }
        });

        txt_Notices =(TextView)findViewById(R.id.notices);
        txt_Notices.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i= Edit_Notice_List.newIntent(getApplicationContext());
                startActivity(i);
            }
        });

        txt_NoticeImages =(TextView)findViewById(R.id.noticesimage);
        txt_NoticeImages.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=Notice_Images.newIntent(getApplicationContext());
                startActivity(i);
            }
        });

        txt_Events =(TextView)findViewById(R.id.events);
        txt_Events.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=Events.newIntent(getApplicationContext());
                startActivity(i);
            }
        });
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, Noticeboard.class);
        return i;
    }
}

