from fastapi import FastAPI
from pydantic_models.chat_bot import ChatBot
from services.search import Search

app = FastAPI()
search = Search()

@app.get('/')
def splash():
    return 'Welcome Home'

@app.post('/chat')
def chat_endpoint(body: ChatBot):
    search_results = search.web_search(body.query)
    return search_results