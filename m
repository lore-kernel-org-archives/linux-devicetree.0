From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Date: Sat, 23 Sep 2017 08:15:28 +0800
Message-ID: <20170923001531.14285-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset imports simple DVFS support for Allwinner A64 SoC.

As the thermal sensor driver is not yet implemented and some boards
have still no AXP PMIC support, now only two OPPs are present --
648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.

PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
set up the device tree bits of the DVFS on Pine64.

Icenowy Zheng (3):
  clk: sunxi-ng: add mux and pll notifiers for A64 CPU clock
  arm64: allwinner: a64: add CPU opp table
  arm64: allwinner: a64: set CPU regulator for Pine64

 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |  4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 24 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c              | 28 +++++++++++++++++++++-
 3 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
