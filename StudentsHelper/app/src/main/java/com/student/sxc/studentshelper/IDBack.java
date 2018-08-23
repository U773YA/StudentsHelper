package com.student.sxc.studentshelper;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TableLayout;
import android.widget.TextView;

public class IDBack extends AppCompatActivity {
    TableLayout mTableLayout;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_idback);

        SingletonClass obj=SingletonClass.getInstance();
        mTableLayout =(TableLayout)findViewById(R.id.tl);
        mTableLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent=new Intent(IDBack.this, IDFront.class);
                startActivity(intent);
                overridePendingTransition(R.anim.from_middle, R.anim.to_middle);
            }
        });

        TextView Guardian=(TextView)findViewById(R.id.gname);
        Guardian.setText(obj.getStudent().getGuardian());
        TextView Address=(TextView)findViewById(R.id.address);
        Address.setText(obj.getStudent().getAddress());
        TextView Phone=(TextView)findViewById(R.id.phone);
        Phone.setText(obj.getStudent().getMob());
    }
    @Override
    protected void onPause(){
        super.onPause();
        finish();
    }
}

