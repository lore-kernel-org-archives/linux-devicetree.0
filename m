From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH v2 6/9] ARM: dts: r8a7745: Add USB-DMAC device nodes
Date: Mon, 23 Oct 2017 18:09:27 +0100
Message-ID: <1508778570-28795-7-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1508778570-28795-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508778570-28795-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>

From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>

Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Reviewed-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
Changes in v2:
* rebased

 arch/arm/boot/dts/r8a7745.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 40048da1..9733ac5 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -312,6 +312,34 @@
 			dma-channels = <15>;
 		};
 
+		usb_dmac0: dma-controller@e65a0000 {
+			compatible = "renesas,r8a7745-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65a0000 0 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 330>;
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 330>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
+		usb_dmac1: dma-controller@e65b0000 {
+			compatible = "renesas,r8a7745-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65b0000 0 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 331>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
 		scifa0: serial@e6c40000 {
 			compatible = "renesas,scifa-r8a7745",
 				     "renesas,rcar-gen2-scifa", "renesas,scifa";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
