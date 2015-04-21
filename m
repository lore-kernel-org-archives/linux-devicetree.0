From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/9] dt-bindings: Add root properties for Raspberry Pi 2.
Date: Tue, 21 Apr 2015 11:09:48 -0700
Message-ID: <1429639796-2169-2-git-send-email-eric@anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429639796-2169-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/bcm2836.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm2836.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm2836.txt b/Documentation/devicetree/bindings/arm/bcm2836.txt
new file mode 100644
index 0000000..5e255ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm2836.txt
@@ -0,0 +1,10 @@
+Broadcom BCM2836 device tree bindings
+-------------------------------------------
+
+Raspberry Pi 2 Model B
+Required root node properties:
+compatible = "raspberrypi,2-model-b", "brcm,bcm2836";
+
+Generic BCM2836 board
+Required root node properties:
+compatible = "brcm,bcm2836";
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
