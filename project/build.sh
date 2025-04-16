#!/bin/bash

echo "🔧 Starting Django project build..."

# Exit if any command fails
set -e

# Step 1: Activate virtual environment (adjust if your venv is elsewhere)
echo "📦 Activating virtual environment..."
if [ -d "venv" ]; then
    source venv/bin/activate
else
    echo "⚠️ Virtual environment not found! Please create it first."
    exit 1
fi

# Step 2: Install dependencies
echo "📚 Installing dependencies..."
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "⚠️ requirements.txt not found!"
    exit 1
fi

# Step 3: Apply migrations
echo "🛠️ Running migrations..."
python manage.py migrate

# Step 4: Collect static files (optional, but useful for deployment)
echo "📁 Collecting static files..."
python manage.py collectstatic --noinput

# Step 5: (Optional) Create superuser or other setup here

# Step 6: Done
echo "✅ Build completed successfully!"