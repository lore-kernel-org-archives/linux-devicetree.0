From: Brad Mouring <brad.mouring-acOepvfBmUk@public.gmane.org>
Subject: [PATCH 2/2] Documentation: devicetree: Add PL310 PM bindings
Date: Mon, 29 Feb 2016 10:01:56 -0600
Message-ID: <1456761716-10174-2-git-send-email-brad.mouring@ni.com>
References: <1456265019-23900-1-git-send-email-brad.mouring@ni.com>
 <1456761716-10174-1-git-send-email-brad.mouring@ni.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456761716-10174-1-git-send-email-brad.mouring-acOepvfBmUk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brad Mouring <brad.mouring-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the DT bindings for controlling ARM PL310 Power Control
settings.

Signed-off-by: Brad Mouring <brad.mouring-acOepvfBmUk@public.gmane.org>
Acked-by: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/l2c2x0.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.txt b/Documentation/devicetree/bindings/arm/l2c2x0.txt
index fe0398c..6b2366ed 100644
--- a/Documentation/devicetree/bindings/arm/l2c2x0.txt
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.txt
@@ -84,6 +84,10 @@ Optional properties:
 - prefetch-instr : Instruction prefetch. Value: <0> (forcibly disable),
   <1> (forcibly enable), property absent (retain settings set by
   firmware)
+- arm,dynamic-clock-gating : L2 dynamic clock gating. Value: <0> (forcibly
+  disable), <1> (forcibly enable), property absent (retain firmware settings)
+- arm,standby-mode: L2 standby mode enable. Value <0> (forcibly disable),
+  <1> (forcibly enable), property absent (retain firmware settings)
 
 Example:
 
-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
