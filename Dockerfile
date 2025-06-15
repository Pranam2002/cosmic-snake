FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Install system dependencies if needed (for cairosvg)
RUN apt-get update && apt-get install -y \
    libcairo2 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgdk-pixbuf2.0-0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy all source files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements-dev.txt
    RUN pip install .                # <── installs your package into the image

# Default command
CMD ["python", "-m", "cosmic_snake"]
