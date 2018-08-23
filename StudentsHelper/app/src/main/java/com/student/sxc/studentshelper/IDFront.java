package com.student.sxc.studentshelper;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.student.sxc.studentshelper.Networking.DownloadImageTask;

public class IDFront extends AppCompatActivity {
    LinearLayout mLinearLayout;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_idfront);

        SingletonClass obj=SingletonClass.getInstance();
        mLinearLayout =(LinearLayout)findViewById(R.id.ll);
        mLinearLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent=new Intent(IDFront.this, IDBack.class);
                startActivity(intent);
                overridePendingTransition(R.anim.from_middle, R.anim.to_middle);
            }
        });
        TextView DOB=(TextView)findViewById(R.id.dob);
        DOB.setText("D.O.B.:    "+obj.getStudent().getDob());
        TextView Blood=(TextView)findViewById(R.id.blood);
        Blood.setText("BLOOD Gr. : "+obj.getStudent().getBlood());
        TextView Name=(TextView)findViewById(R.id.name);
        Name.setText(obj.getStudent().getName());
        TextView Roll=(TextView)findViewById(R.id.roll);
        Roll.setText(obj.getStudent().getCin().substring(13));
        ImageView Picture=(ImageView)findViewById(R.id.pic);
        new DownloadImageTask(Picture).execute("http://" + QueryPreferences.getipaddress(getApplicationContext()) + "/images/Student_Images/" + obj.getStudent().getImagename());
    }
    @Override
    protected void onPause(){
        super.onPause();
        finish();
    }
}
