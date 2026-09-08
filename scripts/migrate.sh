#!/bin/bash
# Migrate essential code from old repositories

set -e

echo "🔄 Starting migration to claude-brain..."
echo

# Source directories
BRAIN_DIR="$HOME/Code/brain"
BRAIN_UNIFIED_DIR="$HOME/Code/brain-unified"
TARGET_DIR="$HOME/Code/claude-brain"

cd $TARGET_DIR

# 1. Copy monitoring system
echo "📊 Migrating monitoring system..."
cp $BRAIN_DIR/api/execution_log_api_fixed_v2.py monitor/server.py
cp $BRAIN_DIR/api/execution-monitor.html monitor/ui.html
echo "✅ Monitoring system migrated"

# 2. Copy management scripts
echo "🔧 Migrating management scripts..."
cp $BRAIN_DIR/brain-monitor scripts/manage.sh
echo "✅ Management scripts migrated"

# 3. Create marker for next steps
touch .migration-status
echo "phase1_complete" > .migration-status

echo
echo "✅ Phase 1 migration complete!"
echo "Next: Migrate brain tools from brain-unified/index.js"
