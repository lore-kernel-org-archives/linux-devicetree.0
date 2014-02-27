From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/31] Add additional sandbox features and infrastructure
Date: Thu, 27 Feb 2014 13:25:54 -0700
Message-ID: <1393532785-9020-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jagannadha Sutradharudu Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jagannadha Sutradharudu Teki <jaganna-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

At present sandbox only supports a basic set of features. To help address
this, a recent series added SPI and SPI flash support; this series expands
the coverage further.

Firstly SDL is used to provide LCD and audio support. Sandbox gains its own
LCD driver which can display images, host a command line, etc. The audio
support is basic and needs additional work, but it is a starting point.
SDL also provides a keyboard emulation (using the Chrome OS EC code as a
base).

Secondly a TPM emulation is added. This does not include all features (the
implementation is quite simplistic) but it is enough to do basic secure
boot operations.

Finally, various pieces of useful infrastructure are added, including:

- loading and saving of the emulated SDRAM to permit test runs to carry
over state
- loading and saving of general sandbox state (for example a driver can
save its stage and reload it on the next run)
- support for using bootm to load a kernel
- providing a device tree for use by sandbox
- a means to jump to another U-Boot while preserving state (useful for
test environments which want to run a series of tests with
script-selectable state)

Major functions which still remain without sandbox support are I2C,
networking and USB.

Note:

Much of this series was sent out in November. Due to problems with the
LCD side it was not ready for the last release, although about a dozen
patches from the series were applied. I have rebased and tidied things
up. U-Boot now starts by default without the LCD visible since for
much sandbox testing we don't want the LCD. The Chrome OS EC code has been
updated and tidied up and full keyboard support is now present in the LCD
window.

Changes in v2:
- Add new patch to adjust #ifdef position in cros_ec
- Add new patch to sync with latest Chrome OS EC version
- Add new patches to bring in protocol v3 support
- Rebase to master
- Update series to take account of patches now merges from original series

Randall Spangler (2):
  cros_ec: Clean up multiple EC protocol support
  cros_ec: spi: Add support for EC protocol version 3

Simon Glass (27):
  Use a const pointer for map_to_sysmem()
  sandbox: Increase memory size to 32MB
  sandbox: Build a device tree file for sandbox
  sandbox: Use os functions to read host device tree
  sandbox: dts: Add display and keyboard to sandbox
  cros_ec: Add an enum for the number of flash regions
  cros_ec: Add a function for reading a flash map entry
  cros_ec: Add a function for decoding the Chrome OS EC flashmap
  cros_ec: Support systems with no EC interrupt
  cros_ec: Move #ifdef to permit flash region access
  cros_ec: Sync up with latest Chrome OS EC version
  cros_ec: Add base support for protocol v3
  cros_ec: Correct comparison between signed and unsigned numbers
  cros_ec: sandbox: Add Chrome OS EC emulation
  sandbox: Plumb in Chrome OS EC emulation
  cros_ec: Implement I2C pass-through
  sandbox: Add os_jump_to_image() to run another executable
  sandbox: Add -j option to indicate a jump from a previous U-Boot
  sandbox: Add SDL library for LCD, keyboard, audio
  sandbox: Add a simple sound driver
  sandbox: Add LCD driver
  sound: Move Samsung-specific code into its own file
  sandbox: Deal with conflicting getenv() for SDL
  sandbox: Allow Ctrl-C to work in sandbox
  sandbox: Add options to clean up temporary files
  sandbox: Add implementation of spi_setup_slave_fdt()
  sandbox: config: Enable cros_ec emulation and related items

Vadim Bendebury (2):
  cros_ec: Move EC interface into common library
  cros_ec: Drop old EC version support from EC driver

 Makefile                                      |   3 +-
 arch/sandbox/config.mk                        |   5 +
 arch/sandbox/cpu/Makefile                     |   3 +
 arch/sandbox/cpu/cpu.c                        |   2 +-
 arch/sandbox/cpu/os.c                         | 108 ++++-
 arch/sandbox/cpu/sdl.c                        | 341 ++++++++++++++
 arch/sandbox/cpu/start.c                      |  60 +++
 arch/sandbox/cpu/state.c                      |   6 +-
 arch/sandbox/dts/Makefile                     |  11 +
 arch/sandbox/dts/sandbox.dts                  | 125 ++++++
 arch/sandbox/include/asm/arch-sandbox/sound.h |  14 +
 arch/sandbox/include/asm/sdl.h                | 118 +++++
 arch/sandbox/include/asm/state.h              |  29 +-
 arch/sandbox/include/asm/u-boot-sandbox.h     |   3 +
 board/samsung/common/board.c                  |  29 +-
 board/samsung/smdk5250/exynos5-dt.c           |   1 -
 board/sandbox/sandbox/sandbox.c               |  49 ++-
 common/Makefile                               |   1 +
 common/board_f.c                              |  48 +-
 common/cros_ec.c                              |  44 ++
 common/lcd.c                                  |  21 +-
 disk/part.c                                   |  17 -
 doc/device-tree-bindings/video/sandbox-fb.txt |  13 +
 drivers/input/cros_ec_keyb.c                  |  34 +-
 drivers/misc/Makefile                         |   1 +
 drivers/misc/cros_ec.c                        | 611 +++++++++++++++++++++++---
 drivers/misc/cros_ec_i2c.c                    |  64 ++-
 drivers/misc/cros_ec_lpc.c                    |  80 +---
 drivers/misc/cros_ec_sandbox.c                | 559 +++++++++++++++++++++++
 drivers/misc/cros_ec_spi.c                    |  30 ++
 drivers/serial/sandbox.c                      |  10 +-
 drivers/sound/Makefile                        |   4 +-
 drivers/sound/sandbox.c                       |  23 +
 drivers/sound/sound-i2s.c                     | 208 +++++++++
 drivers/sound/sound.c                         | 221 +---------
 drivers/spi/sandbox_spi.c                     |  13 +
 drivers/video/Makefile                        |   1 +
 drivers/video/sandbox_sdl.c                   |  79 ++++
 include/common.h                              |   6 +
 include/configs/exynos5250-dt.h               |   1 +
 include/configs/sandbox.h                     |  41 +-
 include/cros_ec.h                             |  94 +++-
 include/cros_ec_message.h                     |   2 +-
 include/ec_commands.h                         | 348 +++++++++++++--
 include/fdtdec.h                              |  20 +
 include/lcd.h                                 |   3 +
 include/os.h                                  |  27 +-
 include/sound.h                               |   9 +
 lib/fdtdec.c                                  |  26 ++
 49 files changed, 3032 insertions(+), 534 deletions(-)
 create mode 100644 arch/sandbox/cpu/sdl.c
 create mode 100644 arch/sandbox/dts/Makefile
 create mode 100644 arch/sandbox/dts/sandbox.dts
 create mode 100644 arch/sandbox/include/asm/arch-sandbox/sound.h
 create mode 100644 arch/sandbox/include/asm/sdl.h
 create mode 100644 common/cros_ec.c
 create mode 100644 doc/device-tree-bindings/video/sandbox-fb.txt
 create mode 100644 drivers/misc/cros_ec_sandbox.c
 create mode 100644 drivers/sound/sandbox.c
 create mode 100644 drivers/sound/sound-i2s.c
 create mode 100644 drivers/video/sandbox_sdl.c

-- 
1.9.0.279.gdc9e3eb

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
