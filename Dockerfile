# Використовуємо офіційний образ Python
FROM python:3.11-slim

# Додавання системних залежностей
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Встановлення залежностей
WORKDIR /app
COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь застосунок
COPY . /app

# Відкриваємо порт для FastAPI
EXPOSE 8000

# Команда для запуску застосунку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
