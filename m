From: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0029/1529] Fix typo
Date: Sat, 21 May 2016 13:39:23 +0200
Message-ID: <20160521113923.386-1-andrea.gelmini@gelma.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt
index eecf028..9045080 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt
@@ -60,7 +60,7 @@ For example, pinctrl might have properties like the following:
 Please refer to pinctrl-bindings.txt in this directory for details of the common
 pinctrl bindings used by client devices.
 
-SiRFatlas7's pinmux nodes act as a container for an abitrary number of subnodes.
+SiRFatlas7's pinmux nodes act as a container for an arbitrary number of subnodes.
 Each of these subnodes represents some desired configuration for a group of pins.
 
 Required subnode-properties:
-- 
2.8.2.534.g1f66975

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
