From: Priit Laes <plaes@plaes.org>
Subject: [PATCH 3/3] ARM: dts: sun4i: Add i2s0 block to dtsi
Date: Sun,  3 Sep 2017 16:50:18 +0300
Message-ID: <795031fd20e33b17db89947d12d83d01c78f62f0.1504446535.git-series.plaes@plaes.org>
References: <cover.28f5be8e511ad74e9ae3f573891882e62bebdb7b.1504446535.git-series.plaes@plaes.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.28f5be8e511ad74e9ae3f573891882e62bebdb7b.1504446535.git-series.plaes@plaes.org>
In-Reply-To: <cover.28f5be8e511ad74e9ae3f573891882e62bebdb7b.1504446535.git-series.plaes@plaes.org>
References: <cover.28f5be8e511ad74e9ae3f573891882e62bebdb7b.1504446535.git-series.plaes@plaes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, Priit Laes <plaes@plaes.org>
List-Id: devicetree@vger.kernel.org

sun4i-a10.dtsi was missing i2s0 block. Add it.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index c5efd53..9899ecd 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -670,6 +670,19 @@
 			status = "disabled";
 		};
 
+		i2s0: i2s@01c22400 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun4i-a10-i2s";
+			reg = <0x01c22400 0x400>;
+			interrupts = <16>;
+			clocks = <&ccu CLK_APB0_I2S0>, <&ccu CLK_I2S0>;
+			clock-names = "apb", "mod";
+			dmas = <&dma SUN4I_DMA_NORMAL 3>,
+			       <&dma SUN4I_DMA_NORMAL 3>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		lradc: lradc@01c22800 {
 			compatible = "allwinner,sun4i-a10-lradc-keys";
 			reg = <0x01c22800 0x100>;
-- 
git-series 0.9.1
