From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH] ARM: sun8i: r40: add watchdog device node
Date: Fri, 13 Oct 2017 19:26:21 +0800
Message-ID: <20171013112621.18932-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The R40 SoC has a watchdog like the one on A20, in the timer memory zone
(which is also the same on A20).

Add the device tree node for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index d5a6745409ae..ddcb3fff4cd4 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -229,6 +229,11 @@
 			};
 		};
 
+		wdt: watchdog@1c20c90 {
+			compatible = "allwinner,sun4i-a10-wdt";
+			reg = <0x01c20c90 0x10>;
+		};
+
 		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
-- 
2.13.6
