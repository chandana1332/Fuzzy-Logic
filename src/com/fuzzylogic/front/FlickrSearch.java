package com.fuzzylogic.front;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import javax.xml.namespace.QName;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

public class FlickrSearch {

    @SuppressWarnings({ "deprecation", "rawtypes" })
	public ArrayList<String> Search(String q) throws Exception {
    	System.setProperty("http.agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.29 Safari/537.36");
    	String u="https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=95fff8210b6abc29c02b9fe724a47b13&per_page=15&text="+q;
        HttpURLConnection uc = (HttpURLConnection)new URL(u).openConnection();
       // uc.addRequestProperty("User-Agent", "Mozilla/4.76");
         
        //uc.connect();
        //String str = uc.getContentType();
        //String strTemp = (String)uc.getContent();
        DataInputStream dis = new DataInputStream(uc.getInputStream());
        
        FileWriter fw = new FileWriter(new File("Hello1.xml"));
        String nextline;
        String[] servers = new String[100];
        String[] ids = new String[100];
        String[] secrets = new String[100];
        //String url[]=new String[100];
        ArrayList<String> results = new ArrayList<String>();
        while ((nextline = dis.readLine()) != null) {
        	

			Charset charset = Charset.forName("UTF-8");
			nextline = charset.decode(charset.encode(nextline)).toString();

        	
            fw.append(nextline);
        }
        dis.close();
        
        fw.close();
        String filename = "Hello1.xml";
        XMLInputFactory factory = XMLInputFactory.newInstance();
        

        XMLEventReader r = factory.createXMLEventReader(filename, new FileInputStream(filename));
        
        int i = -1;
        while (r.hasNext()) {

            XMLEvent event = r.nextEvent();
            if (event.isStartElement()) {
                StartElement element = (StartElement) event;
                String elementName = element.getName().toString();
                if (elementName.equals("photo")) {
                    i++;
                    Iterator iterator = element.getAttributes();

                    while (iterator.hasNext()) {

                        Attribute attribute = (Attribute) iterator.next();
                        QName name = attribute.getName();
                        String value = attribute.getValue();
                        
                        if ((name.toString()).equals("server")) {
                            servers[i] = value;
                            
                        }
                        if ((name.toString()).equals("id")) {
                            ids[i] = value;
                        }
                        if ((name.toString()).equals("secret")) {
                            secrets[i] = value;
                        }
                        //url[i]="http://static.flickr.com/" + servers[i] + "/" + ids[i] + "_" + secrets[i] + ".jpg";
                        results.add("http://static.flickr.com/" + servers[i] + "/" + ids[i] + "_" + secrets[i] + ".jpg");
                    }
                }
            }
        }
       
        HashSet<String> hs = new HashSet<String>();
        hs.addAll(results);
        results.clear();
        results.addAll(hs);
        
        return results;
    }
}