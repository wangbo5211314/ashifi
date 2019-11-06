import re
import pickle
from xpinyin import Pinyin
from collections import defaultdict
def main():
    with open('./poem.txt', 'r') as f:#通过读的方式打开poem.txt文件
        poems = f.readlines()#逐行读取
    sents = []#创建一个空的发送列表
    for poem in poems:#通过for循环的方式获取文件中读取的数据
        parts = re.findall(r'[\s\S]*?[。？！]', poem.strip())#通过正则表达式匹配相应的字符"。 ？ ！"，并将其去掉
        for part in parts:
            if len(part) >= 5:#如果获取诗句文字部分超过5个字符，则将其写入sents列表
                sents.append(part)
    poem_dict = defaultdict(list)
    for sent in sents:
        print(part)#通过循环打印的方式输出诗句
        head = Pinyin().get_pinyin(sent, tone_marks='marks', splitter=' ').split()[0]#通过Pinyin()方法，获取第一个字的拼音
        poem_dict[head].append(sent)
    with open('./poemDict.pk', 'wb') as f:
        pickle.dump(poem_dict, f)#此处通过序列化实现将poem_dict列表写入到poemDict.pk文件中
main()



