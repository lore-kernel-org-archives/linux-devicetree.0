From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/6] pinctrl: bcm2835: add pull defines to dt bindings
Date: Mon, 12 Sep 2016 10:22:51 +0200
Message-ID: <1473668576-22256-2-git-send-email-kraxel@redhat.com>
References: <1473668576-22256-1-git-send-email-kraxel@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473668576-22256-1-git-send-email-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Also delete (unused) private enum from driver.
The pull defines can be used instead if needed.

Signed-off-by: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 6 ------
 include/dt-bindings/pinctrl/bcm2835.h | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index fa77165..4cf612b 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -76,12 +76,6 @@ enum bcm2835_pinconf_param {
 	BCM2835_PINCONF_PARAM_PULL,
 };
 
-enum bcm2835_pinconf_pull {
-	BCM2835_PINCONFIG_PULL_NONE,
-	BCM2835_PINCONFIG_PULL_DOWN,
-	BCM2835_PINCONFIG_PULL_UP,
-};
-
 #define BCM2835_PINCONF_PACK(_param_, _arg_) ((_param_) << 16 | (_arg_))
 #define BCM2835_PINCONF_UNPACK_PARAM(_conf_) ((_conf_) >> 16)
 #define BCM2835_PINCONF_UNPACK_ARG(_conf_) ((_conf_) & 0xffff)
diff --git a/include/dt-bindings/pinctrl/bcm2835.h b/include/dt-bindings/pinctrl/bcm2835.h
index 6f0bc37..e4e4fdf 100644
--- a/include/dt-bindings/pinctrl/bcm2835.h
+++ b/include/dt-bindings/pinctrl/bcm2835.h
@@ -24,4 +24,9 @@
 #define BCM2835_FSEL_ALT2	6
 #define BCM2835_FSEL_ALT3	7
 
+/* brcm,pull property */
+#define BCM2835_PUD_OFF		0
+#define BCM2835_PUD_DOWN	1
+#define BCM2835_PUD_UP		2
+
 #endif /* __DT_BINDINGS_PINCTRL_BCM2835_H__ */
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
