import re
import requests
from bs4 import BeautifulSoup
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
urls = ['https://so.gushiwen.org/gushi/tangshi.aspx',
        'https://so.gushiwen.org/gushi/sanbai.aspx',
        'https://so.gushiwen.org/gushi/songsan.aspx',
        'https://so.gushiwen.org/gushi/songci.aspx'
        ]
#url列表，里面是需要爬取的网站页面
poem_links = []#创建空列表
for url in urls:
    # 请求头部
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'}
    req = requests.get(url, headers=headers)#通过request方法请求url和相应的头部
    soup = BeautifulSoup(req.text, "lxml")#通过使用lxml HTML解析器来获取页面html标签
    content = soup.find_all('div', class_="sons")[0]#查找标签为div，class = sons的所有标签内容
    links = content.find_all('a')#查找“a”标签的所有内容
    for link in links:
        poem_links.append('https://so.gushiwen.org'+link['href']) #将所有的超链接添加至空列表中
poem_list = []#创建空列表用于接收
def get_poem(url):

    # 请求头部
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'}
    req = requests.get(url, headers=headers)
    soup = BeautifulSoup(req.text, "lxml")
    poem = soup.find('div', class_='contson').text.strip()
    poem = poem.replace(' ', '')
    poem = re.sub(re.compile(r"\([\s\S]*?\)"), '', poem)
    poem = re.sub(re.compile(r"（[\s\S]*?）"), '', poem)
    poem = re.sub(re.compile(r"。\([\s\S]*?）"), '', poem)
    poem = poem.replace('!', '！').replace('?', '？')
    poem_list.append(poem)

for url in poem_links:
    get_poem(url)#通过列表的方式来获取诗句
# 将爬取的诗句写入txt文件
poems = list(set(poem_list))#将爬取得诗句先通过set()方法去除重复的数据并将其转换为列表数据
poems = sorted(poems, key=lambda x:len(x))#将列表中的诗句按照长短进行排序
for poem in poems:
    poem = poem.replace('《','').replace('》','') \
               .replace('：', '').replace('“', '')
    print(poem)#按照上述格式进行输出
    with open('./poem.txt', 'a') as f:
        f.write(poem)#将poem写入文件poem1.txt中
        f.write('\n')

