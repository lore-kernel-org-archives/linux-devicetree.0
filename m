From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH 1/4] ARM: dts: sun8i-a83t: Add dt node for the syscon control module
Date: Fri,  2 Jun 2017 11:11:23 +0200
Message-ID: <20170602091126.14476-1-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch add the dt node for the syscon register present on the
Allwinner A83T

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 1dc4cfe81534..a570dac9ba35 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -163,6 +163,12 @@
 		#size-cells = <1>;
 		ranges;
 
+		syscon: syscon@01c00000 {
+			compatible = "syscon",
+				"allwinner,sun8i-a83t-system-controller";
+			reg = <0x01c00000 0x1000>;
+		};
+
 		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun8i-a83t-dma";
 			reg = <0x01c02000 0x1000>;
-- 
2.13.0
