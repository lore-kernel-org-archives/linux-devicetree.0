From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 02/13] irqchip: renesas-intc-irqpin: Document SoC-specific bindings
Date: Wed,  9 Jul 2014 14:23:32 +0200
Message-ID: <1404908623-909-3-git-send-email-geert+renesas@glider.be>
References: <1404908623-909-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404908623-909-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The documentation only mentioned the generic fallback compatible property.
Add the missing SoC-specific compatible properties, which are already in
use.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 .../bindings/interrupt-controller/renesas,intc-irqpin.txt         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
index 1f8b0c507c26..c73acd060093 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
@@ -2,7 +2,13 @@ DT bindings for the R-/SH-Mobile irqpin controller
 
 Required properties:
 
-- compatible: has to be "renesas,intc-irqpin"
+- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc-irqpin"
+  as fallback.
+  Examples with soctypes are:
+    - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
+    - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
+    - "renesas,intc-irqpin-r8a7779" (R-Car H1)
+    - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
 - #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
   interrupts.txt in this directory
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
