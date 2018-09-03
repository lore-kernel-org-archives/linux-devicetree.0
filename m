From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 3/3] ARM: sun8i: dts: r40: drop A64 fallback compatible string of HDMI PHY
Date: Mon,  3 Sep 2018 21:34:34 +0800
Message-ID: <20180903133434.58188-4-icenowy@aosc.io>
References: <20180903133434.58188-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903133434.58188-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The A64 HDMI PHY is proven to have no PLL-VIDEO mux, thus it's not
compatible with the R40 one.

Drop the A64 fallback compatible string in R40 device tree.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index ffd9f00f74a4..5f547c161baf 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -800,8 +800,7 @@
 		};
 
 		hdmi_phy: hdmi-phy@1ef0000 {
-			compatible = "allwinner,sun8i-r40-hdmi-phy",
-				     "allwinner,sun50i-a64-hdmi-phy";
+			compatible = "allwinner,sun8i-r40-hdmi-phy";
 			reg = <0x01ef0000 0x10000>;
 			clocks = <&ccu CLK_BUS_HDMI1>, <&ccu CLK_HDMI_SLOW>,
 				 <&ccu 7>, <&ccu 16>;
-- 
2.18.0
