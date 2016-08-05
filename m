From: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/3] Support for the LCDK
Date: Fri,  5 Aug 2016 20:29:48 +0000
Message-ID: <20160805202951.2848-1-kbeldan@baylibre.com>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160804144332.4841-1-kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This depends on "ARM: dts: da850: Add missing pin muxing for the UARTs".

Changes from v1:
 - s/omapl138/da850/
 - Remove earlycon from bootargs
 - Remove console=ttyS2,115200n8 from bootargs (workaround for preferred console)
 - Add patches for CONFIG_SMSC_PHY=y and CONFIG_RTC_DRV_OMAP=m

Changes from v2:
 - [1] Remove references to C6748: replace 'L138/C6748 Dev Kit (LCDK)' with 'LCDK'
 - Change license from 'GPLv2 or later' to 'GPLv2'

Changes from v3:
 - revert v2 [1]

Karl Beldan (3):
  ARM: dts: da850: Add basic DTS for the LCDK
  ARM: davinci_all_defconfig: enable RTC driver as module
  ARM: davinci_all_defconfig: enable SMSC ethernet PHY

 Documentation/devicetree/bindings/arm/davinci.txt |  4 ++
 arch/arm/boot/dts/Makefile                        |  1 +
 arch/arm/boot/dts/da850-lcdk.dts                  | 70 +++++++++++++++++++++++
 arch/arm/configs/davinci_all_defconfig            |  2 +
 arch/arm/mach-davinci/da8xx-dt.c                  |  1 +
 5 files changed, 78 insertions(+)
 create mode 100644 arch/arm/boot/dts/da850-lcdk.dts

-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
