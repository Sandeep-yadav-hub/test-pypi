FROM python:3.11-alpine

WORKDIR /app

# 1. Create the venv
RUN python3 -m venv /opt/venv

# 2. Set the PATH so that 'python' and 'pip' point to the venv automatically
# This is the "Docker way" to activate a virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# 3. Copy metadata first
COPY pyproject.toml .

# 4. Install dependencies 
# (Note: Alpine needs 'build-base' if your package has C-extensions)
RUN pip install --no-cache-dir .

# 5. Copy the rest
COPY . .
