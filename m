From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/3] ARM: dts: r7s72100: add sdhi to device tree
Date: Thu, 22 Sep 2016 17:32:10 -0400
Message-ID: <20160922213211.7988-3-chris.brandt@renesas.com>
References: <20160922213211.7988-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160922213211.7988-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index e97d6d1..8e69399 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -458,4 +458,32 @@
 		#size-cells = <0>;
 		status = "disabled";
 	};
+
+	sdhi0: sd@e804e000 {
+		compatible = "renesas,sdhi-r7s72100";
+		reg = <0xe804e000 0x100>;
+		interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&mstp12_clks R7S72100_CLK_SDHI0>;
+		cap-sd-highspeed;
+		cap-sdio-irq;
+		bus-width = <4>;
+		status = "disabled";
+	};
+
+	sdhi1: sd@e804e800 {
+		compatible = "renesas,sdhi-r7s72100";
+		reg = <0xe804e800 0x100>;
+		interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&mstp12_clks R7S72100_CLK_SDHI1>;
+		cap-sd-highspeed;
+		cap-sdio-irq;
+		bus-width = <4>;
+		status = "disabled";
+	};
 };
-- 
2.9.2
