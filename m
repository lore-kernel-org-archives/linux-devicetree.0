From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 0/5] Change vendor prefix for Intersil Corporation
Date: Mon,  8 Sep 2014 11:19:15 +0200
Message-ID: <1410167960-554-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

currently there is a wild mixture of isl, isil, and intersil
compatibles in the kernel. I figure at this point it is still
possible to change this to use "isil" everywhere without too
much pain, but it might be preferred to keep the already
documented "isl" prefix, even though it doesn't follow the
convention to use the NASDAQ symbol where available.

This is an updated version of the RFC I've sent previously:
https://www.mail-archive.com/devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg38505.html

Changes since RFC:
 - Drop powerpc/85xx patch, that device tree set in stone.
 - Added commit summaries where referencing commit ids
 - Added deprecated names to the documentation

regards
Philipp

Philipp Zabel (5):
  of: Change vendor prefix for Intersil Corporation to isil
  Documentation: Add isl1208 and isl12022 to trivial-devices list
  ARM: mvebu: Change vendor prefix for Intersil Corporation to isil
  rtc: rtc-isl12022: Change vendor prefix for Intersil Corporation to
    isil
  rtc: rtc-isl12057: Change vendor prefix for Intersil Corporation to
    isil

 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 6 +++++-
 Documentation/devicetree/bindings/vendor-prefixes.txt     | 4 +++-
 arch/arm/boot/dts/armada-370-netgear-rn102.dts            | 2 +-
 arch/arm/boot/dts/armada-370-netgear-rn104.dts            | 2 +-
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts            | 2 +-
 drivers/rtc/rtc-isl12022.c                                | 3 ++-
 drivers/rtc/rtc-isl12057.c                                | 3 ++-
 7 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.1.0.rc1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
