From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] ARM: shmobile: r8a7790: add EtherAVB DT support
Date: Tue, 31 Mar 2015 00:59:41 +0300
Message-ID: <8163383.0UU0Q5gsLE@wasted.cogentembedded.com>
References: <1625400.M0MxPQybIy@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1625400.M0MxPQybIy@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the generic R8A7790 part of the EtherAVB device node. 

Based on original patch by Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7790.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7790.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7790.dtsi
+++ renesas/arch/arm/boot/dts/r8a7790.dtsi
@@ -626,6 +626,16 @@
 		status = "disabled";
 	};
 
+	avb: ethernet@e6800000 {
+		compatible = "renesas,ravb-r8a7790";
+		reg = <0 0xe6800000 0 0x800>, <0 0xee0e8000 0 0x4000>;
+		interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp8_clks R8A7790_CLK_ETHERAVB>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	sata0: sata@ee300000 {
 		compatible = "renesas,sata-r8a7790";
 		reg = <0 0xee300000 0 0x2000>;

