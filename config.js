import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { homedir } from 'os';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Data root - FIXED to use correct Claude_Data location
const HOME = homedir();
const DATA_ROOT = join(HOME, 'Code/Claude_Data');

export const CONFIG = {
  // CRITICAL: These paths MUST be correct or we lose access to everything!
  BRAIN_DB_PATH: join(DATA_ROOT, 'brain/brain.db'),
  LOG_DIR: join(DATA_ROOT, 'logs/execution'),
  VAULT_PATH: join(HOME, 'Documents/Obsidian'),  // FIXED: Actual Obsidian vault location!
  
  // Keep original hardcoded paths as fallbacks for development
  // BRAIN_DB_PATH: join(__dirname, 'data/brain/brain.db'),
  // LOG_DIR: join(__dirname, 'data/logs/execution'), 
  // VAULT_PATH: join(__dirname, "data/BrainVault"),
  
  MONITOR_PORT: 9996,
  API_PORT: 9998
};

// Debug logging for verification - DISABLED to prevent MCP errors
// console.log('🧠 Brain Configuration:');
// console.log(`   DATA_ROOT: ${DATA_ROOT}`);
// console.log(`   BRAIN_DB_PATH: ${CONFIG.BRAIN_DB_PATH}`);
// console.log(`   LOG_DIR: ${CONFIG.LOG_DIR}`);
// console.log(`   VAULT_PATH: ${CONFIG.VAULT_PATH}`);
