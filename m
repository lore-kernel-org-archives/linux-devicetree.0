From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/3] gpio: wm831x: Add basic device tree support
Date: Fri, 10 Feb 2017 13:53:19 +0000
Message-ID: <1486734800-10141-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1486734800-10141-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486734800-10141-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Now the wm831x-core has basic DT support we can update this driver to
allow use of the GPIOs within a device tree system.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
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
