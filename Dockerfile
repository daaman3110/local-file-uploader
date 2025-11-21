# Base Image: lightweight Python with Linux Tools
FROM python:3.11-slim

# Set Working directory inside container
WORKDIR /app

# Copy Requirements file first (for caching)
COPY requirements.txt . 

# Install Dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Create uploads directory inside container
RUN mkdir -p uploads

# Expose port used by uvicorn
EXPOSE 8000

# Command to run FastAPI inside container
CMD [ "uvicorn","main:app", "--host", "0.0.0.0", "--port", "8000" ]