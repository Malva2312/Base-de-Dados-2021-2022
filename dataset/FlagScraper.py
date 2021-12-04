# -*- coding: utf-8 -*-
"""
Created on Fri Dec  3 19:26:13 2021

@author: asus
"""


import urllib.request
import pandas as pd
from bs4 import BeautifulSoup
import requests
import shutil

"""
url1 = "https://olympics.com/en/athletes/simone-biles#b2p-athlete-olympic-results"
url2 = "https://olympics.com/en/athletes/michael-phelps-ii"
url = "https://olympics.com/en/athletes/"
request = urllib.request.Request(url)
response = urllib.request.urlopen(request)
print (response.read().decode('utf-8'))
"""

"""
df = pd.read_excel('Teams.xlsx', "Details")
#for athlete in df:
#    print(athlete)



file = open("AthletesList.txt", "r")
aths = file.readlines()
for a in aths:
    print(a[0:a.find(" \n")])
file.close()
"""


req = urllib.request.Request("https://olympics.com/ioc/national-olympic-committees", headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36","X-Requested-With": "XMLHttpRequest"})
page = urllib.request.urlopen(req)
bs = BeautifulSoup(page,"html.parser")

#bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find_all("li", {"class": "detail__item text-small"}))

a = bs.find("div", {"class": "main"}).div.find("section", {"class": "container mt-0"}).div.find_all("a", href=True)

for i in range(len(a)):
    #print(i, a[i]['href'])
    req2 = urllib.request.Request("https://olympics.com" + a[i]['href'], headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36","X-Requested-With": "XMLHttpRequest"})
    page2 = urllib.request.urlopen(req2)
    cs = BeautifulSoup(page2,"html.parser")
    #imgUrl = cs.body.find_all("div", {"class": "container-fluid"})[1].find_all("div", {"class": "row"})[1].img['src']
    #print(imgUrl)
    abb = cs.body.find("div", {"class": "ml-2"}).text
    #r = requests.get(imgUrl, stream=True) 
    #if r.status_code == 200:              
    #    with open("logos/" + abb + ".jpg", 'wb') as f: 
    #       r.raw.decode_content = True
    #       shutil.copyfileobj(r.raw, f)
    
    ### The flags are one huge slim image that just gets an offset, no need to scrape one by one ###
    #flagUrl = cs.body.find("div", {"class": "identity-card-heading informations-item-text d-flex align-items-center"}).div
    #print(flagUrl)
    #r2 = requests.get(flagUrl, stream=True) 
    #if r2.status_code == 200:              
    #    with open("flags/" + abb + ".jpg", 'wb') as f: 
    #       r2.raw.decode_content = True
    #       shutil.copyfileobj(r2.raw, f)
    