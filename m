From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] soc: brcmstb: add system suspend support for STB SoCs
Date: Thu, 18 Jun 2015 17:11:29 -0700
Message-ID: <1434672696-13632-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This patch set introduces system suspend/resume support for Broadcom STB SoCs.
There are two suspend modes (S2 and S3) as well as a related low-power shutdown
mode (S5).

Along with the core PM support, include a driver for the wakeup-timer, which
allows for simple testing of suspend/resume wakeup cycles.

Brian

Brian Norris (7):
  Documentation: dt: brcmstb: add system PM bindings
  Documentation: dt: brcmstb: add waketimer documentation
  soc: add stubs for brcmstb SoC's
  soc: brcmstb: add PM suspend/resume support (S2/S3/S5)
  soc: brcmstb: add wake-timer driver
  ARM: brcmstb: mask GIC IRQs on suspend
  ARM: dts: brcmstb: add BCM7445 system PM DT nodes

 .../ABI/testing/sysfs-driver-wktmr-brcmstb         |  12 +
 .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt   | 142 +++++-
 .../soc/brcmstb/brcm,brcmstb-waketimer.txt         |  20 +
 arch/arm/boot/dts/bcm7445.dtsi                     | 102 ++++
 arch/arm/mach-bcm/Kconfig                          |   1 +
 arch/arm/mach-bcm/brcmstb.c                        |  10 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/brcmstb/Kconfig                        |  22 +
 drivers/soc/brcmstb/Makefile                       |   4 +
 drivers/soc/brcmstb/common.c                       |  33 ++
 drivers/soc/brcmstb/pm/Makefile                    |   1 +
 drivers/soc/brcmstb/pm/aon_defs.h                  |  85 ++++
 drivers/soc/brcmstb/pm/pm.c                        | 512 +++++++++++++++++++++
 drivers/soc/brcmstb/pm/pm.h                        |  40 ++
 drivers/soc/brcmstb/pm/s2.S                        |  73 +++
 drivers/soc/brcmstb/wktmr.c                        | 242 ++++++++++
 include/soc/brcmstb/common.h                       |  15 +
 18 files changed, 1314 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-wktmr-brcmstb
 create mode 100644 Documentation/devicetree/bindings/soc/brcmstb/brcm,brcmstb-waketimer.txt
 create mode 100644 drivers/soc/brcmstb/Kconfig
 create mode 100644 drivers/soc/brcmstb/Makefile
 create mode 100644 drivers/soc/brcmstb/common.c
 create mode 100644 drivers/soc/brcmstb/pm/Makefile
 create mode 100644 drivers/soc/brcmstb/pm/aon_defs.h
 create mode 100644 drivers/soc/brcmstb/pm/pm.c
 create mode 100644 drivers/soc/brcmstb/pm/pm.h
 create mode 100644 drivers/soc/brcmstb/pm/s2.S
 create mode 100644 drivers/soc/brcmstb/wktmr.c
 create mode 100644 include/soc/brcmstb/common.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
