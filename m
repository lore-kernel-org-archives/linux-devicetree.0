From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] dt-bindings: tda998x: Document the required 'port' node.
Date: Wed,  2 Dec 2015 11:35:39 +0000
Message-ID: <1449056139-31222-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All the users of the tda998x driver are component based and bind the
driver via the device graph method described in
Documentation/devicetree/bindings/graph.txt. Add the fact that the
'port' node is required to the bindings.

Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/display/bridge/tda998x.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/tda998x.txt b/Documentation/devicetree/bindings/display/bridge/tda998x.txt
index e9e4bce..e178e6b 100644
--- a/Documentation/devicetree/bindings/display/bridge/tda998x.txt
+++ b/Documentation/devicetree/bindings/display/bridge/tda998x.txt
@@ -5,6 +5,10 @@ Required properties;
 
   - reg: I2C address
 
+Required node:
+  - port: Input port node with endpoint definition, as described
+        in Documentation/devicetree/bindings/graph.txt
+
 Optional properties:
   - interrupts: interrupt number and trigger type
 	default: polling
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
