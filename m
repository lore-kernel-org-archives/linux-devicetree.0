From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC] Mediatek SCPSYS power domain support
Date: Mon,  9 Mar 2015 09:09:59 +0100
Message-ID: <1425888603-25800-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

s series adds support for the MediaTek SCPSYS unit.

The SCPSYS unit handles several power management related tasks such
as thermal measurement, DVFS, interrupt filter and low level sleep
control.

The initial support only contains the generic power domain handling.
This is needed to turn on power to the different power domains.

The driver is quite straight forward now. Due to the lack of a better
place I have put it to drivers/soc/mediatek. As the SCPSYS unit has
several other tasks that also do not fit into some specific subsystem
this probably is a good place for this driver.

What is not clear to me is how the Kconfig dependencies should be
handled. Some domains are disabled by bootloader default, so without
this driver for example sound won't work. So should PM, PM_GENERIC_DOMAINS
and this driver be made mandatory for MT8173? Or should this driver
when PM is disabled be compiled as a stub which only enables all
domains? I don't have a good idea how things should work out here.

Please review, any input welcome.

Sascha

----------------------------------------------------------------
Sascha Hauer (4):
      soc: Mediatek: Add SCPSYS power domain driver
      dt-bindings: soc: Add documentation for the MediaTek SCPSYS unit
      ARM64: MediaTek: Add generic pm domain support
      ARM64: MediaTek MT8173: Add SCPSYS device node

 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  32 ++
 arch/arm64/Kconfig                                 |   1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   6 +
 drivers/soc/mediatek/Kconfig                       |   6 +
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mtk-scpsys.c                  | 398 +++++++++++++++++++++
 include/dt-bindings/power/mt8173-power.h           |  15 +
 7 files changed, 459 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
 create mode 100644 drivers/soc/mediatek/mtk-scpsys.c
 create mode 100644 include/dt-bindings/power/mt8173-power.h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
