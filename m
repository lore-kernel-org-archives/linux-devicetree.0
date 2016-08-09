From: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Add DT support for NAND to LCDK
Date: Tue,  9 Aug 2016 17:15:14 +0000
Message-ID: <20160809171518.22690-1-kbeldan@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Karl Beldan <karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This does not use the same way the current da8xx boards do, instead
it is using the more generic and DT friendly memory driver ti-aemif.
I can do the same for the da850-evm and retire the dts nandcs3 instances.

Karl Beldan (4):
  memory: ti-aemif: Get a named clock rather than an unnamed one
  ARM: dts: da850: Add an aemif node
  ARM: dts: da850-lcdk: Add NAND to DT
  ARM: davinci_all_defconfig: Enable AEMIF as a module

 arch/arm/boot/dts/da850-lcdk.dts       | 108 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/da850.dtsi           |  10 +++
 arch/arm/configs/davinci_all_defconfig |   2 +
 drivers/memory/ti-aemif.c              |   2 +-
 4 files changed, 121 insertions(+), 1 deletion(-)

-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
