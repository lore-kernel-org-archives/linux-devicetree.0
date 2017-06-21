From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] dt-bindings: mtd: elm: Correct compatible string requirement
Date: Wed, 21 Jun 2017 08:22:06 -0400
Message-ID: <1498047726-31398-1-git-send-email-trini@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The binding says that the compatible string must be "ti,am33xx-elm"
but the code checks only for, and all functioning users set, this as
"ti,am3352-elm" so correct the binding.

Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
I have submitted a separate patch that correct the dm816x.dtsi to set
the compatible string there for the elm from ti,816-elm to ti,am3352-elm
and tested it on the hardware, where it works.  It is quite likely that
dm814x.dtsi can be trivially corrected as it came after dm816x and
before am335x but as I cannot test the hardware, I did not update that.
---
 Documentation/devicetree/bindings/mtd/elm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/elm.txt b/Documentation/devicetree/bindings/mtd/elm.txt
index 8c1528c421d4..59ddc61c1076 100644
--- a/Documentation/devicetree/bindings/mtd/elm.txt
+++ b/Documentation/devicetree/bindings/mtd/elm.txt
@@ -1,7 +1,7 @@
 Error location module
 
 Required properties:
-- compatible: Must be "ti,am33xx-elm"
+- compatible: Must be "ti,am3352-elm"
 - reg: physical base address and size of the registers map.
 - interrupts: Interrupt number for the elm.
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
