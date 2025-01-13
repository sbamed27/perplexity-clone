from fastapi import FastAPI
from pydantic_models.chat_bot import ChatBot
from services.source_sort import SourceSort
from services.search import Search

app = FastAPI()
search = Search()
source_sort = SourceSort()

@app.get('/')
def splash():
    return 'Welcome Home'

@app.post('/chat')
def chat_endpoint(body: ChatBot):
    search_results = search.web_search(body.query)
    sorted_results = source_sort.sort(body.query, search_results)
    print(sorted_results)
    return body.query