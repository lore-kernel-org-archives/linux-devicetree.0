From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH] ARM: dts: r8a7745: Add MSIOF[012] support
Date: Wed, 27 Sep 2017 10:57:05 +0100
Message-ID: <1506506225-5015-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1506506225-5015-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506506225-5015-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the DT nodes needed by MSIOF[012] interfaces to the SoC dtsi.
Also, define aliases for spi[123].

Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---

This patch depends on the corresponding dt-bindings patch:
* spi: sh-msiof: Add r8a774[35] to the compatible list
which has been applied to linux-next already.

Best regards,
Fabrizio

 arch/arm/boot/dts/r8a7745.dtsi | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index b819ec5..4d41da4 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -26,6 +26,9 @@
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
 		spi0 = &qspi;
+		spi1 = &msiof0;
+		spi2 = &msiof1;
+		spi3 = &msiof2;
 	};
 
 	cpus {
@@ -769,6 +772,54 @@
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e20000 {
+			compatible = "renesas,msiof-r8a7745",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e20000 0 0x0064>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 000>;
+			dmas = <&dmac0 0x51>, <&dmac0 0x52>,
+			       <&dmac1 0x51>, <&dmac1 0x52>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 000>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6e10000 {
+			compatible = "renesas,msiof-r8a7745",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e10000 0 0x0064>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			dmas = <&dmac0 0x55>, <&dmac0 0x56>,
+			       <&dmac1 0x55>, <&dmac1 0x56>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 208>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6e00000 {
+			compatible = "renesas,msiof-r8a7745",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e00000 0 0x0064>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 205>;
+			dmas = <&dmac0 0x41>, <&dmac0 0x42>,
+			       <&dmac1 0x41>, <&dmac1 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 205>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a7745";
 			reg = <0 0xee100000 0 0x328>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
