From: Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH] gpio: pl061 : fix gpio pl061 request bug
Date: Thu, 9 Oct 2014 15:26:44 +0800
Message-ID: <1412839604-9912-1-git-send-email-kong.kongxinwei@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: k00278426 <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: k00278426 <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

Some gpio controller dts nodes has no "gpio-range" property will cause gpio
request fail(return -517).
Maybe in this case gpio request shouldn't go into pinctrl subsystem.

This patch try to resolve this gpio request issue.

Signed-off-by: k00278426 <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Yunlei He <heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-pl061.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 84b49cf..37ffe38 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
+#include <linux/of_address.h>
 
 #define GPIODIR 0x400
 #define GPIOIS  0x404
@@ -264,8 +265,10 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&chip->lock);
 
-	chip->gc.request = pl061_gpio_request;
-	chip->gc.free = pl061_gpio_free;
+	if (of_get_property(dev->of_node, "gpio-ranges", NULL)) {
+		chip->gc.request = pl061_gpio_request;
+		chip->gc.free = pl061_gpio_free;
+	}
 	chip->gc.direction_input = pl061_direction_input;
 	chip->gc.direction_output = pl061_direction_output;
 	chip->gc.get = pl061_get_value;
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
