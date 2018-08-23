package com.student.sxc.studentshelper;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.student.sxc.studentshelper.Networking.AsyncCallback;
import com.student.sxc.studentshelper.Networking.HttpGetAsync;


public class Sem_Chooser extends AppCompatActivity {

    private Button[] btn_sem = new Button[6];

    SingletonClass obj=SingletonClass.getInstance();

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sembuttons);

        btn_sem[0]=(Button)findViewById(R.id.sem_1);
        btn_sem[1]=(Button)findViewById(R.id.sem_2);
        btn_sem[2]=(Button)findViewById(R.id.sem_3);
        btn_sem[3]=(Button)findViewById(R.id.sem_4);
        btn_sem[4]=(Button)findViewById(R.id.sem_5);
        btn_sem[5]=(Button)findViewById(R.id.sem_6);

        for (int i=0;i<6;i++){
            final int j=i+1;
            btn_sem[i].setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    String uri= Uri.parse("http://"+QueryPreferences.getipaddress(getApplicationContext())+"/myapp/marks_sem"+j+".php?").buildUpon().appendQueryParameter("reg",obj.getStudent().getReg()).build().toString();
                    new HttpGetAsync(uri, new AsyncCallback() {
                        @Override
                        public void onStart() {}

                        @Override
                        public void onFinish(String jsonReceive) {
                            if(!jsonReceive.isEmpty()){
                                Intent intent= Marks.newIntent(getApplicationContext());
                                intent.putExtra("json",jsonReceive);
                                intent.putExtra("sem",j);
                                startActivity(intent);
                            }else{
                                Toast.makeText(getApplicationContext(),"IP Address error.", Toast.LENGTH_SHORT).show();
                            }
                        }
                    }).execute();
                }
            });
        }
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, Sem_Chooser.class);
        return i;
    }
}

