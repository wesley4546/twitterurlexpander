import pandas as pd
import requests
import urllib.request
import re
from bs4 import BeautifulSoup as bs


def get_title_tag(url):
    # gets page
    content = requests.get(url)

    # creates BS object
    soup = bs(content.content, "html.parser")

    # Finds Title
    title = soup.find("title").text.strip()

    return title


raw_output = pd.read_csv("data/output-2020-1-21.csv")
