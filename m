From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V2 0/5] MIPS: Initial IMG Pistachio SoC support
Date: Fri, 13 Mar 2015 15:54:04 -0700
Message-ID: <1426287249-27185-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Andrew Bresticker <abrestic@chromium.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

This series adds basic support for the Imagination Technologies Pistachio
SoC.  Pistachio will boot using device-tree only.  v4.0-rc1 already includes
support for several of the peripherals on Pistachio, including MMC, SPI,
I2C, DMA, watchdog timer, PWM, and IR.  Clock and pinctrl support for
Pistachio is coming soon, as well as an initial device-tree and support
for USB and ethernet.

Patches 1 and 2 are cleanups in preparation for adding Pistachio support,
with patch 1 having been posted by Kevin late last year [1].  Patch 3
documents Pistachio's required device-tree properties/nodes and its boot
protocol.  Patch 4 adds support for Pistachio itself and finally patch 5
adds a defconfig for Pistachio.

Boot tested on an IMG Pistachio BuB ("bring-up board") and build tested
for all other affected platforms.  Based on v4.0-rc3.  A tree with these
changes is available at [2].

Changes from v1:
 - Switched to MIPS UHI hand-off protocol

Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: James Hartley <james.hartley@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>

[1] http://patchwork.linux-mips.org/patch/8837/
[2] https://github.com/abrestic/linux/tree/pistachio-platform-v2

Andrew Bresticker (3):
  MIPS: Allow platforms to specify the decompressor load address
  MIPS: Document Pistachio boot protocol and device-tree bindings
  MIPS: Add support for the IMG Pistachio SoC

Govindraj Raja (1):
  MIPS: pistachio: Add an initial defconfig

Kevin Cernekee (1):
  MIPS: Create a common <asm/mach-generic/war.h>

 .../devicetree/bindings/mips/img/pistachio.txt     |  42 +++
 arch/mips/Kbuild.platforms                         |   1 +
 arch/mips/Kconfig                                  |  27 ++
 arch/mips/boot/compressed/Makefile                 |   6 +-
 arch/mips/configs/pistachio_defconfig              | 336 +++++++++++++++++++++
 arch/mips/include/asm/mach-ar7/war.h               |  24 --
 arch/mips/include/asm/mach-ath25/war.h             |  25 --
 arch/mips/include/asm/mach-ath79/war.h             |  24 --
 arch/mips/include/asm/mach-au1x00/war.h            |  24 --
 arch/mips/include/asm/mach-bcm3384/war.h           |  24 --
 arch/mips/include/asm/mach-bcm47xx/war.h           |  24 --
 arch/mips/include/asm/mach-bcm63xx/war.h           |  24 --
 arch/mips/include/asm/mach-cobalt/war.h            |  24 --
 arch/mips/include/asm/mach-dec/war.h               |  24 --
 arch/mips/include/asm/mach-emma2rh/war.h           |  24 --
 arch/mips/include/asm/mach-generic/war.h           |  24 ++
 arch/mips/include/asm/mach-jazz/war.h              |  24 --
 arch/mips/include/asm/mach-jz4740/war.h            |  24 --
 arch/mips/include/asm/mach-lantiq/war.h            |  23 --
 arch/mips/include/asm/mach-lasat/war.h             |  24 --
 arch/mips/include/asm/mach-loongson/war.h          |  24 --
 arch/mips/include/asm/mach-loongson1/war.h         |  24 --
 arch/mips/include/asm/mach-netlogic/war.h          |  25 --
 arch/mips/include/asm/mach-paravirt/war.h          |  25 --
 arch/mips/include/asm/mach-pistachio/gpio.h        |  21 ++
 arch/mips/include/asm/mach-pistachio/irq.h         |  18 ++
 arch/mips/include/asm/mach-pnx833x/war.h           |  24 --
 arch/mips/include/asm/mach-ralink/war.h            |  24 --
 arch/mips/include/asm/mach-tx39xx/war.h            |  24 --
 arch/mips/include/asm/mach-vr41xx/war.h            |  24 --
 arch/mips/jz4740/Platform                          |   1 +
 arch/mips/pistachio/Makefile                       |   1 +
 arch/mips/pistachio/Platform                       |   8 +
 arch/mips/pistachio/init.c                         | 131 ++++++++
 arch/mips/pistachio/irq.c                          |  28 ++
 arch/mips/pistachio/time.c                         |  52 ++++
 36 files changed, 694 insertions(+), 532 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/img/pistachio.txt
 create mode 100644 arch/mips/configs/pistachio_defconfig
 delete mode 100644 arch/mips/include/asm/mach-ar7/war.h
 delete mode 100644 arch/mips/include/asm/mach-ath25/war.h
 delete mode 100644 arch/mips/include/asm/mach-ath79/war.h
 delete mode 100644 arch/mips/include/asm/mach-au1x00/war.h
 delete mode 100644 arch/mips/include/asm/mach-bcm3384/war.h
 delete mode 100644 arch/mips/include/asm/mach-bcm47xx/war.h
 delete mode 100644 arch/mips/include/asm/mach-bcm63xx/war.h
 delete mode 100644 arch/mips/include/asm/mach-cobalt/war.h
 delete mode 100644 arch/mips/include/asm/mach-dec/war.h
 delete mode 100644 arch/mips/include/asm/mach-emma2rh/war.h
 create mode 100644 arch/mips/include/asm/mach-generic/war.h
 delete mode 100644 arch/mips/include/asm/mach-jazz/war.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/war.h
 delete mode 100644 arch/mips/include/asm/mach-lantiq/war.h
 delete mode 100644 arch/mips/include/asm/mach-lasat/war.h
 delete mode 100644 arch/mips/include/asm/mach-loongson/war.h
 delete mode 100644 arch/mips/include/asm/mach-loongson1/war.h
 delete mode 100644 arch/mips/include/asm/mach-netlogic/war.h
 delete mode 100644 arch/mips/include/asm/mach-paravirt/war.h
 create mode 100644 arch/mips/include/asm/mach-pistachio/gpio.h
 create mode 100644 arch/mips/include/asm/mach-pistachio/irq.h
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/war.h
 delete mode 100644 arch/mips/include/asm/mach-ralink/war.h
 delete mode 100644 arch/mips/include/asm/mach-tx39xx/war.h
 delete mode 100644 arch/mips/include/asm/mach-vr41xx/war.h
 create mode 100644 arch/mips/pistachio/Makefile
 create mode 100644 arch/mips/pistachio/Platform
 create mode 100644 arch/mips/pistachio/init.c
 create mode 100644 arch/mips/pistachio/irq.c
 create mode 100644 arch/mips/pistachio/time.c

-- 
2.2.0.rc0.207.ga3a616c
