From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 2/2] ARM: shmobile: silk: add eMMC DT support
Date: Fri, 31 Jul 2015 00:55:23 +0300
Message-ID: <1923824.ZmtLDEU8gy@wasted.cogentembedded.com>
References: <1546028.CFITDbxXtD@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1546028.CFITDbxXtD@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the SILK board dependent part of the MMCIF device node (the board has
eMMC chip) along with the  necessary voltage regulator (note that the Vcc/Vccq
regulator is dummy -- it's required by the MMCIF driver but doesn't actually
exist on the board).

Based on the original patch by Vladimir Barinov
<vladimir.barinov@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7794-silk.dts |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794-silk.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794-silk.dts
+++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
@@ -30,6 +30,15 @@
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x40000000>;
 	};
+
+	d3_3v: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "D3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &extal_clk {
@@ -51,6 +60,11 @@
 		renesas,groups = "intc_irq8";
 		renesas,function = "intc";
 	};
+
+	mmcif0_pins: mmcif0 {
+		renesas,groups = "mmc_data8", "mmc_ctrl";
+		renesas,function = "mmc";
+	};
 };
 
 &scif2 {
@@ -75,3 +89,14 @@
 		micrel,led-mode = <1>;
 	};
 };
+
+&mmcif0 {
+	pinctrl-0 = <&mmcif0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&d3_3v>;
+	vqmmc-supply = <&d3_3v>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};

