# Manifest Restore Magisk Script

## Descriptions
- This is not a module, so this will not remain in module list.
- Restores your original ROM manifest.xml (via mirror/original paths if in boot mode)
- Moves/restores manifest.xml.orig or manifest.xml.bak to manifest.xml of ROM
- Deletes patched manifest.xml in Kitsune Mask early-mount.d
- For example, if you have installed Dolby modules that requires manifest.xml patch and backs-up your original manifest.xml to manifest.xml.orig, it will not restore your original manifest.xml (manifest.xml.orig) if you remove/uninstall the Dolby modules, so you can use this Magisk script to restore your original manifest.xml after you have removed/uninstalled the Dolby modules.
- If you are using Magisk or something similar, your system files are mounted in atomic/magic mount. If you are restoring your manifest.xml manually without mirror/original paths in boot mode (except via TWRP), you will even potentially lose your manifest.xml resulting in a bootloop/softbrick, so this script helps you to restore it in the right paths (mirror/original paths).

## Requirements
- Magisk or KernelSU installed

## Installation Guide & Download Link
- Install this script https://www.pling.com/p/2187441/ via Magisk app or KernelSU app or Recovery if Magisk installed

## Optionals
- Global: https://t.me/androidryukimodsdiscussions/60861

## Troubleshootings
- Global: https://t.me/androidryukimodsdiscussions/29836

## Support & Bug Report
- https://t.me/androidryukimodsdiscussions/2618
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- @HuskyDG
- https://t.me/androidryukimodsdiscussions
- You can contribute ideas about this Magisk Module here: https://t.me/androidappsportdevelopment

## Sponsors
- https://t.me/androidryukimodsdiscussions/2619





