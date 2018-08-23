package com.student.sxc.studentshelper;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.student.sxc.studentshelper.Networking.AsyncCallback;
import com.student.sxc.studentshelper.Networking.HttpGetAsync;
import com.rengwuxian.materialedittext.MaterialEditText;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ChangePasswordpost extends AppCompatActivity {

    private MaterialEditText edit_oldpassword;
    private MaterialEditText edit_newpassword;
    private MaterialEditText edit_confirm;
    private TextView text_message;
    private Button button_submit;

    private final SingletonClass obj= SingletonClass.getInstance();

    @Override
    public void onCreate(Bundle savedInstanceState){

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_changepassword);

        obj.state_change_password=true;

        edit_oldpassword=(MaterialEditText)findViewById(R.id.oldpassword);
        edit_newpassword=(MaterialEditText)findViewById(R.id.newpassword);
        edit_confirm=(MaterialEditText)findViewById(R.id.confirm);
        text_message=(TextView)findViewById(R.id.message);
        button_submit=(Button)findViewById(R.id.button_submit);

        final String cin=QueryPreferences.getcinnumber(ChangePasswordpost.this);

        button_submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(edit_oldpassword.getText().toString().isEmpty() || edit_newpassword.getText().toString().isEmpty() || edit_confirm.getText().toString().isEmpty()){
                    Toast.makeText(ChangePasswordpost.this, "A field cannot be blank.", Toast.LENGTH_SHORT).show();
                }else if(!(edit_newpassword.getText().toString().equalsIgnoreCase(edit_confirm.getText().toString()))){
                    Toast.makeText(ChangePasswordpost.this,"The passwords does not match", Toast.LENGTH_SHORT).show();
                }else{
                    String ipaddress=QueryPreferences.getipaddress(ChangePasswordpost.this);
                    if(ipaddress.isEmpty()){
                        Toast.makeText(ChangePasswordpost.this, "IP Address not given.", Toast.LENGTH_SHORT).show();
                    }else{
                        String uri= Uri.parse("http://"+ipaddress+"/myapp/change_password.php?").buildUpon()
                                .appendQueryParameter("cin",cin)
                                .appendQueryParameter("old_pass",edit_oldpassword.getText().toString())
                                .appendQueryParameter("new_pass",edit_newpassword.getText().toString())
                                .build().toString();
                        new HttpGetAsync(uri, new AsyncCallback(){

                            @Override
                            public void onStart() {}

                            @Override
                            public void onFinish(String jsonReceive) {
                                if (!jsonReceive.isEmpty()) {
                                    try {
                                        JSONObject jsonObj=new JSONObject(jsonReceive);
                                        JSONArray jsonArray=jsonObj.getJSONArray("result");
                                        JSONObject j=jsonArray.getJSONObject(0);
                                        String result=j.getString("result");
                                        if(result.equalsIgnoreCase("failed")){
                                            text_message.setText("Wrong Password given!");
                                            edit_oldpassword.setText("");
                                            edit_newpassword.setText("");
                                            edit_confirm.setText("");
                                        }else if(result.equalsIgnoreCase("success")){
                                            text_message.setText("Password successfully reset.");
                                        }
                                    }catch (JSONException e) {
                                        Log.e("JSONError", "JSON Parsing error");
                                    }
                                }else{
                                    Toast.makeText(ChangePasswordpost.this,"IP Address error.", Toast.LENGTH_SHORT).show();
                                }
                            }
                        }).execute();
                    }
                }
            }
        });
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.mainmenu, menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menu_item_ipaddress:
                LayoutInflater inflater = getLayoutInflater();
                View view = null;
                view  = inflater.inflate(R.layout.dialog_ipaddress, null);
                final EditText text=(EditText)view.findViewById(R.id.editText_ip);
                String myString=QueryPreferences.getipaddress(ChangePasswordpost.this);
                text.setText(myString);
                new AlertDialog.Builder(this)
                        .setTitle("Add IpAddress")
                        .setView(view)
                        .setPositiveButton("OK",
                                new DialogInterface.OnClickListener(){
                                    public void onClick(DialogInterface dialog, int which){
                                        QueryPreferences.setipaddress(ChangePasswordpost.this,text.getText().toString());
                                    }
                                })
                        .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.cancel();
                            }
                        }).show();
                return true;
            default:return false;
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        if(!(obj.state_change_password))
            finish();
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, ChangePasswordpost.class);
        return i;
    }
}
