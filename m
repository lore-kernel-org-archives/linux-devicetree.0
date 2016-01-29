From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v4 11/11] arm64: dts: r8a7795: Rename the serial port clock to fck
Date: Fri, 29 Jan 2016 10:47:41 +0100
Message-ID: <1454060861-2375-12-git-send-email-geert+renesas@glider.be>
References: <1454060861-2375-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454060861-2375-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clock is really the device functional clock, not the interface
clock. Rename it.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
v4:
  - Change one-line summary prefix to match current arm-soc practices,

v3:
  - Add Acked-by,

v2:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index e5c38d1a551df78a..185eb9b4a3f543d8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -480,7 +480,7 @@
 			reg = <0 0xe6540000 0 96>;
 			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 520>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac1 0x31>, <&dmac1 0x30>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -494,7 +494,7 @@
 			reg = <0 0xe6550000 0 96>;
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 519>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac1 0x33>, <&dmac1 0x32>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -508,7 +508,7 @@
 			reg = <0 0xe6560000 0 96>;
 			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 518>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac1 0x35>, <&dmac1 0x34>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -522,7 +522,7 @@
 			reg = <0 0xe66a0000 0 96>;
 			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 517>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac0 0x37>, <&dmac0 0x36>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -536,7 +536,7 @@
 			reg = <0 0xe66b0000 0 96>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 516>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac0 0x39>, <&dmac0 0x38>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -549,7 +549,7 @@
 			reg = <0 0xe6e60000 0 64>;
 			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 207>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac1 0x51>, <&dmac1 0x50>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -562,7 +562,7 @@
 			reg = <0 0xe6e68000 0 64>;
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 206>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac1 0x53>, <&dmac1 0x52>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -575,7 +575,7 @@
 			reg = <0 0xe6e88000 0 64>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 310>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac1 0x13>, <&dmac1 0x12>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -588,7 +588,7 @@
 			reg = <0 0xe6c50000 0 64>;
 			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 204>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac0 0x57>, <&dmac0 0x56>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -601,7 +601,7 @@
 			reg = <0 0xe6c40000 0 64>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 203>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac0 0x59>, <&dmac0 0x58>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
@@ -614,7 +614,7 @@
 			reg = <0 0xe6f30000 0 64>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 202>;
-			clock-names = "sci_ick";
+			clock-names = "fck";
 			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>;
 			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
