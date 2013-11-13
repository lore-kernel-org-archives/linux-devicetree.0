From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/3] devicetree includes for i.MX5 clocks
Date: Wed, 13 Nov 2013 20:11:16 +0100
Message-ID: <1384369879-11878-1-git-send-email-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series introduces devicetree includes for the i.MX5
SoC clocks. It makes devicetrees easier to read for humans and
less error prone.

The series is spun against Shawns for-next branch, as there are
already some clock related patches in there. I would like to
see those patches sitting in -next for a while.

Lucas Stach (3):
  clk: imx5: introduce DT includes for clock provider
  ARM: imx53: use clock defines in DTS files
  ARM: imx51: use clock defines in DTS files

 .../devicetree/bindings/clock/imx5-clock.txt       | 196 +----
 arch/arm/boot/dts/imx51.dtsi                       |  98 ++-
 arch/arm/boot/dts/imx53-m53evk.dts                 |   2 +-
 arch/arm/boot/dts/imx53-mba53.dts                  |   2 +-
 arch/arm/boot/dts/imx53-qsb.dts                    |   2 +-
 arch/arm/boot/dts/imx53.dtsi                       | 122 ++--
 arch/arm/mach-imx/clk-imx51-imx53.c                | 786 ++++++++++-----------
 include/dt-bindings/clock/imx5-clock.h             | 202 ++++++
 8 files changed, 718 insertions(+), 692 deletions(-)
 create mode 100644 include/dt-bindings/clock/imx5-clock.h

-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
