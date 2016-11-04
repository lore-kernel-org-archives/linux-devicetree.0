From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 03/11] ARM: shmobile: r8a7745: basic SoC support
Date: Sat, 05 Nov 2016 00:49:55 +0300
Message-ID: <1611958.qRQu5pdJd3@wasted.cogentembedded.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2368353.xfo5beGC5E-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add minimal support for the RZ/G1E (R8A7745) SoC.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

---
Changes in version 2:
- added Geert's tag;
- refreshed the patch.

 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 arch/arm/mach-shmobile/Kconfig                     |    4 ++++
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |    1 +
 3 files changed, 7 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -15,6 +15,8 @@ SoCs:
     compatible = "renesas,r8a7740"
   - RZ/G1M (R8A77430)
     compatible = "renesas,r8a7743"
+  - RZ/G1E (R8A77450)
+    compatible = "renesas,r8a7745"
   - R-Car M1A (R8A77781)
     compatible = "renesas,r8a7778"
   - R-Car H1 (R8A77790)
Index: renesas/arch/arm/mach-shmobile/Kconfig
===================================================================
--- renesas.orig/arch/arm/mach-shmobile/Kconfig
+++ renesas/arch/arm/mach-shmobile/Kconfig
@@ -73,6 +73,10 @@ config ARCH_R8A7743
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 
+config ARCH_R8A7745
+	bool "RZ/G1E (R8A77450)"
+	select ARCH_RCAR_GEN2
+
 config ARCH_R8A7778
 	bool "R-Car M1A (R8A77781)"
 	select ARCH_RCAR_GEN1
Index: renesas/arch/arm/mach-shmobile/setup-rcar-gen2.c
===================================================================
--- renesas.orig/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ renesas/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -227,6 +227,7 @@ MACHINE_END
 
 static const char * const rz_g1_boards_compat_dt[] __initconst = {
 	"renesas,r8a7743",
+	"renesas,r8a7745",
 	NULL,
 };
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
