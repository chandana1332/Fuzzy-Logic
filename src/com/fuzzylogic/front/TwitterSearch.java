package com.fuzzylogic.front;

import java.util.ArrayList;
import java.util.List;

import twitter4j.*;
import twitter4j.conf.ConfigurationBuilder;

public class TwitterSearch {
	public ArrayList<String>  Search(String q) {
		
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		  .setOAuthConsumerKey("pPGwTalhC1GZPxXs5lMF1TREF")
		  .setOAuthConsumerSecret("KfwNETrnUu5vyK1FW6QL4PGGNXrBrRqQnKSAJ46jEIc0UFdI3o")
		  .setOAuthAccessToken("203962770-ro0YgSyo5DoS1XOu0U1AEBXOs7kQTg1tae3f2fB9")
		  .setOAuthAccessTokenSecret("7Z9SHgo2J6oe5DckhESwgiXLbv5BuB2alf37c1jGKablO");
		TwitterFactory tf = new TwitterFactory(cb.build());
		Twitter twitter = tf.getInstance();
		//String t[]=new String[100];
		ArrayList<String> results = new ArrayList<String>();
		int count=0;
		try {
		Query query = new Query(q);
		QueryResult result;
			result = twitter.search(query);
			List<Status> tweets = result.getTweets();
			for (Status tweet : tweets) {
				//t[count++]="@" + tweet.getUser().getScreenName() + " - " + tweet.getText();
				count++;
				results.add("@" + tweet.getUser().getScreenName() + " - " + tweet.getText());
				if(count == 25)
					break;
			}
		
//		System.exit(0);
		} catch (TwitterException te) {
			te.printStackTrace();
			System.out.println("Failed to search tweets: " + te.getMessage());
			System.exit(-1);
		}
		return results;
	}
	
	
	public ArrayList<String> searchTweets(String query){
		ArrayList<String> results = Search(query);
		
		if(results.isEmpty()){
			String [] strQueries = query.split("\\+");
			for(int i = 0; i < strQueries.length; i++){
				if(!strQueries[i].equals("")){
					ArrayList<String> temp = Search(strQueries[i]);
					results.addAll(temp);
				}
			}
		}
		
		return results;
	}
}
