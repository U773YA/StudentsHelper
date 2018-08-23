package com.student.sxc.studentshelper;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

import com.student.sxc.studentshelper.Networking.AsyncCallback;
import com.student.sxc.studentshelper.Networking.HttpGetAsync;

public class Edit_Notice_Page extends AppCompatActivity {

    private TextView txt_Date;
    private TextView txt_Header;
    private TextView txt_Body;

    private ProgressDialog load;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_notice);

        txt_Date = (TextView) findViewById(R.id.notice_date);
        txt_Header = (TextView) findViewById(R.id.notice_header);
        txt_Body = (TextView) findViewById(R.id.notice_body);

        final SingletonClass obj=SingletonClass.getInstance();
        final String notices=obj.getNotice();
        String asplit[]=notices.split(";");
        txt_Date.setText(asplit[1]);
        txt_Header.setText(asplit[0]);

        final String ipaddress=QueryPreferences.getipaddress(getApplicationContext());

        String uri= Uri.parse("http://"+ipaddress+"/notices/"+asplit[0]+".txt").buildUpon().build().toString();

        new HttpGetAsync(uri, new AsyncCallback() {
            @Override
            public void onStart() {
                load=ProgressDialog.show(Edit_Notice_Page.this,"","loading");
            }

            @Override
            public void onFinish(String jsonReceive) {
                load.cancel();
                txt_Body.setText(jsonReceive);
            }
        }).execute();
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, Edit_Notice_Page.class);
        return i;
    }
}
