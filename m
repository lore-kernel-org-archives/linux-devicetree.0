From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] ARM: dts: r8a7794: Fix W=1 dtc warnings
Date: Tue,  4 Oct 2016 15:31:48 +0200
Message-ID: <1475587908-22151-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,dvc/dvc@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,dvc/dvc@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,mix/mix@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,mix/mix@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ctu/ctu@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ctu/ctu@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ctu/ctu@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ctu/ctu@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ctu/ctu@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ctu/ctu@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ctu/ctu@6 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ctu/ctu@7 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,src/src@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,src/src@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,src/src@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,src/src@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,src/src@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,src/src@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,src/src@6 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@6 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@7 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@8 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,ssi/ssi@9 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/r8a7794.dtsi | 58 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index f53c75b2b0d33de2..7bfa57f357d4ad2a 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -1502,62 +1502,62 @@
 		status = "disabled";
 
 		rcar_sound,dvc {
-			dvc0: dvc@0 {
+			dvc0: dvc-0 {
 				dmas = <&audma0 0xbc>;
 				dma-names = "tx";
 			};
-			dvc1: dvc@1 {
+			dvc1: dvc-1 {
 				dmas = <&audma0 0xbe>;
 				dma-names = "tx";
 			};
 		};
 
 		rcar_sound,mix {
-			mix0: mix@0 { };
-			mix1: mix@1 { };
+			mix0: mix-0 { };
+			mix1: mix-1 { };
 		};
 
 		rcar_sound,ctu {
-			ctu00: ctu@0 { };
-			ctu01: ctu@1 { };
-			ctu02: ctu@2 { };
-			ctu03: ctu@3 { };
-			ctu10: ctu@4 { };
-			ctu11: ctu@5 { };
-			ctu12: ctu@6 { };
-			ctu13: ctu@7 { };
+			ctu00: ctu-0 { };
+			ctu01: ctu-1 { };
+			ctu02: ctu-2 { };
+			ctu03: ctu-3 { };
+			ctu10: ctu-4 { };
+			ctu11: ctu-5 { };
+			ctu12: ctu-6 { };
+			ctu13: ctu-7 { };
 		};
 
 		rcar_sound,src {
-			src@0 {
+			src-0 {
 				status = "disabled";
 			};
-			src1: src@1 {
+			src1: src-1 {
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x87>, <&audma0 0x9c>;
 				dma-names = "rx", "tx";
 			};
-			src2: src@2 {
+			src2: src-2 {
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x89>, <&audma0 0x9e>;
 				dma-names = "rx", "tx";
 			};
-			src3: src@3 {
+			src3: src-3 {
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x8b>, <&audma0 0xa0>;
 				dma-names = "rx", "tx";
 			};
-			src4: src@4 {
+			src4: src-4 {
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x8d>, <&audma0 0xb0>;
 				dma-names = "rx", "tx";
 			};
-			src5: src@5 {
+			src5: src-5 {
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x8f>, <&audma0 0xb2>;
 				dma-names = "rx", "tx";
 			};
-			src6: src@6 {
+			src6: src-6 {
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x91>, <&audma0 0xb4>;
 				dma-names = "rx", "tx";
@@ -1565,61 +1565,61 @@
 		};
 
 		rcar_sound,ssi {
-			ssi0: ssi@0 {
+			ssi0: ssi-0 {
 				interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x01>, <&audma0 0x02>,
 				       <&audma0 0x15>, <&audma0 0x16>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi1: ssi@1 {
+			ssi1: ssi-1 {
 				interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x03>, <&audma0 0x04>,
 				       <&audma0 0x49>, <&audma0 0x4a>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi2: ssi@2 {
+			ssi2: ssi-2 {
 				interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x05>, <&audma0 0x06>,
 				       <&audma0 0x63>, <&audma0 0x64>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi3: ssi@3 {
+			ssi3: ssi-3 {
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x07>, <&audma0 0x08>,
 				       <&audma0 0x6f>, <&audma0 0x70>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi4: ssi@4 {
+			ssi4: ssi-4 {
 				interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x09>, <&audma0 0x0a>,
 				       <&audma0 0x71>, <&audma0 0x72>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi5: ssi@5 {
+			ssi5: ssi-5 {
 				interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x0b>, <&audma0 0x0c>,
 				       <&audma0 0x73>, <&audma0 0x74>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi6: ssi@6 {
+			ssi6: ssi-6 {
 				interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x0d>, <&audma0 0x0e>,
 				       <&audma0 0x75>, <&audma0 0x76>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi7: ssi@7 {
+			ssi7: ssi-7 {
 				interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x0f>, <&audma0 0x10>,
 				       <&audma0 0x79>, <&audma0 0x7a>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi8: ssi@8 {
+			ssi8: ssi-8 {
 				interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x11>, <&audma0 0x12>,
 				       <&audma0 0x7b>, <&audma0 0x7c>;
 				dma-names = "rx", "tx", "rxu", "txu";
 			};
-			ssi9: ssi@9 {
+			ssi9: ssi-9 {
 				interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&audma0 0x13>, <&audma0 0x14>,
 				       <&audma0 0x7d>, <&audma0 0x7e>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
