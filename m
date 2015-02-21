From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] ARM: shmobile: r8a7794: add SDHI DT support
Date: Sun, 22 Feb 2015 01:26:37 +0300
Message-ID: <4571288.SFHfW35Ob9@wasted.cogentembedded.com>
References: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the generic R8A7794 parts of the SDHI[012] device nodes.

Based on the orginal patch by Shinobu Uehara <shinobu.uehara.xc@renesas.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7794.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -441,6 +441,30 @@
 		status = "disabled";
 	};
 
+	sdhi0: sd@ee100000 {
+		compatible = "renesas,sdhi-r8a7794";
+		reg = <0 0xee100000 0 0x200>;
+		interrupts = <0 165 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7794_CLK_SDHI0>;
+		status = "disabled";
+	};
+
+	sdhi1: sd@ee140000 {
+		compatible = "renesas,sdhi-r8a7794";
+		reg = <0 0xee140000 0 0x100>;
+		interrupts = <0 167 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7794_CLK_SDHI1>;
+		status = "disabled";
+	};
+
+	sdhi2: sd@ee160000 {
+		compatible = "renesas,sdhi-r8a7794";
+		reg = <0 0xee160000 0 0x100>;
+		interrupts = <0 168 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7794_CLK_SDHI2>;
+		status = "disabled";
+	};
+
 	clocks {
 		#address-cells = <2>;
 		#size-cells = <2>;

