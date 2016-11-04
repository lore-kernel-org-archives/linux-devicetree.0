From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 07/11] ARM: dts: r8a7745: add Ether support
Date: Fri, 04 Nov 2016 14:57:01 -0700 (PDT)
Message-ID: <3730528.dQt2IAcchy@wasted.cogentembedded.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the generic R8A7745 part of the Ether device node.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- added Geert's tag.

 arch/arm/boot/dts/r8a7745.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7745.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7745.dtsi
+++ renesas/arch/arm/boot/dts/r8a7745.dtsi
@@ -418,6 +418,18 @@
 			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
+
+		ether: ethernet@ee700000 {
+			compatible = "renesas,ether-r8a7745";
+			reg = <0 0xee700000 0 0x400>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 813>;
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			phy-mode = "rmii";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	/* External root clock */
