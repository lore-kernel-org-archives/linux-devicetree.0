From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 2/4] dt-bindings: Add root properties for Raspberry Pi B and B+
Date: Fri, 16 Jan 2015 16:48:15 +0000
Message-ID: <1421426897-27225-3-git-send-email-stefan.wahren@i2se.com>
References: <1421426897-27225-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421426897-27225-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds root compatible properties for the following boards:
- Raspberry Pi Model B
- Raspberry Pi Model B+

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/bcm2835.txt |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm2835.txt b/Documentation/devicetree/bindings/arm/bcm2835.txt
index ac68348..789aca2 100644
--- a/Documentation/devicetree/bindings/arm/bcm2835.txt
+++ b/Documentation/devicetree/bindings/arm/bcm2835.txt
@@ -1,8 +1,14 @@
 Broadcom BCM2835 device tree bindings
 -------------------------------------------
 
-Boards with the BCM2835 SoC shall have the following properties:
+Raspberry Pi Model B
+Required root node properties:
+compatible = "raspberrypi,model-b", "brcm,bcm2835";
 
-Required root node property:
+Raspberry Pi Model B+
+Required root node properties:
+compatible = "raspberrypi,model-b-plus", "brcm,bcm2835";
 
+Generic BCM2835 board
+Required root node properties:
 compatible = "brcm,bcm2835";
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
