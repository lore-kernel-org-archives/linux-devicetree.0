From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] ARM: meson: Add reset controller
Date: Sun, 12 Oct 2014 16:54:36 +0200
Message-ID: <1413125679-24443-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Apparently several IPs found in the MesonX SoCs can be reset by programming a
specific bit in a register in the so called AO (Always-On) domain. From the
documentation released by Amlogic under NDA it is not clear which devices can
be reset acting on this register. So far from the sources release by Amlogic it
seems that at least two IPs use this register for reset: RTC and UART. Since I
need it to reset the RTC, I wrote this small driver.

Carlo Caione (3):
  ARM: meson: reset: Add reset controller for MesonX SoCs
  ARM: meson: DTSI: Enable reset controller
  ARM: meson: docs: Add docs for MesonX reset controller

 .../bindings/reset/amlogic,meson6-rst-mgr-ao.txt   |  14 ++
 arch/arm/boot/dts/meson.dtsi                       |   6 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-meson.c                        | 152 +++++++++++++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson6-rst-mgr-ao.txt
 create mode 100644 drivers/reset/reset-meson.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
