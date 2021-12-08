# -*- coding: utf-8 -*-
"""
Created on Sun Dec  5 19:08:19 2021

@author: asus
"""

from openpyxl import Workbook
from openpyxl import load_workbook
import urllib.request
import pandas as pd
from bs4 import BeautifulSoup
from string import ascii_uppercase



workbook = Workbook()


sheet = workbook.active

req = urllib.request.Request("https://olympics.com/ioc/national-olympic-committees", headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36","X-Requested-With": "XMLHttpRequest"})
page = urllib.request.urlopen(req)
bs = BeautifulSoup(page,"html.parser")

#bs.main.section.div.find("div", {"class": "athlete__detail b2p-col__3"}).find_all("li", {"class": "detail__item text-small"}))

a = bs.find("div", {"class": "main"}).div.find("section", {"class": "container mt-0"}).div.find_all("a", href=True)

sheet["B1"].value = "abbreviation"
sheet["C1"].value = "title"
sheet["D1"].value = "logo"
sheet["E1"].value = "recognitionDate"

total = len(a)
for i in range(len(a)):
    req2 = urllib.request.Request("https://olympics.com" + a[i]['href'], headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36","X-Requested-With": "XMLHttpRequest"})
    page2 = urllib.request.urlopen(req2)
    cs = BeautifulSoup(page2,"html.parser")
    
    sheet["B" + str(i+2)].value = cs.find("div", {"class": "ml-2"}).text
    sheet["C" + str(i+2)].value = cs.find("span", {"class": "identity-card-heading informations-item-text"}).text.strip()
    b = cs.find_all("div", {"class": "d-flex col-12 align-items-center justify-content-between"})
    sheet["D" + str(i+2)].value = "/logos/" + cs.find("div", {"class": "ml-2"}).text + ".jpg"
    for u in b:
        v = u.find_all("span")
        if v[0].text.strip() == "Recognition Date":
            sheet["E" + str(i+2)].value = v[1].text.strip()
    print(i, total)
    #abv
    #title
    #recogn



workbook.save(filename = "final_datasets/olympic_committee.xlsx")