From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RESEND] Documentation: clock: fixed-clock: Remove unsupported 'gpios' property
Date: Fri,  9 May 2014 00:01:50 -0300
Message-ID: <1399604510-3043-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Remove the 'gpios' property from the documentation as this is something that the
current fixed clock driver does not handle.

Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/fixed-clock.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.txt b/Documentation/devicetree/bindings/clock/fixed-clock.txt
index 48ea0ad..0641a663 100644
--- a/Documentation/devicetree/bindings/clock/fixed-clock.txt
+++ b/Documentation/devicetree/bindings/clock/fixed-clock.txt
@@ -12,7 +12,6 @@ Required properties:
 Optional properties:
 - clock-accuracy : accuracy of clock in ppb (parts per billion).
 		   Should be a single cell.
-- gpios : From common gpio binding; gpio connection to clock enable pin.
 - clock-output-names : From common clock binding.
 
 Example:
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
