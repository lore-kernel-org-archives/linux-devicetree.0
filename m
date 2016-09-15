From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] drm/tilcdc: Remove "default" from blue-and-red-wiring property binding
Date: Thu, 15 Sep 2016 12:34:51 +0300
Message-ID: <1473932091-32084-1-git-send-email-jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Remove "default" keyword from blue-and-red-wiring devicetree property
binding document. The code does not support and there is no intention
to support it.

Reported-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
---
I sent the pull request for the color errata changes before I received
the review mail[1] from Rob Herring. This fixes the issue reported in
the mail.

[1] https://lists.freedesktop.org/archives/dri-devel/2016-September/118115.html

 Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
index a5007aa..a83abd7 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
@@ -17,9 +17,9 @@ Optional properties:
    the lcd controller.
  - max-pixelclock: The maximum pixel clock that can be supported
    by the lcd controller in KHz.
- - blue-and-red-wiring: Recognized values "default", "straight" or
-   "crossed". This property deals with the LCDC revision 2 (found on
-   AM335x) color errata [1].
+ - blue-and-red-wiring: Recognized values "straight" or "crossed".
+   This property deals with the LCDC revision 2 (found on AM335x)
+   color errata [1].
     - "straight" indicates normal wiring that supports RGB565,
       BGR888, and XBGR8888 color formats.
     - "crossed" indicates wiring that has blue and red wires
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
