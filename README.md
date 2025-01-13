"# perplexity-clone" 

## Setting Up the Virtual Environment

To set up and activate the virtual environment for this project, set the current location at "perplexity-clone/server" and follow these steps:

1. **Create a Virtual Environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate #On Windows: ./venv/scripts/activate
   pip install -r requirements.txt
   ```
2. **Launch the server**:
    ```bash
    fastapi dev main.py
    ```
    Then open the browser and enter this link: localhost:8000