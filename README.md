# WarpSpeed Monitor

Professional AI Performance Monitoring Dashboard packaged as a desktop application.

## Features

- 🖥️ **System Monitoring**: Real-time CPU, Memory, and Disk usage
- 🐳 **Container Metrics**: Docker container performance tracking  
- 🤖 **AI Performance**: Token throughput and model monitoring
- 📊 **Service Health**: Monitor API endpoints and services
- ⚡ **Real-time Updates**: Live dashboard with auto-refresh
- 🎨 **Professional UI**: Clean, minimal interface inspired by system monitors

## Requirements

- Node.js 16+ 
- Your WarpSpeed monitoring API running on `localhost:8001`

## Development

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Run in development mode:**
   ```bash
   npm run dev
   ```

3. **Start the app:**
   ```bash
   npm start
   ```

## Building Distributable Apps

### Build for Current Platform
```bash
npm run build
```

### Build for Specific Platforms
```bash
# macOS (DMG and ZIP)
npm run build:mac

# Windows (NSIS installer and ZIP)  
npm run build:win

# Linux (AppImage, DEB, RPM)
npm run build:linux

# All platforms
npm run build:all
```

## Distribution Files

After building, you'll find distributable files in the `dist/` directory:

### macOS
- `WarpSpeed Monitor-1.0.0.dmg` - Drag-and-drop installer
- `WarpSpeed Monitor-1.0.0-mac.zip` - Portable ZIP

### Windows  
- `WarpSpeed Monitor Setup 1.0.0.exe` - Windows installer
- `WarpSpeed Monitor-1.0.0-win.zip` - Portable ZIP

### Linux
- `WarpSpeed Monitor-1.0.0.AppImage` - Portable app image
- `warpspeed-monitor_1.0.0_amd64.deb` - Debian package
- `warpspeed-monitor-1.0.0.x86_64.rpm` - RPM package

## Configuration

The app connects to your WarpSpeed monitoring API at `http://localhost:8001`. Make sure your monitoring server is running before launching the app.

### API Endpoints Expected:
- `GET /api/v1/monitoring/all` - Complete metrics data

## Icons

To customize the app icon:

1. Create icon files in the `assets/` directory:
   - `icon.png` (512x512) - Linux
   - `icon.ico` (multiple sizes) - Windows  
   - `icon.icns` (multiple sizes) - macOS

2. Rebuild the app after updating icons

## Troubleshooting

### Common Issues

**"Connection Failed" Error:**
- Ensure your WarpSpeed API is running on port 8001
- Check firewall settings
- Verify API endpoints are accessible

**Build Errors:**
- Update Node.js to version 16+
- Clear node_modules and reinstall: `rm -rf node_modules package-lock.json && npm install`

**Icon Issues:**
- Icons must be in the correct format for each platform
- Use online converters or tools like `electron-icon-builder`

## Publishing

### GitHub Releases
1. Tag your release: `git tag v1.0.0`
2. Push tags: `git push --tags`  
3. Build distributables: `npm run build:all`
4. Create GitHub release and upload files from `dist/`

### App Stores
- **Mac App Store**: Requires Apple Developer account and code signing
- **Microsoft Store**: Requires developer account and APPX packaging
- **Snap Store**: Can publish AppImage or create snap package

## License

MIT License - see LICENSE file for details.
