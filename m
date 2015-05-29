From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 3/3] clk: shmobile: rz: Document mandatory compatible fallback
Date: Fri, 29 May 2015 11:36:31 +0200
Message-ID: <1432892191-24039-4-git-send-email-geert+renesas@glider.be>
References: <1432892191-24039-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432892191-24039-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The generic RZ CPG compatible value is mandatory, as the driver uses
only this value for matching.  Document that this is a fallback that
must be present.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
index c5666288e409ebd2..2a2c509f5f9d8553 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
@@ -9,7 +9,7 @@ Required Properties:
 
   - compatible: Must be one of
     - "renesas,r7s72100-cpg-clocks" for the r7s72100 CPG
-    - "renesas,rz-cpg-clocks" for the generic RZ CPG
+    and "renesas,rz-cpg-clocks" as a fallback.
   - reg: Base address and length of the memory resource used by the CPG
   - clocks: References to possible parent clocks. Order must match clock modes
     in the datasheet. For the r7s72100, this is extal, usb_x1.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
