From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 4/6] ARM: dts: r8a7794: add Audio-DMAC support
Date: Thu, 12 May 2016 23:47:31 +0300
Message-ID: <25671875.9c5xSSzmjj@wasted.cogentembedded.com>
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2378837.cigT3tNQPe-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe Audio-DMAC in the R8A7794 device tree.

This patch is loosely based on the commit 8994fff67761 ("ARM: shmobile:
r8a7791: Add Audio DMAC devices to DT").

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
Changes in version 3:
- refreshed the patch.

 arch/arm/boot/dts/r8a7794.dtsi |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -295,6 +295,34 @@
 		dma-channels = <15>;
 	};
 
+	audma0: dma-controller@ec700000 {
+		compatible = "renesas,dmac-r8a7794", "renesas,rcar-dmac";
+		reg = <0 0xec700000 0 0x10000>;
+		interrupts =	<GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "error",
+				  "ch0", "ch1", "ch2", "ch3", "ch4", "ch5",
+				  "ch6", "ch7", "ch8", "ch9", "ch10", "ch11",
+				  "ch12";
+		clocks = <&mstp5_clks R8A7794_CLK_AUDIO_DMAC0>;
+		clock-names = "fck";
+		power-domains = <&cpg_clocks>;
+		#dma-cells = <1>;
+		dma-channels = <13>;
+	};
+
 	scifa0: serial@e6c40000 {
 		compatible = "renesas,scifa-r8a7794",
 			     "renesas,rcar-gen2-scifa", "renesas,scifa";


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
