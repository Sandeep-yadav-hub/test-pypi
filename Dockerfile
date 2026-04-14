FROM python:3.11-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy your dependency file first (for better caching)
COPY pyproject.toml .
# If you have a requirements.txt, use: COPY requirements.txt .

# 4. Install dependencies
RUN pip install --no-cache-dir .

# 5. Copy the rest of your source code
COPY . .