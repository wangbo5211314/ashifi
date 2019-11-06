import pickle
from mypinyin import Pinyin
import random

# 获取字典
with open('./poemDict.pk', 'rb') as f:#rb二进制读的方式
    poem_dict = pickle.load(f)#打开字典文件

MODE = str(input('请选择：(1、人工接龙, 2、机器接龙): '))#控制台输入
while True:
    try:
        if MODE == '1':#若是1，则选择人工输入
            enter = str(input('\n请输入一句诗开始：'))
            while enter != 'exit':
                test = Pinyin().get_pinyin(enter, tone_marks='marks', splitter=' ')#每个字的拼音
                tail = test.split()[-1]#获取到该句诗的最后一个字
                if tail not in poem_dict.keys():#如果没有在字典中找到这个字
                   print('无法接这句诗。\n')#显示无法接这句诗
                   MODE = 0#未找到数据时将模式设置为0
                   break#进行中断，退出该模式
                else:
                    print('\n机器回复：%s'%random.sample(poem_dict[tail], 1)[0])#如果找到的话，电脑从字典中随机获取一句诗
                    enter = str(input('您的回复：'))[-1]#获取你输入在控制台的诗词中的最后一个数字，再次进行循环查找
        #MODE = 0
        if MODE == '2':#若是二，则选用机器输入
            enter = input('\n请输入一句诗开始：')
            for i in range(15):#循环15次
                test = Pinyin().get_pinyin(enter, tone_marks='marks', splitter=' ')
                tail = test.split()[-1]#获取每一次循环得到诗句的最后一个字
                if tail not in poem_dict.keys():
                    print('------>无法接下去了...')
                    MODE = 0
                    break#如果关键字在字典的关键字中没有找到，则进行退出
                else:
                    #如果找到就随机从字典中获取关键字的其中一句
                    answer = random.sample(poem_dict[tail], 1)[0]
                    print('（%d）--> %s' % (i+1, answer))
                    enter = answer[:-1]
            print('\n（*****最多展示前15回接龙。*****）')
            MODE = 0
    except Exception as err:
        print(err)
    finally:#当出现所有错误时，则返回选择项（就是mode0或者是mode1）
        if MODE not in ['1','2']:
            MODE = str(input('\n请选择：(1、人工接龙, 2、机器接龙): '))
