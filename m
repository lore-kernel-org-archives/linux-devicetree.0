From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 01/11] ARM: dts: sh73a0: Rename the serial port clock to fck
Date: Fri, 29 Jan 2016 10:47:31 +0100
Message-ID: <1454060861-2375-2-git-send-email-geert+renesas@glider.be>
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
 arch/arm/boot/dts/sh73a0.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 453280c41d2725b3..bf825ca4f6f7912a 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -359,7 +359,7 @@
 		reg = <0xe6c40000 0x100>;
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks SH73A0_CLK_SCIFA0>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -369,7 +369,7 @@
 		reg = <0xe6c50000 0x100>;
 		interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks SH73A0_CLK_SCIFA1>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -379,7 +379,7 @@
 		reg = <0xe6c60000 0x100>;
 		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks SH73A0_CLK_SCIFA2>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -389,7 +389,7 @@
 		reg = <0xe6c70000 0x100>;
 		interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks SH73A0_CLK_SCIFA3>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -399,7 +399,7 @@
 		reg = <0xe6c80000 0x100>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks SH73A0_CLK_SCIFA4>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -409,7 +409,7 @@
 		reg = <0xe6cb0000 0x100>;
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks SH73A0_CLK_SCIFA5>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -419,7 +419,7 @@
 		reg = <0xe6cc0000 0x100>;
 		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_SCIFA6>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -429,7 +429,7 @@
 		reg = <0xe6cd0000 0x100>;
 		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks SH73A0_CLK_SCIFA7>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
@@ -439,7 +439,7 @@
 		reg = <0xe6c30000 0x100>;
 		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks SH73A0_CLK_SCIFB>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
 	};
-- 
1.9.1
