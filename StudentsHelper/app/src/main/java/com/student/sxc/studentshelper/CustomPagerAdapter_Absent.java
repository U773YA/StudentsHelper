package com.student.sxc.studentshelper;

import android.content.Context;
import android.support.v4.view.PagerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;

public class CustomPagerAdapter_Absent extends PagerAdapter {

    private Context mContext;
    ArrayList<String> mResources;

    public CustomPagerAdapter_Absent(Context context, ArrayList<String> ar){
        mContext=context;
        mResources=ar;
    }
    @Override
    public int getCount() {
        return mResources.size();
    }

    @Override
    public boolean isViewFromObject(View view, Object object) {
        return view==(object);
    }
    @Override
    public Object instantiateItem(ViewGroup container, int position) {
        LayoutInflater layoutInflater=LayoutInflater.from(mContext);
        ViewGroup layout=(ViewGroup)layoutInflater.inflate(R.layout.absent_pager_item,container,false);
        TextView dept=(TextView)layout.findViewById(R.id.dept);
        TextView date=(TextView)layout.findViewById(R.id.date);
        TextView proff=(TextView)layout.findViewById(R.id.proff);
        String x=mResources.get(position);
        String asplit[]=x.split(";");
        dept.setText(asplit[0]);
        proff.setText(asplit[1]);
        date.setText(asplit[2]);
        container.addView(layout);
        return layout;
    }
    @Override
    public void destroyItem(ViewGroup container, int position, Object object) {
        container.removeView((View) object);
    }

}

