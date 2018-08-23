package com.student.sxc.studentshelper;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;

import java.util.ArrayList;

public class AbsentTeachers extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.viewpager);
        SingletonClass obj=SingletonClass.getInstance();
        ArrayList<String> mResources=obj.getAbsent();
        ViewPager mViewPager=(ViewPager)findViewById(R.id.pager);
        mViewPager.setAdapter(new CustomPagerAdapter_Absent(this,mResources));
    }

    public static Intent newIntent(Context packageContext) {
        Intent i = new Intent(packageContext, AbsentTeachers.class);
        return i;
    }

    @Override
    public void onBackPressed(){
        super.onBackPressed();
        finish();
    }
}

