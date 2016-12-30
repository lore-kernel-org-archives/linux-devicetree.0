From: yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Subject: [PATCH] Documentation: panel-dpi: fix path to display-timing.txt
Date: Fri, 30 Dec 2016 09:05:33 +0100
Message-ID: <1483085133-9877-1-git-send-email-yegorslists@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Signed-off-by: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/display/panel/panel-dpi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
index b52ac52..d4add13 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
@@ -12,7 +12,7 @@ Optional properties:
 
 Required nodes:
 - "panel-timing" containing video timings
-  (Documentation/devicetree/bindings/display/display-timing.txt)
+  (Documentation/devicetree/bindings/display/panel/display-timing.txt)
 - Video port for DPI input
 
 Example
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
