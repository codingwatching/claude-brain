#!/bin/bash
# Start the Brain Execution Server

echo "🚀 Starting Brain Execution Server on port 9998..."

cd $HOME/Code/claude-brain/monitor

# Check if server.py exists
if [ ! -f "server.py" ]; then
    echo "❌ Error: server.py not found at $HOME/Code/claude-brain/monitor/server.py"
    exit 1
fi

# Kill any existing process on port 9998
echo "🔍 Checking for existing process on port 9998..."
lsof -ti:9998 | xargs kill -9 2>/dev/null && echo "✅ Killed existing process"

# Start the server
echo "🎯 Starting server..."
python3 server.py &

# Wait a moment for server to start
sleep 2

# Test if server is running
if curl -s http://localhost:9998/ > /dev/null; then
    echo "✅ Brain Execution Server started successfully!"
    echo "📡 Server running at http://localhost:9998/"
else
    echo "❌ Failed to start server"
    exit 1
fi
