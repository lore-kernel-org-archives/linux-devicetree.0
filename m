From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v3 2/3] gpio: wm831x: Add basic device tree support
Date: Mon, 6 Mar 2017 16:46:43 +0000
Message-ID: <1488818804-9406-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1488818804-9406-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488818804-9406-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now the wm831x-core has basic DT support we can update this driver to
allow use of the GPIOs within a device tree system.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

No changes since v2.

 drivers/gpio/gpio-wm831x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 533707f..110453c7 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -264,7 +264,7 @@ static const struct gpio_chip template_chip = {
 static int wm831x_gpio_probe(struct platform_device *pdev)
 {
 	struct wm831x *wm831x = dev_get_drvdata(pdev->dev.parent);
-	struct wm831x_pdata *pdata = dev_get_platdata(wm831x->dev);
+	struct wm831x_pdata *pdata = &wm831x->pdata;
 	struct wm831x_gpio *wm831x_gpio;
 	int ret;
 
@@ -281,6 +281,9 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 		wm831x_gpio->gpio_chip.base = pdata->gpio_base;
 	else
 		wm831x_gpio->gpio_chip.base = -1;
+#ifdef CONFIG_OF_GPIO
+	wm831x_gpio->gpio_chip.of_node = wm831x->dev->of_node;
+#endif
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &wm831x_gpio->gpio_chip,
 				     wm831x_gpio);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
