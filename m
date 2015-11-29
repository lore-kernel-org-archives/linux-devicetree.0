From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: Misc fix for the ATH79 MISC interrupt controllers
Date: Sun, 29 Nov 2015 13:40:11 +0100
Message-ID: <1448800812-7469-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a missing quote in the example

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
CC: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
---
 .../devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
index ec96b1f..475ae9b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
@@ -22,7 +22,7 @@ Interrupt Controllers bindings used by client devices.
 Example:
 
 	interrupt-controller@18060010 {
-		compatible = "qca,ar9132-misc-intc", qca,ar7100-misc-intc";
+		compatible = "qca,ar9132-misc-intc", "qca,ar7100-misc-intc";
 		reg = <0x18060010 0x4>;
 
 		interrupt-parent = <&cpuintc>;
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
