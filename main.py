from fastapi import FastAPI, UploadFile, File
from pathlib import Path

app = FastAPI()

UPLOAD_DIR = Path("uploads")
UPLOAD_DIR.mkdir(exist_ok=True)


@app.post("/upload")
async def upload_file(file: UploadFile = File(...)):
    file_path = UPLOAD_DIR / file.filename

    # Write file to disk
    with file_path.open("wb") as f:
        f.write(await file.read())

    return {"file_url": f"http://localhost:8000/uploads/{file.filename}"}
