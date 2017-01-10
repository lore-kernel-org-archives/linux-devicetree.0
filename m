From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/3] arm64: dts: A64 board MMC support
Date: Tue, 10 Jan 2017 01:22:30 +0000
Message-ID: <1484011353-21480-1-git-send-email-andre.przywara@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

These patches here go on top of Maxime's latest A64 MMC series and
enable the MMC controllers on the boards using the A64 SoC.
As the BananaPi-M64 DT now looks different, lets adds support for
that board as well, with one major difference to the Pine64 being the eMMC
chip.

I could't find commit f9ca9b952ee1 Maxime mentioned in his cover letter,
so I applied his patches on top of sunxi/for-next and cherry-picked
b4b8664d29 to fix the arm64 build.

Cheers,
Andre.

Andre Przywara (3):
  arm64: dts: Pine64: add MMC support
  arm64: dts: sun50i: add UART1 pin nodes
  arm64: dts: add BananaPi-M64 support

 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts | 120 +++++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |  20 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  10 ++
 4 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts

-- 
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
