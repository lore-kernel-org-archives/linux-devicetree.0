From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 3/3] ARM: dts: rskrza1: add ostm DT support
Date: Thu, 12 Jan 2017 14:01:08 -0500
Message-ID: <20170112190108.2856-4-chris.brandt@renesas.com>
References: <20170112190108.2856-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170112190108.2856-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 4 ++++
 arch/arm/boot/dts/r7s72100.dtsi        | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index dd44181..e7b6afa 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -61,6 +61,10 @@
 	status = "okay";
 };
 
+&ostm {
+	status = "okay";
+};
+
 &scif2 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 247bbe0..974c084 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -513,7 +513,8 @@
 		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING
 			      GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
 
-		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>, <&mstp5_clks R7S72100_CLK_OSTM1>;
+		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>,
+			 <&mstp5_clks R7S72100_CLK_OSTM1>;
 		status = "disabled";
 	};
 };
-- 
2.10.1
