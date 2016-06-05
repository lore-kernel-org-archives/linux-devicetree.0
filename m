From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: mxs: fix dtc warnings
Date: Sun,  5 Jun 2016 13:48:10 +0000
Message-ID: <1465134490-13383-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series fixes some dtc warnings for the mxs platform.

The first patch has been tested with real hardware. The others are
only compile tested.

Stefan Wahren (4):
  ARM: dts: mxs: add missing reg properties for GPIO banks
  ARM: dts: imx28-eukrea-mbmx28lc: add missing reg properties
  ARM: dts: imx28-cfa10049: fix dtc warning
  ARM: dts: imx28-tx28: fix dtc warning

 arch/arm/boot/dts/imx23.dtsi                 |    3 +++
 arch/arm/boot/dts/imx28-cfa10049.dts         |    2 +-
 arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi |    4 ++++
 arch/arm/boot/dts/imx28-tx28.dts             |    2 +-
 arch/arm/boot/dts/imx28.dtsi                 |    5 +++++
 5 files changed, 14 insertions(+), 2 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
