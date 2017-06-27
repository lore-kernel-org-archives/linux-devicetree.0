From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH] arm64: dts: r8a7796: Add DRIF support
Date: Tue, 27 Jun 2017 13:54:38 +0100
Message-ID: <20170627125438.44491-1-ramesh.shanmugasundaram@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds the DRIF controller nodes for r8a7796.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
Hi Simon,

   This patch is based on renesas-devel-20170626-v4.12-rc7 tag.
   It is verified on M3 ES1.0. I also verified there are no regression issues
   with this addition.

   The driver[1] is pushed into the media_tree. The bindings[2] are ACK'ed
   by Geert & Rob and in the media_tree queue.

   [1] https://git.linuxtv.org/media_tree.git/commit/?id=7625ee981af166ddb569e2e6c0006e2af471326f
   [2] https://www.mail-archive.com/linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg15602.html

Thanks,
Ramesh.

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 120 +++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1f6710912045..df04d132a127 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -639,6 +639,126 @@
 			};
 		};
 
+		drif00: rif@e6f40000 {
+			compatible = "renesas,r8a7796-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f40000 0 0x64>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 515>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x20>, <&dmac2 0x20>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 515>;
+			renesas,bonding = <&drif01>;
+			status = "disabled";
+		};
+
+		drif01: rif@e6f50000 {
+			compatible = "renesas,r8a7796-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f50000 0 0x64>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 514>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x22>, <&dmac2 0x22>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 514>;
+			renesas,bonding = <&drif00>;
+			status = "disabled";
+		};
+
+		drif10: rif@e6f60000 {
+			compatible = "renesas,r8a7796-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f60000 0 0x64>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 513>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x24>, <&dmac2 0x24>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 513>;
+			renesas,bonding = <&drif11>;
+			status = "disabled";
+		};
+
+		drif11: rif@e6f70000 {
+			compatible = "renesas,r8a7796-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f70000 0 0x64>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 512>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x26>, <&dmac2 0x26>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 512>;
+			renesas,bonding = <&drif10>;
+			status = "disabled";
+		};
+
+		drif20: rif@e6f80000 {
+			compatible = "renesas,r8a7796-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f80000 0 0x64>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 511>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x28>, <&dmac2 0x28>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 511>;
+			renesas,bonding = <&drif21>;
+			status = "disabled";
+		};
+
+		drif21: rif@e6f90000 {
+			compatible = "renesas,r8a7796-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f90000 0 0x64>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 510>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x2a>, <&dmac2 0x2a>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 510>;
+			renesas,bonding = <&drif20>;
+			status = "disabled";
+		};
+
+		drif30: rif@e6fa0000 {
+			compatible = "renesas,r8a7796-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6fa0000 0 0x64>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 509>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x2c>, <&dmac2 0x2c>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 509>;
+			renesas,bonding = <&drif31>;
+			status = "disabled";
+		};
+
+		drif31: rif@e6fb0000 {
+			compatible = "renesas,r8a7796-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6fb0000 0 0x64>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 508>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x2e>, <&dmac2 0x2e>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 508>;
+			renesas,bonding = <&drif30>;
+			status = "disabled";
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a7796",
 				     "renesas,etheravb-rcar-gen3";
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
