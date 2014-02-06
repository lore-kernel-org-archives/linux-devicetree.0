From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] Documentation: leds: common.txt: Fix reference to where "default-state" is explained
Date: Thu, 6 Feb 2014 13:18:21 -0200
Message-ID: <1391699901-7339-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Documentation/devicetree/bindings/gpio/led.txt no longer exists, so update the
reference to the correct file where the "default-state" properly is explained.

Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/common.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 2d88816..fa08a65 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -9,7 +9,8 @@ Optional properties for child nodes:
      "backlight" - LED will act as a back-light, controlled by the framebuffer
 		   system
      "default-on" - LED will turn on (but for leds-gpio see "default-state"
-		    property in Documentation/devicetree/bindings/gpio/led.txt)
+		    property in:
+		    Documentation/devicetree/bindings/leds/leds-gpio.txt)
      "heartbeat" - LED "double" flashes at a load average based rate
      "ide-disk" - LED indicates disk activity
      "timer" - LED flashes at a fixed, configurable rate
-- 
1.8.1.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
