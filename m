From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v9 01/10] rtc: at91sam9: remove references to mach specific headers
Date: Tue, 23 Sep 2014 16:48:36 +0200
Message-ID: <1411483725-31532-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1411483725-31532-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411483725-31532-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Acked-by: Arnd Bergmann" <arnd-r2nGTMty4D4@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to support multi platform kernel drivers should not include
machine specific headers.
Copy RTT macros in the driver code and remove any machine specific
headers.

Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Acked-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 drivers/rtc/rtc-at91sam9.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 5963743..51f0038 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -22,10 +22,6 @@
 #include <linux/platform_data/atmel.h>
 #include <linux/io.h>
 
-#include <mach/at91_rtt.h>
-#include <mach/cpu.h>
-#include <mach/hardware.h>
-
 /*
  * This driver uses two configurable hardware resources that live in the
  * AT91SAM9 backup power domain (intended to be powered at all times)
@@ -47,6 +43,24 @@
  * registers available, likewise usable for more than "RTC" support.
  */
 
+#define AT91_RTT_MR		0x00			/* Real-time Mode Register */
+#define AT91_RTT_RTPRES		(0xffff << 0)		/* Real-time Timer Prescaler Value */
+#define AT91_RTT_ALMIEN		(1 << 16)		/* Alarm Interrupt Enable */
+#define AT91_RTT_RTTINCIEN	(1 << 17)		/* Real Time Timer Increment Interrupt Enable */
+#define AT91_RTT_RTTRST		(1 << 18)		/* Real Time Timer Restart */
+
+#define AT91_RTT_AR		0x04			/* Real-time Alarm Register */
+#define AT91_RTT_ALMV		(0xffffffff)		/* Alarm Value */
+
+#define AT91_RTT_VR		0x08			/* Real-time Value Register */
+#define AT91_RTT_CRTV		(0xffffffff)		/* Current Real-time Value */
+
+#define AT91_RTT_SR		0x0c			/* Real-time Status Register */
+#define AT91_RTT_ALMS		(1 << 0)		/* Real-time Alarm Status */
+#define AT91_RTT_RTTINC		(1 << 1)		/* Real-time Timer Increment */
+
+#define AT91_SLOW_CLOCK		32768
+
 /*
  * We store ALARM_DISABLED in ALMV to record that no alarm is set.
  * It's also the reset value for that field.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
