FROM python:3.12-slim

WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive

# System deps + build tools for tgcrypto
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    bash \
    gcc \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "bash.sh"]
