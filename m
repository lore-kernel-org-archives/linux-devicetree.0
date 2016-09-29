From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] DT: irqchip: renesas-irqc: document R8A7743/5 support
Date: Fri, 30 Sep 2016 00:25:29 +0300
Message-ID: <19681841.MzyqfDfWny@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Renesas  RZ/G SoC have the R-Car gen2 compatible IRQC interrupt controllers.
Document RZ/G1[ME] (also known as R8A774[35]) SoC bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
The patch is against the 'tip.git' repo's 'irq/core' branch.

 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: tip/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
===================================================================
--- tip.orig/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ tip/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -1,10 +1,12 @@
-DT bindings for the R-Mobile/R-Car interrupt controller
+DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
 
 Required properties:
 
 - compatible: has to be "renesas,irqc-<soctype>", "renesas,irqc" as fallback.
   Examples with soctypes are:
     - "renesas,irqc-r8a73a4" (R-Mobile APE6)
+    - "renesas,irqc-r8a7743" (RZ/G1M)
+    - "renesas,irqc-r8a7745" (RZ/G1E)
     - "renesas,irqc-r8a7790" (R-Car H2)
     - "renesas,irqc-r8a7791" (R-Car M2-W)
     - "renesas,irqc-r8a7792" (R-Car V2H)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
