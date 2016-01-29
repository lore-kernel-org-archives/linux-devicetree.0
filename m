From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 04/11] ARM: dts: r8a7740: Rename the serial port clock to fck
Date: Fri, 29 Jan 2016 10:47:34 +0100
Message-ID: <1454060861-2375-5-git-send-email-geert+renesas@glider.be>
References: <1454060861-2375-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1454060861-2375-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The clock is really the device functional clock, not the interface
clock. Rename it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Change one-line summary prefix to match current arm-soc practices,

v3:
  - No changes,

v2:
  - Add Acked-by.
---
 arch/arm/boot/dts/r8a7740.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 36bcb39cca03b8df..995fbda74b7a057e 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -214,7 +214,7 @@
 		reg = <0xe6c40000 0x100>;
 		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFA0>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -224,7 +224,7 @@
 		reg = <0xe6c50000 0x100>;
 		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFA1>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -234,7 +234,7 @@
 		reg = <0xe6c60000 0x100>;
 		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFA2>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -244,7 +244,7 @@
 		reg = <0xe6c70000 0x100>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFA3>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -254,7 +254,7 @@
 		reg = <0xe6c80000 0x100>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFA4>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -264,7 +264,7 @@
 		reg = <0xe6cb0000 0x100>;
 		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFA5>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -274,7 +274,7 @@
 		reg = <0xe6cc0000 0x100>;
 		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFA6>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -284,7 +284,7 @@
 		reg = <0xe6cd0000 0x100>;
 		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFA7>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -294,7 +294,7 @@
 		reg = <0xe6c30000 0x100>;
 		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7740_CLK_SCIFB>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
-- 
1.9.1
