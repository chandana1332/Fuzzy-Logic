package com.fuzzylogic.front;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

public class NewsSearch {

	private LinkedHashMap<String, String> searchString(String query) {
		String urlString = "http://localhost:8983/solr/newscore";
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
		
		LinkedHashMap<String, String> highlightSnippets = new LinkedHashMap<String, String>();
		SolrDocumentList list = new SolrDocumentList();
		try {
			response = solr.query(parameters);
			
			
			
			list = response.getResults();
			
			Iterator<SolrDocument> iter = list.iterator();
			
		    while (iter.hasNext()) {
		      SolrDocument resultDoc = iter.next();

		      String id = (String) resultDoc.getFieldValue("id"); //id is the uniqueKey field
		      //float score = (float) resultDoc.getFieldValue("score");
		      List <String> tempTitleList = new ArrayList<String>();
		      List <String> tempContentList = new ArrayList<String>();
		      if (response.getHighlighting().get(id) != null) {
		        tempTitleList.addAll(response.getHighlighting().get(id).get("title"));
		        String strTitle = tempTitleList.toString();
		        strTitle = strTitle.replaceAll("\\[", "").replaceAll("\\]","");
		        tempContentList.addAll(response.getHighlighting().get(id).get("content"));
		        String strContent = tempContentList.toString();
		        strContent = strContent.replaceAll("\\[", "").replaceAll("\\]","");
		        highlightSnippets.put(strTitle, strContent);
		        
		      }
		    }
			
			//JSONObject returnResults = new JSONObject();
			
//			Map<Integer, Object> solrDocMap = new HashMap<Integer, Object>();
//			int counter = 1;
//			for(Map singleDoc : list)
//			{
//			  solrDocMap.put(counter, new JSONObject(singleDoc));
//			  counter++;
//			}
//			returnResults.put("docs", solrDocMap);
//			String str = "abc";
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		return highlightSnippets;
	}
	
	public LinkedHashMap<String, String> searchNews(String query){
		LinkedHashMap<String, String> highlightSnippets = searchString(query);
		
		if(highlightSnippets.isEmpty()){
			String [] strQueries = query.split("\\+");
			for(int i = 0; i < strQueries.length; i++){
				if(!strQueries[i].equals("")){
					LinkedHashMap<String, String> temp = searchString(strQueries[i]);
					highlightSnippets.putAll(temp);
				}
			}
		}
		
		return highlightSnippets;
	}

}
