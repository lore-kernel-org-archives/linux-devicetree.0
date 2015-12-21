From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] arm: lpc32xx: remove direct control of GPIOs from shared mach file
Date: Mon, 21 Dec 2015 21:54:24 +0200
Message-ID: <1450727667-16175-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change moves GPIO controlled voltage regulators from
mach-lpc32xx/phy3250.c to Phytec PHY3250 DTS board file.

The change makes previous versions of PHY3250 DTB incompatible with
the new kernel version, however the change is needed, because regardless
of its name mach-lpc32xx/phy3250.c file is a common file for all
NXP LPC32xx boards and PHY3250 specifics are not needed there.

Changes from v2 to v3:
* use "regulator" as a generic device tree node name of fixed regulators,
  thanks to Sergei Shtylyov

Changes from v1 to v2:
* specify SD card power supply instead of signal power supply,
  thanks to Russell King

Vladimir Zapolskiy (3):
  arm: dts: phy3250: add lcd and backlight fixed regulators
  arm: dts: phy3250: add SD fixed regulator
  arm: lpc32xx: remove direct control of GPIOs from shared mach file

 arch/arm/boot/dts/phy3250.dts   | 32 +++++++++++++++++++++++++
 arch/arm/mach-lpc32xx/phy3250.c | 52 -----------------------------------------
 2 files changed, 32 insertions(+), 52 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
