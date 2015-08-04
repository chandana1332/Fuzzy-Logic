package com.fuzzylogic.front;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.SpellCheckResponse;
import org.apache.solr.client.solrj.response.SpellCheckResponse.Suggestion;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;


//import com.sharethis.textrank.TextRank;

public class Search {

	//private static ArrayList<String> keywords;
	private static ArrayList<DataInfo> dataList;

	public ArrayList<DataInfo> searchString(String query) {
		String urlString = "http://localhost:8983/solr/wikicore";
		SolrServer solr = new HttpSolrServer(urlString);
		SolrQuery parameters = new SolrQuery();
		parameters.setRequestHandler("/browse");
//		parameters.set("qt", "/spell");
		parameters.set("q", query);
		parameters.set("wt", "json");
		parameters.set("indent", "true");
		parameters.set("spellcheck", "true");
		parameters.addSort(SolrQuery.SortClause.desc("score"));
		QueryResponse response = new QueryResponse();
		SolrDocumentList list = new SolrDocumentList();
		
		
		LinkedHashMap<String, String> highlightSnippets = new LinkedHashMap<String, String>();
		ArrayList<DataInfo> highlightedDataList = new ArrayList<DataInfo>();
		try {

			response = solr.query(parameters);
			
			
			list = response.getResults();
			
			Iterator<SolrDocument> iter = list.iterator();
			
			//Build content string for keyword extraction
			//String strContentFull = "";
			
			//Initialise dataList
			dataList = new ArrayList<DataInfo>();
			
		    while (iter.hasNext()) {
		      SolrDocument resultDoc = iter.next();
		      DataInfo tempData = new DataInfo();
		      String id = (String) resultDoc.getFieldValue("id"); //id is the uniqueKey field
		      tempData.setId(Integer.parseInt(id));
		      tempData.setStrTitle((String) resultDoc.getFieldValue("title"));
		      String strFullContent = (String) resultDoc.getFieldValue("content");
		      strFullContent = Normalizer.normalize(strFullContent, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
		      tempData.setStrContent(strFullContent);
		      dataList.add(tempData);
		      //strContentFull = strContentFull + (String) resultDoc.getFieldValue("content") + " ";
		      
		      //Get Highlighted content
		      List <String> tempTitleList = new ArrayList<String>();
		      List <String> tempContentList = new ArrayList<String>();
		      DataInfo highlightedData = new DataInfo();
		      if (response.getHighlighting().get(id) != null) {
		        tempTitleList.addAll(response.getHighlighting().get(id).get("title"));
		        String strTitle = tempTitleList.toString();
		        strTitle = strTitle.replaceAll("\\[", "").replaceAll("\\]","");
		        strTitle = Normalizer.normalize(strTitle, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
		        tempContentList.addAll(response.getHighlighting().get(id).get("content"));
		        String strContent = tempContentList.toString();
		        strContent = strContent.replaceAll("\\[", "").replaceAll("\\]","");
		        strContent = Normalizer.normalize(strContent, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
		        highlightSnippets.put(strTitle, strContent);
		        
		        highlightedData.setId(Integer.parseInt(id));
		        highlightedData.setStrTitle(strTitle);
		        highlightedData.setStrContent(strContent);
		        
		        highlightedDataList.add(highlightedData);
		      }
		    }
		    
		    
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}catch (Exception e){
			e.printStackTrace();
		}
		return highlightedDataList;
	}
	
	public static ArrayList<DataInfo> getDataList() {
		return dataList;
	}

	public List<String> getCorrectSpellings(String query){
		List<String> strAlternatives = new ArrayList<String>();
		try{
			String urlString = "http://localhost:8983/solr/wikicore";
			SolrServer solr = new HttpSolrServer(urlString);
			SolrQuery parameters = new SolrQuery();
			parameters.setRequestHandler("/browse");
	//		parameters.set("qt", "/spell");
			parameters.set("q", query);
			parameters.set("wt", "json");
			parameters.set("indent", "true");
			parameters.set("spellcheck", "true");
			parameters.addSort(SolrQuery.SortClause.desc("score"));
			QueryResponse response = new QueryResponse();
			
			response = solr.query(parameters);
			SpellCheckResponse scr = response.getSpellCheckResponse();
			List<Suggestion> suggLst = scr.getSuggestions();
			
			for(Suggestion sugg : suggLst){
				strAlternatives = sugg.getAlternatives();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return strAlternatives;
	}
	
//	public ArrayList<String> getKeywords(){
//		return keywords;
//	}
	
}

