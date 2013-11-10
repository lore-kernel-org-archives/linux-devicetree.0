From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/32] Add additional sandbox features and infrastructure
Date: Sun, 10 Nov 2013 10:43:55 -0700
Message-ID: <1384105467-31986-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jagannadha Sutradharudu Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vadim Bendebury <vbendeb-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jagannadha Sutradharudu Teki <jaganna-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

At present sandbox only supports a basic set of features. To help addre=
ss
this, a recent series added SPI and SPI flash support; this series expa=
nds
the coverage further.

=46irstly SDL is used to provide LCD and audio support. Sandbox gains i=
ts own
LCD driver which can display images, host a command line, etc. The audi=
o
support is basic and needs additional work, but it is a starting point.
SDL also provides a keyboard emulation (using the Chrome OS EC code as =
a
base).

Secondly a TPM emulation is added. This does not include all features (=
the
implementation is quite simplistic) but it is enough to do basic secure
boot operations.

=46inally, various pieces of useful infrastructure are adding, includin=
g:

- loading and saving of the emulated SDRAM to permit test runs to carry
over state
- loading and saving of general sandbox state (for example a driver can
save its stage and reload it on the next run)
- support for using bootm to load a kernel
- providing a device tree for use by sandbox
- block device emulation using host files
- a means to jump to another U-Boot while preserving state (useful for
test environments which want to run a series of tests with
script-selectable state)
- allowing the console to be active on start-up so that errors are not
silent supressed

The block device emulation provides access to filesystems from sandbox
which should make it possible to write comprehensive filesystem tests.

Major functions which still remain without sandbox support are I2C,
networking and USB.


Che-Liang Chiou (1):
  sandbox: tpm: Fix nvwrite command

Henrik Nordstr=C3=B6m (1):
  sandbox: block driver using host file/device as backing store

Simon Glass (29):
  Add crc8 routine
  sandbox: Use system headers first for sandbox's os.c
  sandbox: Use uint64_t instead of u64 for time
  sandbox: Increase memory size to 32MB
  sandbox: spi: Adjust 'sf test' to work on sandbox
  sandbox: Build a device tree file for sandbox
  sandbox: config: Don't use 64-bit physical memory
  sandbox: Correct data sizes and printf() strings in fdtdec.c
  sandbox: Use os functions to read host device tree
  sandbox: Improve/augment memory allocation functions
  sandbox: Correct help message <arg> garbling
  sandbox: Allow return from board_init_f()
  sandbox: Implement the bootm command for sandbox
  sandbox: Allow the console to work earlier
  sandbox: Add -i option to enter interactive mode
  sandbox: Allow reading/writing of RAM buffer
  sandbox: Add facility to save/restore sandbox state
  sandbox: tpm: Add TPM emulation
  sandbox: dts: Add display and keyboard to sandbox
  sandbox: Add a prototype for cleanup_before_linux()
  cros_ec: Add an enum for the number of flash regions
  fdt: Add a function for reading a flash map entry
  cros_ec: Add a function for decoding the Chrome OS EC flashmap
  cros_ec: sandbox: Add Chrome OS EC emulation
  sandbox: Add os_jump_to_image() to run another executable
  sandbox: Add -j option to indicate a jump from a previous U-Boot
  sandbox: Add SDL library for LCD, keyboard, audio
  sandbox: Add a simple sound driver
  sandbox: Add LCD driver

Vadim Bendebury (1):
  cros_ec: Move EC interface into common library

 Makefile                                      |   1 +
 arch/sandbox/config.mk                        |   7 +
 arch/sandbox/cpu/Makefile                     |  12 +-
 arch/sandbox/cpu/cpu.c                        |  21 +-
 arch/sandbox/cpu/os.c                         | 187 ++++++++-
 arch/sandbox/cpu/sdl.c                        | 334 +++++++++++++++
 arch/sandbox/cpu/start.c                      | 121 +++++-
 arch/sandbox/cpu/state.c                      | 353 ++++++++++++++++
 arch/sandbox/include/asm/arch-sandbox/sound.h |  14 +
 arch/sandbox/include/asm/global_data.h        |   2 +-
 arch/sandbox/include/asm/sdl.h                |  20 +
 arch/sandbox/include/asm/state.h              | 132 +++++-
 arch/sandbox/include/asm/types.h              |   4 +-
 arch/sandbox/include/asm/u-boot-sandbox.h     |   5 +
 board/samsung/smdk5250/exynos5-dt.c           |   5 -
 board/sandbox/dts/sandbox.dts                 |  91 +++++
 board/sandbox/sandbox/sandbox.c               |  19 +-
 common/Makefile                               |   1 +
 common/board_f.c                              |  63 ++-
 common/cmd_sandbox.c                          |  64 +++
 common/cmd_sf.c                               |  14 +-
 common/console.c                              |  16 +-
 common/cros_ec.c                              |  44 ++
 common/lcd.c                                  |  21 +-
 config.mk                                     |   9 +-
 disk/part.c                                   |  23 +-
 doc/device-tree-bindings/video/sandbox-fb.txt |  13 +
 drivers/block/Makefile                        |   1 +
 drivers/block/sandbox.c                       | 124 ++++++
 drivers/misc/Makefile                         |   1 +
 drivers/misc/cros_ec.c                        |  50 +++
 drivers/misc/cros_ec_sandbox.c                | 558 ++++++++++++++++++=
++++++++
 drivers/serial/sandbox.c                      |   4 +
 drivers/sound/Makefile                        |   2 +
 drivers/sound/sandbox.c                       |  23 ++
 drivers/tpm/Makefile                          |   1 +
 drivers/tpm/tpm_tis_sandbox.c                 | 260 ++++++++++++
 drivers/video/Makefile                        |   1 +
 drivers/video/sandbox_sdl.c                   |  70 ++++
 include/config_fallbacks.h                    |   3 +-
 include/configs/sandbox.h                     |   9 +-
 include/cros_ec.h                             |  45 +++
 include/ec_commands.h                         |   4 +-
 include/fdtdec.h                              |  20 +
 include/lcd.h                                 |   3 +
 include/linux/crc8.h                          |  23 ++
 include/os.h                                  |  88 +++-
 include/part.h                                |   5 +
 include/sandboxblockdev.h                     |  18 +
 lib/Makefile                                  |   1 +
 lib/crc8.c                                    |  25 ++
 lib/fdtdec.c                                  |  34 +-
 52 files changed, 2866 insertions(+), 103 deletions(-)
 create mode 100644 arch/sandbox/cpu/sdl.c
 create mode 100644 arch/sandbox/include/asm/arch-sandbox/sound.h
 create mode 100644 arch/sandbox/include/asm/sdl.h
 create mode 100644 board/sandbox/dts/sandbox.dts
 create mode 100644 common/cros_ec.c
 create mode 100644 doc/device-tree-bindings/video/sandbox-fb.txt
 create mode 100644 drivers/block/sandbox.c
 create mode 100644 drivers/misc/cros_ec_sandbox.c
 create mode 100644 drivers/sound/sandbox.c
 create mode 100644 drivers/tpm/tpm_tis_sandbox.c
 create mode 100644 drivers/video/sandbox_sdl.c
 create mode 100644 include/linux/crc8.h
 create mode 100644 include/sandboxblockdev.h
 create mode 100644 lib/crc8.c

--=20
1.8.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
