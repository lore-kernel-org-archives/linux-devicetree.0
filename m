From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: arm: add SMP enable-method for BCM2836
Date: Mon,  7 Aug 2017 00:32:09 +0200
Message-ID: <1502058731-12462-2-git-send-email-stefan.wahren@i2se.com>
References: <1502058731-12462-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502058731-12462-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a compatible string "brcm,bcm2836-smp" for Broadcom's
BCM2836 and BCM2837 to the 32 bit ARM CPU device tree binding.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index a44253c..b92f12b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -200,6 +200,7 @@ described below.
 			    "arm,realview-smp"
 			    "brcm,bcm11351-cpu-method"
 			    "brcm,bcm23550"
+			    "brcm,bcm2836-smp"
 			    "brcm,bcm-nsp-smp"
 			    "brcm,brahma-b15"
 			    "marvell,armada-375-smp"
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
