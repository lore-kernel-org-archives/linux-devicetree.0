From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: at91/dt: binding: add precision to AIC documentation
Date: Fri, 15 Nov 2013 11:09:33 +0100
Message-ID: <1384510173-15901-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In response to the "undocumented compatible strings" message, here is a
patch which is adding the precision of two "chips" that should be used for
the "atmel,<chip>-aic" compatibility string.

Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/atmel-aic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-aic.txt b/Documentation/devicetree/bindings/arm/atmel-aic.txt
index ad031211..2742e9c 100644
--- a/Documentation/devicetree/bindings/arm/atmel-aic.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-aic.txt
@@ -2,6 +2,7 @@
 
 Required properties:
 - compatible: Should be "atmel,<chip>-aic"
+  <chip> can be "at91rm9200" or "sama5d3"
 - interrupt-controller: Identifies the node as an interrupt controller.
 - interrupt-parent: For single AIC system, it is an empty property.
 - #interrupt-cells: The number of cells to define the interrupts. It should be 3.
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
