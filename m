From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH v2 1/2] ARM: sun8i: a83t: Add dt node for the syscon control module
Date: Wed,  7 Jun 2017 19:33:44 +0200
Message-ID: <20170607173345.22462-2-clabbe.montjoie@gmail.com>
References: <20170607173345.22462-1-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170607173345.22462-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch add the dt node for the syscon register present on the
Allwinner A83T

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 49aeb56970ba..01a83406f9ae 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -163,6 +163,12 @@
 		#size-cells = <1>;
 		ranges;
 
+		syscon: syscon@1c00000 {
+			compatible = "allwinner,sun8i-a83t-system-controller",
+				"syscon";
+			reg = <0x01c00000 0x1000>;
+		};
+
 		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun8i-a83t-dma";
 			reg = <0x01c02000 0x1000>;
-- 
2.13.0
