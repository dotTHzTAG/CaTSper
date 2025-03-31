# -*- mode: python ; coding: utf-8 -*-
import platform

a = Analysis(
    ['CaTSper.py'],
    pathex=[],
    binaries=[],
    datas=[('CaTSper_python.ui', '.'), ('CaTSper_timedomain.ui', '.'), ('CaTSper_frequencydomain.ui', '.'), ('config_default.json', '.'), ('CaTSper_resources/CaTSper_logo.svg', 'CaTSper_resources'), ('CaTSper_resources/CaTSper_logo.ico', 'CaTSper_resources'), ('CaTSper_resources/CaTSper_logo.icns', 'CaTSper_resources'), ('CaTSper_resources/toggle_left.png', 'CaTSper_resources'), ('CaTSper_resources/toggle_right.png', 'CaTSper_resources')],
    hiddenimports=['PyQt6.QtSvgWidgets'],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='CaTSper',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon='CaTSper_resources/CaTSper_logo.ico'
)

if platform.system() == 'Darwin':
   app = BUNDLE(exe,
                name='CaTSper.app',
                icon='CaTSper_resources/CaTSper_logo.icns')