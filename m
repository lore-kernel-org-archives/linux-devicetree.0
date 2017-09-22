From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/12] ARM: dts: sunxi: Fix DT build warnings
Date: Fri, 22 Sep 2017 20:40:33 +0200
Message-ID: <20170922184045.6498-1-clabbe.montjoie@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello

The goal of this patch series is to have a clean DT build with W=1.

Regards

Changes since v1:
- moved i2c2 unit address change from patch #2 in patch #1

Corentin Labbe (12):
  ARM: dts: sunxi: h3/h5: Fix simple-bus unit address format error
  ARM: dts: sunxi: h3/h5: Fix i2c2 register address
  ARM: dts: sunxi: h3/h5: Fix node with unit name and no reg property
  ARM: dts: nanopi: Fix node with unit name and no reg property
  ARM: dts: orangepi2: Fix node with unit name and no reg property
  ARM: dts: sun8i: orangepi-lite: Fix node with unit name and no reg
    property
  ARM: dts: sun8i: orangepi one: Fix node with unit name and no reg
    property
  ARM: dts: sun8i: orangepipc: Fix node with unit name and no reg
    property
  ARM: dts: sun8i: orangepi-plus: Fix node with unit name and no reg
    property
  arm64: allwinner: a64: Fix simple-bus unit address format error
  arm64: allwinner: a64: Fix node with unit name and no reg property
  ARM: dts: sun8i: a83t: Fix simple-bus unit address format error

 arch/arm/boot/dts/sun8i-a83t.dtsi             |  6 +-
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi        |  8 +--
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts     |  8 +--
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts  |  6 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts   |  6 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts    |  6 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts  |  2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            | 88 +++++++++++++--------------
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 24 ++++----
 9 files changed, 77 insertions(+), 77 deletions(-)

-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
