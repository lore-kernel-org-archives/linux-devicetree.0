From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH 02/12] ARM: dts: sunxi: h3/h5: Fix i2c2 register address
Date: Thu, 21 Sep 2017 19:21:41 +0200
Message-ID: <20170921172151.29779-3-clabbe.montjoie@gmail.com>
References: <20170921172151.29779-1-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921172151.29779-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

The unit address and register address does not match.
This patch fix the register address with the good one.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 59ddac9f65a7..37464d4d07f6 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -630,9 +630,9 @@
 			#size-cells = <0>;
 		};
 
-		i2c2: i2c@01c2b400 {
+		i2c2: i2c@1c2b400 {
 			compatible = "allwinner,sun6i-a31-i2c";
-			reg = <0x01c2b000 0x400>;
+			reg = <0x1c2b400 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C2>;
 			resets = <&ccu RST_BUS_I2C2>;
-- 
2.13.5
