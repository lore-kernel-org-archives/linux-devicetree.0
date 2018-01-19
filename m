From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/3] DT: display: renesas,lvds: document R8A77970 bindings
Date: Fri, 19 Jan 2018 21:29:20 +0300
Message-ID: <20180119183553.649510876@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=DT-display-renesas,lvds-document-R8A77970-bindings.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the R-Car V3M (R8A77970) SoC in the R-Car LVDS bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt |    1 +
 1 file changed, 1 insertion(+)

Index: linux/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
===================================================================
--- linux.orig/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ linux/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -13,6 +13,7 @@ Required properties:
   - "renesas,r8a7793-lvds" for R8A7791 (R-Car M2-N) compatible LVDS encoders
   - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
   - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
+  - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS encoders
 
 - reg: Base address and length for the memory-mapped registers
 - clocks: A phandle + clock-specifier pair for the functional clock

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
