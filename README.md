# sx-changesit

A FiveM resource that allows players to quickly change seats in vehicles using customizable keyboard shortcuts.

## Features

- **Quick Seat Switching**: Change seats in vehicles using keyboard shortcuts (default: 1, 2, 3, 4)
- **Speed Limit Protection**: Prevents seat changes when the vehicle exceeds a configurable speed limit
- **Driver Seat Protection**: Optional blocking of driver seat changes for safety
- **Multi-language Support**: Built-in translation system (English, French)
- **Customizable Keybinds**: Fully configurable key mappings for each seat position
- **Performance Optimized**: Lightweight and efficient implementation

## Installation

1. Download the resource and place it in your `resources` folder
2. Add the resource to your `server.cfg`:
   ```
   ensure sx-changesit
   ```
3. Restart your server or start the resource manually

## Configuration

Edit `config/sh_config.lua` to customize the resource behavior:

### BlockDriver
```lua
_CONFIG.BlockDriver = true  -- Set to false to allow driver seat changes
```

### Keys Configuration
Each key configuration includes:
- `sitIndex`: The seat index (-1 = driver, 0 = front right, 1 = back left, 2 = back right)
- `label`: Translation key for the keybind description
- `keyId`: The keyboard key to bind (default: '1', '2', '3', '4')
- `speedLimit`: Maximum speed (km/h) allowed for seat changes (default: 150)

Example configuration:
```lua
_CONFIG.Keys = {
    [1] = {
        sitIndex     = -1;  -- Driver seat
        label        = 'front_left_translation',
        keyId        = '1',
        speedLimit   = 150
    },
    [2] = {
        sitIndex     = 0;   -- Front right
        label        = 'front_right_translation',
        keyId        = '2',
        speedLimit   = 150
    },
    -- ... more seats
}
```

## Default Keybinds

- **Key 1**: Front Left (Driver) - Only works if `BlockDriver` is `false`
- **Key 2**: Front Right (Passenger)
- **Key 3**: Back Left
- **Key 4**: Back Right

## Translations

The resource supports multiple languages. Translation files are located in the `translation/` folder:

- `default.lua`: Default phrases (fallback)
- `en.lua`: English translations
- `fr.lua`: French translations

To add a new language, create a new file in the `translation/` folder following the same structure.

## Requirements

- FiveM Server
- Lua 5.4 support (`lua54 'yes'` in fxmanifest)
- Compatible with `adamant` FX version

## Dependencies

This resource uses internal utility modules:
- `utils/cl_keys.lua`: Key registration system
- `utils/sh_logger.lua`: Logging system
- `utils/sh_translation.lua`: Translation system

## Usage

1. Enter a vehicle
2. Press the configured key (1, 2, 3, or 4) to switch to the corresponding seat
3. Seat changes are only allowed when:
   - The target seat is free
   - The vehicle speed is below the configured limit
   - You're not trying to change to the driver seat (if `BlockDriver` is enabled)

## Keybinds Customization

Players can customize their keybinds through the FiveM settings menu:
1. Open the pause menu
2. Go to Settings → Key Bindings
3. Find the seat change actions and rebind them

## Technical Details

- **Resource Name**: sx-changesit
- **Version**: 0.2.1
- **Author**: sacha-development
- **FX Version**: adamant
- **Game**: GTA5

## Logging

The resource includes a logging system that can be enabled via convars:
- `sh_dev`: Enable/disable logging (0 = off, 1 = on)
- `sh_log_level`: Set log level (0 = ERROR, 1 = WARN, 2 = INFO, 3 = TRACE)

## Support

For issues, suggestions, or contributions, please contact the author or open an issue on the repository.

## License

This resource is provided as-is. Please check with the author for licensing information.

