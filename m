From: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0031/1529] Fix typo
Date: Sat, 21 May 2016 13:39:44 +0200
Message-ID: <20160521113944.508-1-andrea.gelmini@gelma.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.txt b/Documentation/devicetree/bindings/serial/samsung_uart.txt
index e85f37e..1ee1af0 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.txt
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.txt
@@ -1,7 +1,7 @@
 * Samsung's UART Controller
 
 The Samsung's UART controller is used for interfacing SoC with serial
-communicaion devices.
+communication devices.
 
 Required properties:
 - compatible: should be one of following:
@@ -21,7 +21,7 @@ Required properties:
 - clock-names: input names of clocks used by the controller:
   - "uart" - controller bus clock,
   - "clk_uart_baudN" - Nth baud base clock input (N = 0, 1, ...),
-    according to SoC User's Manual (only N = 0 is allowedfor SoCs without
+    according to SoC User's Manual (only N = 0 is allowed for SoCs without
     internal baud clock mux).
 - clocks: phandles and specifiers for all clocks specified in "clock-names"
   property, in the same order, according to clock bindings documentation [2].
-- 
2.8.2.534.g1f66975

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
