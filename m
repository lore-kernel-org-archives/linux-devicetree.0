From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] ARM: dts: r8a7794: remove Z clock
Date: Sun, 30 Oct 2016 00:31:27 +0300
Message-ID: <2289596.xFBEUD1OgK@wasted.cogentembedded.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1529351.Fac5N2tKoF-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

R8A7794 doesn't have Cortex-A15 CPUs, thus there's no Z clock...

Fixes: 0dce5454d5c2 ("ARM: shmobile: Initial r8a7794 SoC device tree")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
The patch is against the 'master' branch of Simon Horman's 'renesas.git' repo.

 arch/arm/boot/dts/r8a7794.dtsi            |    3 +--
 include/dt-bindings/clock/r8a7794-clock.h |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -1025,8 +1025,7 @@
 			clocks = <&extal_clk &usb_extal_clk>;
 			#clock-cells = <1>;
 			clock-output-names = "main", "pll0", "pll1", "pll3",
-					     "lb", "qspi", "sdh", "sd0", "z",
-					     "rcan";
+					     "lb", "qspi", "sdh", "sd0", "rcan";
 			#power-domain-cells = <0>;
 		};
 		/* Variable factor clocks */
Index: renesas/include/dt-bindings/clock/r8a7794-clock.h
===================================================================
--- renesas.orig/include/dt-bindings/clock/r8a7794-clock.h
+++ renesas/include/dt-bindings/clock/r8a7794-clock.h
@@ -20,8 +20,7 @@
 #define R8A7794_CLK_QSPI		5
 #define R8A7794_CLK_SDH			6
 #define R8A7794_CLK_SD0			7
-#define R8A7794_CLK_Z			8
-#define R8A7794_CLK_RCAN		9
+#define R8A7794_CLK_RCAN		8
 
 /* MSTP0 */
 #define R8A7794_CLK_MSIOF0		0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
