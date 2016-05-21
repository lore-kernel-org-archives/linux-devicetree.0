From: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0019/1529] Fix typo
Date: Sat, 21 May 2016 13:37:53 +0200
Message-ID: <20160521113753.32263-1-andrea.gelmini@gelma.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
---
 .../devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt b/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt
index 9d52d5a..89c96fc 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt
@@ -10,7 +10,7 @@ Required properties
 
 - compatible: Should be "abilis,tb10x-ictl"
 - reg: specifies physical base address and size of register range.
-- interrupt-congroller: Identifies the node as an interrupt controller.
+- interrupt-controller: Identifies the node as an interrupt controller.
 - #interrupt cells: Specifies the number of cells used to encode an interrupt
   source connected to this controller. The value shall be 2.
 - interrupt-parent: Specifies the parent interrupt controller.
-- 
2.8.2.534.g1f66975

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
