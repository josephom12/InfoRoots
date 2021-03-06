DROP TABLE IF EXISTS articles;

CREATE TABLE articles (
  article_id VARCHAR(255) PRIMARY KEY,
  article_title VARCHAR(255),
  article_content TEXT,
  publisher_name VARCHAR(255),
  author_name VARCHAR(255),
  author_page_link VARCHAR(255)
);

DROP TABLE IF EXISTS articles_credibility;

CREATE TABLE articles_credibility (
  article_id VARCHAR(255) PRIMARY KEY,
  reliability_score FLOAT,
  bias_score FLOAT
);

DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
    author_id VARCHAR(255) PRIMARY KEY,
    author_name VARCHAR(255),
    author_intro TEXT,
    author_article_list TEXT[]
);

DROP TABLE IF EXISTS authors_credibility ;


CREATE TABLE authors_credibility (
    author_id VARCHAR(255) PRIMARY KEY,
    author_reliability_score FLOAT,
    author_bias_score FLOAT
);


DROP TABLE IF EXISTS publishers;

CREATE TABLE publishers (
    publisher_id VARCHAR(255) PRIMARY KEY,
    publisher_name VARCHAR(255),
    publisher_intro TEXT,
    publisher_reliability_score FLOAT
);

DROP TABLE IF EXISTS citations;

CREATE TABLE citations (
    article_id VARCHAR(255) PRIMARY KEY,
    article_paragraphs TEXT[],
    citation_links TEXT[]
);