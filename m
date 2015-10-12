From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] arm: dts: lpc32xx: fixes and updates to lpc32xx.dtsi
Date: Tue, 13 Oct 2015 02:54:00 +0300
Message-ID: <1444694045-22000-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The changeset fixes two problems in lpc32xx.dtsi:
- misusage of ranges property,
- improper description of two separate PWM controllers under one
  device node

and adds a number of lesser clean-ups and improvements.

Vladimir Zapolskiy (5):
  arm: dts: lpc32xx: change include syntax to be C preprocessor friendly
  arm: dts: lpc32xx: fix improper usage of ranges property
  arm: dts: lpc32xx: add labels to all defined peripheral nodes
  arm: dts: lpc32xx: remove unneeded cell settings from cpus
  arm: dts: lpc32xx: add device node for the second pwm controller

 arch/arm/boot/dts/ea3250.dts   |  2 +-
 arch/arm/boot/dts/lpc32xx.dtsi | 41 ++++++++++++++++++++++-------------------
 arch/arm/boot/dts/phy3250.dts  |  2 +-
 3 files changed, 24 insertions(+), 21 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
