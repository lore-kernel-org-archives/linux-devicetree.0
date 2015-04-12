From: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: bcm2835: add pinctrl pre-processor define
Date: Sun, 12 Apr 2015 14:33:55 +0200
Message-ID: <1428842036-14202-1-git-send-email-alexanders83@web.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds defines for the BCM2835 function selections. This is notably
useful as the functions are not ordered.

Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
---
 include/dt-bindings/pinctrl/bcm2835.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/bcm2835.h

diff --git a/include/dt-bindings/pinctrl/bcm2835.h b/include/dt-bindings/pinctrl/bcm2835.h
new file mode 100644
index 000000000000..e90f437ce4a6
--- /dev/null
+++ b/include/dt-bindings/pinctrl/bcm2835.h
@@ -0,0 +1,20 @@
+/*
+ * This header provides constants for bcm2835 pinctrl bindings.
+ *
+ * Copyright (C) 2015 Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
+ *
+ */
+
+#ifndef __DT_BINDINGS_BCM2835_PINCTRL_H__
+#define __DT_BINDINGS_BCM2835_PINCTRL_H__
+
+#define BCM2835_GPIO_INPUT		0
+#define BCM2835_GPIO_OUTPUT	1
+#define BCM2835_GPIO_ALT0		4
+#define BCM2835_GPIO_ALT1		5
+#define BCM2835_GPIO_ALT2		6
+#define BCM2835_GPIO_ALT3		7
+#define BCM2835_GPIO_ALT4		3
+#define BCM2835_GPIO_ALT5		2
+
+#endif /* __DT_BINDINGS_BCM2835_PINCTRL_H__ */
-- 
2.3.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
