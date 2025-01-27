# Perplexity-Clone Project

## Setting Up the Virtual Environment

To set up and activate the virtual environment for this project, set the current location at "perplexity-clone/server" and follow these steps:

1. **Create a Virtual Environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate # On Windows: ./venv/scripts/activate
   pip install -r requirements.txt
   ```

2. **Launch the Server**:
   ```bash
   fastapi dev main.py
   ```
   Then open the browser and enter this link: [http://localhost:8000](http://localhost:8000).

## Project Overview
This Project which I have developed, is a clone of Perplexity ai chatbot, built to test and enhance my developing skills using Flutter for the front end and FastAPI for the backend. What's below is a collection of the tools and technologies that I have used in the server-side implementation:

- **tavilyclient**: Used it to search the web and fetch relevant sources.
- **trafilatura**: Extracts content from the fetched sources.
- **SentenceTransformers**: Embeds the obtained sources to sort them by relevance.
- **Gemini**: Generates a response to the user's query based on the context derived from the sorted sources.
- **WebSockets**: Sends the generated response in chunks to the front-end interface for real-time updates.

## Workflow
1. **User Query**:
   The user submits a query through the Flutter TextField on the interface.

2. **Search and Fetch Sources**:
   - The query is sent to the backend.
   - `tavilyclient` performs a web search to find relevant sources.

3. **Content Extraction**:
   - `trafilatura` extracts meaningful content from the fetched sources.

4. **Relevance Sorting**:
   - `SentenceTransformers` embeds and ranks the sources by relevance to the query.

5. **Response Generation**:
   - `Gemini` generates a response to the query, leveraging the sorted sources as context.

6. **Real-time Response Delivery**:
   - The generated response is sent to the front-end via WebSockets in chunks for a seamless real-time display to the user.

## Notes
- Ensure that the `requirements.txt` file includes all necessary dependencies for the project, such as `tavilyclient`, `trafilatura`, `SentenceTransformers`, and `Gemini`.
- The server-side code uses FastAPI for routing, handling WebSockets, and managing requests.
- The Flutter front-end for handling WebSocket communication efficiently to display chunks of the response when they arrive in real-time.
