# -*- coding: utf-8 -*-
"""
Created on Mon Dec  6 00:02:56 2021

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


#athWb = load_workbook(filename="new_datasets/olympic_results.xlsx")
athWb = load_workbook(filename="new_datasets/DummyExcel.xlsx")

print("loaded")
ath_sheet = athWb.active

file_pos = 0

total = (len(ath_sheet["A"])+1)//2

for i in range((len(ath_sheet["A"])+1)//2):
    if i == 0:
        sheet["A" + "1"].value = ath_sheet["A"][0].value
        sheet["B" + "1"].value = ath_sheet["B"][0].value
        sheet["C" + "1"].value = ath_sheet["C"][0].value
        sheet["D" + "1"].value = ath_sheet["D"][0].value
        sheet["E" + "1"].value = ath_sheet["E"][0].value
        sheet["F" + "1"].value = ath_sheet["F"][0].value
        sheet["G" + "1"].value = ath_sheet["G"][0].value
        sheet["H" + "1"].value = ath_sheet["H"][0].value
    else:
        print(ath_sheet["B"][2*i-1].value)
        sheet["A" + str(i)].value = ath_sheet["A"][2*i-1].value
        sheet["B" + str(i)].value = ath_sheet["B"][2*i-1].value
        sheet["C" + str(i)].value = ath_sheet["C"][2*i-1].value
        sheet["D" + str(i)].value = ath_sheet["D"][2*i-1].value
        sheet["E" + str(i)].value = ath_sheet["E"][2*i-1].value
        sheet["F" + str(i)].value = ath_sheet["F"][2*i].value
        sheet["G" + str(i)].value = ath_sheet["G"][2*i].value
        sheet["H" + str(i)].value = ath_sheet["H"][2*i].value
    print(i, total)
        
    


    

workbook.save(filename = "final_datasets/hello_world.xlsx")