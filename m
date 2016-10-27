From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 4/7] ARM: dts: r8a7743: add Ether support
Date: Fri, 28 Oct 2016 00:38:40 +0300
Message-ID: <2378987.c5J5iVeYae@wasted.cogentembedded.com>
References: <1580369.yToZzJza1l@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1580369.yToZzJza1l-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Define the generic R8A7743 part of the Ether device node.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

---
Changes in version 5:
- refreshed the patch.

Changes in version 4:
- refreshed the patch;
- added Geert's tag.

Changes in version 3:
- resolved a reject;
- updated the "clocks" property for the CPG/MSSR driver.

Changes in version 2:
- new patch.

 arch/arm/boot/dts/r8a7743.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7743.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7743.dtsi
+++ renesas/arch/arm/boot/dts/r8a7743.dtsi
@@ -418,6 +418,18 @@
 			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
+
+		ether: ethernet@ee700000 {
+			compatible = "renesas,ether-r8a7743";
+			reg = <0 0xee700000 0 0x400>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 813>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			phy-mode = "rmii";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	/* External root clock */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
