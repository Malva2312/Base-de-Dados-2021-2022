# -*- coding: utf-8 -*-
"""
Created on Wed Dec  1 23:43:52 2021

@author: asus
"""

import urllib.request
import pandas as pd
from bs4 import BeautifulSoup

"""
url1 = "https://olympics.com/en/athletes/simone-biles#b2p-athlete-olympic-results"
url2 = "https://olympics.com/en/athletes/michael-phelps-ii"
url = "https://olympics.com/en/athletes/"
request = urllib.request.Request(url)
response = urllib.request.urlopen(request)
print (response.read().decode('utf-8'))
"""

df = pd.read_excel('Athletes.xlsx', "Details")
#for athlete in df:
#    print(athlete)
b = [1, 2, 3]
i = -1


file = open("AthletesList.txt", "r")
aths = file.readlines()
for a in aths:
    print(a[0:a.find(" \n")])
file.close()

for ath in aths:
    i += 1
    print(i)
    ath = ath[0:ath.find(" \n")]
    name = ath
    ath = ath.casefold()
    a = ath.find(" ")
    name = name[a+1::] + " " +  name[0:a]
    ath = ath.replace(" ", "-")
    req = urllib.request.Request("https://olympics.com/en/athletes/" + ath + "#b2p-athlete-olympic-results", headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36","X-Requested-With": "XMLHttpRequest"})
    page = urllib.request.urlopen(req)
    bs = BeautifulSoup(page,"html.parser")
    
    #print(bs)
    gold = 0
    silver = 0
    bronze = 0
    birth_year = None
    if bs.main == None:
        req = urllib.request.Request("https://olympics.com/en/athletes/" + ath[a+1::] + "-" +  ath[0:a] + "#b2p-athlete-olympic-results", headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36","X-Requested-With": "XMLHttpRequest"})
        page = urllib.request.urlopen(req)
        bs = BeautifulSoup(page,"html.parser")
        
        #print(bs)
        gold = 0
        silver = 0
        bronze = 0
        birth_year = None
        if bs.main == None:
            print(ath)
            continue
        if bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -gold"}) != None:
            gold = bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -gold"}).span.text
        if bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -silver"}) != None:
            silver = bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -silver"}).span.text
        if bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -bronze"}) != None:
            bronze = bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -bronze"}).span.text
        if len(bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find_all("li", {"class": "detail__item text-small"})) > 2:
            birth_year = bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find_all("li", {"class": "detail__item text-small"})[2].find("div", {"class": "col-right"}).text
        #print("Name:", name, "\nGold:", gold,"\nSilver:", silver,"\nBronze:", bronze, "\nBirth Year:", birth_year)
        continue
    if bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -gold"}) != None:
        gold = bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -gold"}).span.text
    if bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -silver"}) != None:
        silver = bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -silver"}).span.text
    if bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -bronze"}) != None:
        bronze = bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find("span", {"class": "medal-count -bronze"}).span.text
    if len(bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find_all("li", {"class": "detail__item text-small"})) > 2:
        birth_year = bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find_all("li", {"class": "detail__item text-small"})[2].find("div", {"class": "col-right"}).text
    #print("Name:", name, "\nGold:", gold,"\nSilver:", silver,"\nBronze:", bronze, "\nBirth Year:", birth_year)
    