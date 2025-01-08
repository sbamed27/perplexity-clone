from fastapi import FastAPI
from pydantic_models.chat_bot import ChatBot

app = FastAPI()

@app.get('/')
def splash():
    return 'Welcome Home'

@app.post('/chat')
def chat_endpoint(body: ChatBot):
    print(body.query)
    return body.query