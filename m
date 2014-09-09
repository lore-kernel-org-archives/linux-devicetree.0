From: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/5] extcon: gpio: Minor cleanups
Date: Tue, 9 Sep 2014 09:44:34 +0530
Message-ID: <1410236078-11713-2-git-send-email-george.cherian@ti.com>
References: <1410236078-11713-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410236078-11713-1-git-send-email-george.cherian-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rongjun.ying-kQvG35nSl+M@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Minor Cleanups
 - Order the include files in alphabetical order.
 - Fix description of state_off in extcon_gpio.h
 - Add a descrition for check_on_resume in extcon_gpio.h

Signed-off-by: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
---
 drivers/extcon/extcon-gpio.c       | 10 +++++-----
 include/linux/extcon/extcon-gpio.h |  4 +++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 5b7ec27..72f19a3 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -20,16 +20,16 @@
  *
 */
 
-#include <linux/module.h>
-#include <linux/kernel.h>
+#include <linux/extcon.h>
+#include <linux/extcon/extcon-gpio.h>
+#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/gpio.h>
-#include <linux/extcon.h>
-#include <linux/extcon/extcon-gpio.h>
 
 struct gpio_extcon_data {
 	struct extcon_dev *edev;
diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extcon/extcon-gpio.h
index 8900fdf..0b17ad4 100644
--- a/include/linux/extcon/extcon-gpio.h
+++ b/include/linux/extcon/extcon-gpio.h
@@ -34,8 +34,10 @@
  * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
  * @state_on:		print_state is overriden with state_on if attached.
  *			If NULL, default method of extcon class is used.
- * @state_off:		print_state is overriden with state_on if detached.
+ * @state_off:		print_state is overriden with state_off if detached.
  *			If NUll, default method of extcon class is used.
+ * @check_on_resume:	Boolean describing whether to check the state of gpio
+ *			while resuming from sleep.
  *
  * Note that in order for state_on or state_off to be valid, both state_on
  * and state_off should be not NULL. If at least one of them is NULL,
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
