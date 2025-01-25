from fastapi import FastAPI, WebSocket
from pydantic_models.chat_bot import ChatBot
from services.llm import LLM
from services.source_sort import SourceSort
from services.search import Search

app = FastAPI()
search = Search()
source_sort = SourceSort()
llm = LLM()

@app.get('/')
def splash():
    return 'Welcome Home'

@app.websocket('/ws/chat')
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        data = await websocket.receive_json()
        query = data.get("query")
        search_results = search.web_search(query)
        sorted_results = source_sort.sort(query, search_results)
        await websocket.send_json({
            "type": "search_result",
            "data": sorted_results,
        })
        for chunk in llm.generate_response(query, sorted_results):
            await websocket.send_json({"type": "content", "data": chunk})

    except Exception as e:
        print('Unexpected error occured: ', e)
    finally:
        await websocket.close()

@app.post('/chat')
def chat_endpoint(body: ChatBot):
    search_results = search.web_search(body.query)
    sorted_results = source_sort.sort(body.query, search_results)
    response = llm.generate_response(body.query, sorted_results)
    return response