# local-file-uploader

A minimal, production-ready file upload microservice built using FastAPI, Docker, Ruff, and Black, with automated CI checks using GitHub Actions.

This project is the first mini-project in your backend systems roadmap — teaching fundamentals of:
* file uploads
* multipart form handling
* serving static files
* containerizing Python apps
* setting up CI with formatting + linting

## Features

**`/upload` endpoint**  
Upload any file via POST:

```json
{
  "file_url": "http://localhost:8000/uploads/myvideo.mp4"
}
```

**Saves file locally**  
Uploaded files are stored inside:

```
/uploads/
```

**Static file serving**  
Files can be accessed directly via returned URLs.

**Dockerized**  
Fully reproducible using:

```bash
docker build -t fastapi-uploader .
docker run -p 8000:8000 fastapi-uploader
```

**CI with Ruff + Black**  
GitHub Actions automatically:
* checks formatting with Black
* checks linting with Ruff
* fails PRs if code isn't clean

## Project Structure

```
fastapi-file-uploader/
│
├── main.py              # FastAPI application
├── uploads/             # Auto-created folder for uploaded files
├── requirements.txt     # Python dependencies
├── Dockerfile           # Container build
└── .github/
    └── workflows/
        └── ci.yml       # Lint + format checks
```

## Installation (local)

### 1: Clone the repo

```bash
git clone https://github.com/<your-username>/fastapi-file-uploader.git
cd fastapi-file-uploader
```

### 2️: Install dependencies

```bash
pip install -r requirements.txt
```

### 3️: Run server

```bash
uvicorn main:app --reload
```

Server runs on:

```
http://localhost:8000
```

## Run with Docker

Build image:

```bash
docker build -t fastapi-uploader .
```

Run container:

```bash
docker run -p 8000:8000 fastapi-uploader
```

Uploaded files are stored inside the container's `/app/uploads/` folder.

If you want the files to save on your actual PC, run with a volume:

```bash
docker run -p 8000:8000 -v ./uploads:/app/uploads fastapi-uploader
```

## Upload a File

You can test using Swagger UI:

```
http://localhost:8000/docs
```

Or via curl:

```bash
curl -X POST -F "file=@yourfile.mp4" http://localhost:8000/upload
```

## CI/CD – Ruff & Black

This repo includes a full GitHub Actions workflow that:
* Ensures clean formatting (Black)
* Ensures clean linting (Ruff)
* Fails if anything is wrong

Located at:

```
.github/workflows/ci.yml
```