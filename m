From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 4/5] ARM: dts: r7s72100: add rtc to device tree
Date: Thu, 16 Mar 2017 13:51:11 -0400
Message-ID: <20170316175112.27913-5-chris.brandt@renesas.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170316175112.27913-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 2a42a79..e047fc8 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -551,4 +551,15 @@
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
+
+	rtc: rtc@fcff1000 {
+		compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
+		reg = <0xfcff1000 0x2e>;
+		interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
+			      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
+			      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&mstp6_clks R7S72100_CLK_RTC>;
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
 };
-- 
2.10.1
