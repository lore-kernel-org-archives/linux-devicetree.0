From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v3 00/16] da8xx USB clocks
Date: Thu, 24 Mar 2016 18:51:25 -0500
Message-ID: <1458863503-31121-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a reworking of the v2 series based of feedback and review. There were
very many suggestions, so hopefully I didn't miss any. Here are the highlights...

New stuff:

* Fixed the davinci device tree declarations to use the preferred DT address
  convention so that the items I have added can be correct too.
* Moved that davinci clock init so that we don't have to call ioremap in the
  clock mux functions.
* Added a new "syscon" device for the CFGCHIP registers. This is used by the
  USB PHY driver and will be used in the future in common clock framework
  drivers.

Changed:

* USB clocks are moved to a common file instead of having duplicated code.
* PHY driver uses syscon for CFGCHIP registers instead of using them directly.

David Lechner (16):
  dt: davinci: use proper address after @
  mfd: da8xx-cfgchip: New header file for CFGCHIP registers.
  ARM: davinici: da8xx: move usb code to new file
  ARM: davinci: Move clock init after ioremap.
  ARM: davinci: add set_parent callback for mux clocks
  ARM: davinci: da850: use clk->set_parent for async3
  ARM: davinci: da8xx: add usb phy clocks
  dt-bindings: Add bindings for phy-da8xx-usb
  phy: da8xx-usb: new driver for DA8xx SoC USB PHY
  ARM: davinci: da8xx: Add CFGCHIPn syscon platform declaration.
  ARM: davinci: da8xx: Add USB PHY platform declaration
  ARM: dt: da850: Add cfgchip syscon node
  ARM: dt: da850: Add usb phy node
  usb: ohci-da8xx: Remove code that references mach
  usb: musb: da8xx: Use devm in probe
  usb: musb: da8xx: Remove mach code

 .../devicetree/bindings/phy/phy-da8xx-usb.txt      |  40 +++
 arch/arm/boot/dts/da850-enbw-cmc.dts               |   8 +-
 arch/arm/boot/dts/da850-evm.dts                    |  26 +-
 arch/arm/boot/dts/da850.dtsi                       |  61 ++--
 arch/arm/mach-davinci/Makefile                     |   4 +-
 arch/arm/mach-davinci/board-da830-evm.c            |  52 ++-
 arch/arm/mach-davinci/board-da850-evm.c            |   4 +
 arch/arm/mach-davinci/board-mityomapl138.c         |   4 +
 arch/arm/mach-davinci/board-omapl138-hawk.c        |  23 +-
 arch/arm/mach-davinci/clock.c                      |  21 +-
 arch/arm/mach-davinci/clock.h                      |   8 +-
 arch/arm/mach-davinci/common.c                     |   6 -
 arch/arm/mach-davinci/da830.c                      |   2 +
 arch/arm/mach-davinci/da850.c                      |  84 +++--
 arch/arm/mach-davinci/devices-da8xx.c              |  28 ++
 arch/arm/mach-davinci/dm355.c                      |   1 +
 arch/arm/mach-davinci/dm365.c                      |   1 +
 arch/arm/mach-davinci/dm644x.c                     |   1 +
 arch/arm/mach-davinci/dm646x.c                     |   1 +
 arch/arm/mach-davinci/include/mach/da8xx.h         |   6 +
 arch/arm/mach-davinci/usb-da8xx.c                  | 351 +++++++++++++++++++++
 arch/arm/mach-davinci/usb.c                        |  74 +----
 drivers/phy/Kconfig                                |  10 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-da8xx-usb.c                        | 249 +++++++++++++++
 drivers/usb/host/Kconfig                           |   1 +
 drivers/usb/host/ohci-da8xx.c                      | 102 +++---
 drivers/usb/musb/Kconfig                           |   2 +-
 drivers/usb/musb/da8xx.c                           | 160 +++-------
 include/linux/mfd/da8xx-cfgchip.h                  | 160 ++++++++++
 include/linux/phy/phy-da8xx-usb.h                  |  19 ++
 include/linux/platform_data/usb-davinci.h          |  23 --
 32 files changed, 1137 insertions(+), 396 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
 create mode 100644 arch/arm/mach-davinci/usb-da8xx.c
 create mode 100644 drivers/phy/phy-da8xx-usb.c
 create mode 100644 include/linux/mfd/da8xx-cfgchip.h
 create mode 100644 include/linux/phy/phy-da8xx-usb.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
