From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/5] MIPS: Initial IMG Pistachio SoC support
Date: Mon, 23 Feb 2015 17:31:42 -0800
Message-ID: <1424741507-8882-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
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
for all other affected platforms.  Based on v4.0-rc1.  A tree with these
changes is available at [2].

Cc: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

[1] http://patchwork.linux-mips.org/patch/8837/
[2] https://github.com/abrestic/linux/tree/pistachio-platform-v1

Andrew Bresticker (3):
  MIPS: Allow platforms to specify the decompressor load address
  MIPS: Document Pistachio boot protocol and device-tree bindings
  MIPS: Add support for the IMG Pistachio SoC

Govindraj Raja (1):
  MIPS: pistachio: Add an initial defconfig

Kevin Cernekee (1):
  MIPS: Create a common <asm/mach-generic/war.h>

 .../devicetree/bindings/mips/img/pistachio.txt     |  40 +++
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
 36 files changed, 692 insertions(+), 532 deletions(-)
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
