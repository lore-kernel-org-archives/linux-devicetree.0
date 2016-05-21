From: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0028/1529] Fix typo
Date: Sat, 21 May 2016 13:39:14 +0200
Message-ID: <20160521113914.333-1-andrea.gelmini@gelma.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
index afbc7e2..c7970c0 100644
--- a/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
@@ -8,7 +8,7 @@ Required properties:
  - clocks: Must contain an entry for each entry in clock-names.
    See ../clock/clock-bindings.txt for details.
  - clock-names: Must include "usb_phy".
- - img,cr-top: Must constain a phandle to the CR_TOP syscon node.
+ - img,cr-top: Must contain a phandle to the CR_TOP syscon node.
  - img,refclk: Indicates the reference clock source for the USB PHY.
    See <dt-bindings/phy/phy-pistachio-usb.h> for a list of valid values.
 
-- 
2.8.2.534.g1f66975

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
