'''
NELAdapter is designed to use NELA toolkit library through Adapter Pattern Design
The NELA toolkit has a chaotic structure, but we need its functionality in the compatible way
to generate bias scores and reliability scores for article.

NELA toolkits does not have any class, so we will directly use its function to fit in our functionality.

'''

from NELA.credibility_toolkit import parse_text
import math


class NELAdapter:

    def __init__(self, article_title, article_content):
        # decode title and content
        # decoded_article_title = article_title.encode("gbk", 'ignore').decode("gbk", "ignore")
        # decoded_article_content = article_content.encode("gbk", 'ignore').decode("gbk", "ignore")
        self.NELA = parse_text(article_title, article_content.replace(u"\u2022", u" "))



    def scale_factor(self, value):
        # new_value = value * 2.22 - 0.88
        # if new_value < 0:
        #     return 0
        return value

    def get_reliability_score(self):
        '''
        The higher score mean more reliable writing
        :return: reliability score of one article based on NELA
        '''
        for item in self.NELA:
            if item["name"] == "fake_filter":
                for score_name, score in item["result"]:
                    if score_name == 'Reliable Writing Style':
                        return score

    def get_bias_score(self):
        '''
        The higher score mean more bias writing
        :return: bias score of one article based on NELA
        '''
        for item in self.NELA:
            if item["name"] == "bias_filter":
                for score_name, score in item["result"]:
                    if score_name == 'Biased Writing Style':
                        return score

