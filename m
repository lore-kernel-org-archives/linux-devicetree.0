From: yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Subject: [PATCH] Documentation: ti-syscon-reset: fix header path
Date: Fri,  9 Dec 2016 11:11:27 +0100
Message-ID: <1481278287-23842-1-git-send-email-yegorslists@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

'include' was missing from path.

Signed-off-by: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
index 164c7f3..5b20e20 100644
--- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
+++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
@@ -44,7 +44,7 @@ Required properties:
 			              reset status register
 			    Cell #7 : Flags used to control reset behavior,
 			              availible flags defined in the DT include
-			              file <dt-bindings/reset/ti-syscon.h>
+			              file <include/dt-bindings/reset/ti-syscon.h>
 
 SysCon Reset Consumer Nodes
 ===========================
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
