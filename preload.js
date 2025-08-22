const { contextBridge } = require('electron');

// Expose protected methods that allow the renderer process to use
// the ipcRenderer without exposing the entire object
contextBridge.exposeInMainWorld('electronAPI', {
  // System information
  platform: process.platform,
  
  // Version information
  versions: {
    node: process.versions.node,
    chrome: process.versions.chrome,
    electron: process.versions.electron,
    app: require('./package.json').version
  },
  
  // App information
  appName: 'WarpSpeed Monitor',
  
  // Future: Could add IPC communication methods here
  // For example: send messages to main process for system info
});
