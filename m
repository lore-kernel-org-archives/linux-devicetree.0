From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v2 00/11] da8xx USB clocks
Date: Wed, 16 Mar 2016 21:26:33 -0500
Message-ID: <1458181615-27782-1-git-send-email-david@lechnology.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

OK, ready for round two.

I've added a new callback in the davinci clocks so that they can properly
handle clock muxing. The clock functions are pretty much the same as in the
previous patch set other than clk_set_parent() now works.

The next new thing is a phy driver for the CFGCHIP2 register that controls the
SoC USB PHY (both USB 1.1 and USB 2.0). The ohci and musb drivers have been
updated to use this new phy driver.

David Lechner (10):
  ARM: davinci: add set_parent callback for mux clocks
  ARM: davinci: da850: use clk->set_parent for async3
  ARM: davinci: da8xx: add usb phy clocks
  dt-bindings: Add bindings for phy-da8xx-usb
  phy: da8xx-usb: new driver for DA8XX SoC USB PHY
  ARM: davinci: da8xx: Add USB PHY platform declaration
  ARM: dt: da850: Add usb phy node
  usb: ohci-da8xx: Remove code that references mach
  usb: musb: da8xx: Use devm in probe
  usb: musb: da8xx: Remove mach code

Petr Kulhavy (1):
  ARM: davinci: defined missing CFGCHIP2_REFFREQ_* macros for MUSB PHY

 .../devicetree/bindings/phy/phy-da8xx-usb.txt      |  34 +++
 arch/arm/boot/dts/da850.dtsi                       |   6 +
 arch/arm/mach-davinci/board-da830-evm.c            |  12 -
 arch/arm/mach-davinci/board-omapl138-hawk.c        |   7 -
 arch/arm/mach-davinci/clock.c                      |  17 +-
 arch/arm/mach-davinci/clock.h                      |   1 +
 arch/arm/mach-davinci/da830.c                      | 143 ++++++++++
 arch/arm/mach-davinci/da850.c                      | 231 ++++++++++++----
 arch/arm/mach-davinci/include/mach/da8xx.h         |   1 +
 arch/arm/mach-davinci/usb.c                        |  24 +-
 drivers/phy/Kconfig                                |   9 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-da8xx-usb.c                        | 295 +++++++++++++++++++++
 drivers/usb/host/ohci-da8xx.c                      |  90 +++----
 drivers/usb/musb/da8xx.c                           | 150 +++--------
 include/linux/platform_data/usb-davinci.h          |   6 +
 16 files changed, 799 insertions(+), 228 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
 create mode 100644 drivers/phy/phy-da8xx-usb.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
