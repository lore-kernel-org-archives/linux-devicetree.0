From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 0/5] mtd: nand: gpmi: add i.MX 7 support
Date: Thu, 20 Apr 2017 18:07:50 -0700
Message-ID: <20170421010755.18025-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for i.MX 7 SoC for the GPMI NAND controller.
There have been similar patchsets already:
https://lkml.org/lkml/2016/2/23/912

However, this patchset does not make use of any of the new features.
The current feature set seems to work fine, I successfully run the MTD
tests on a Colibri iMX7.

--
Stefan

Stefan Agner (5):
  mtd: nand: gpmi: unify clock handling
  mtd: nand: gpmi: add i.MX 7 SoC support
  mtd: gpmi: document current clock requirements
  ARM: dts: imx7: add GPMI NAND
  ARM: dts: imx7-colibri: add NAND support

 .../devicetree/bindings/mtd/gpmi-nand.txt          | 14 +++++-
 arch/arm/boot/dts/imx7-colibri.dtsi                |  9 ++++
 arch/arm/boot/dts/imx7s.dtsi                       | 31 ++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 56 +++++++++++++---------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |  2 +
 5 files changed, 88 insertions(+), 24 deletions(-)

-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
