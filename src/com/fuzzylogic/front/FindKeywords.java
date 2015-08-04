package com.fuzzylogic.front;


import java.util.ArrayList;

import com.sharethis.textrank.TextRank;

public class FindKeywords {
	private static String strKeywords;
	public static String getKeywords(String id){
		ArrayList<DataInfo> dataList = Search.getDataList();
		String strContent = "";
		for(DataInfo data : dataList){
			if(Integer.parseInt(id) == data.getId()){
				strContent = data.getStrContent();
				break;
			}
		}
		try{
		    strKeywords = TextRank.getKeywords(strContent);
		    strKeywords = strKeywords.substring(0, strKeywords.length() - 1);
		    //System.out.println("Keywords = "+strKeywords);
		    
		}catch(Exception e){
			e.printStackTrace();
		}
		return strKeywords;
	}
	
	public static String getStrKeywords(){
		return strKeywords;
	}
}
