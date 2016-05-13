From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 04/23] ARM: dts: r8a7778: Fix W=1 dtc warnings
Date: Fri, 13 May 2016 09:55:44 +0200
Message-ID: <1463126163-29423-5-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463126163-29423-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@6 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@7 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@8 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@9 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@6 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@7 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@8 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@9 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/r8a7778.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index fe787b4751d2cf05..e571d66ea0fe1721 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -276,23 +276,23 @@
 		status = "disabled";
 
 		rcar_sound,src {
-			src3: src@3 { };
-			src4: src@4 { };
-			src5: src@5 { };
-			src6: src@6 { };
-			src7: src@7 { };
-			src8: src@8 { };
-			src9: src@9 { };
+			src3: src-3 { };
+			src4: src-4 { };
+			src5: src-5 { };
+			src6: src-6 { };
+			src7: src-7 { };
+			src8: src-8 { };
+			src9: src-9 { };
 		};
 
 		rcar_sound,ssi {
-			ssi3: ssi@3 { interrupts = <GIC_SPI 0x85 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi4: ssi@4 { interrupts = <GIC_SPI 0x85 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi5: ssi@5 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi6: ssi@6 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi7: ssi@7 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi8: ssi@8 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi9: ssi@9 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi3: ssi-3 { interrupts = <GIC_SPI 0x85 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi4: ssi-4 { interrupts = <GIC_SPI 0x85 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi5: ssi-5 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi6: ssi-6 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi7: ssi-7 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi8: ssi-8 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi9: ssi-9 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
 		};
 	};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
