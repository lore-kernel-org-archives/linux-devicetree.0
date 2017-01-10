From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2] gpio: pca953x: Add optional reset gpio control
Date: Tue, 10 Jan 2017 11:29:51 -0800
Message-ID: <1484076591-20834-2-git-send-email-steve_longerbeam@mentor.com>
References: <1484076591-20834-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484076591-20834-1-git-send-email-steve_longerbeam@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org

Add optional reset-gpios pin control. If present, de-assert the
specified reset gpio pin to bring the chip out of reset.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--

v2:
- Specify that reset signal to PCA953x chip is active low, in
  binding doc.
- reorder includes in gpio-pca953x.c.
- remove dev_err() on devm_gpiod_get_optional() error return.
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 4 ++++
 drivers/gpio/gpio-pca953x.c                             | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 08dd15f..e639357 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -29,6 +29,10 @@ Required properties:
 	onsemi,pca9654
 	exar,xra1202
 
+Optional properties:
+ - reset-gpios: GPIO specification for the RESET input. This is an
+		active low signal to the PCA953x.
+
 Example:
 
 
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d5d72d8..d44232a 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/pca953x.h>
@@ -754,8 +755,16 @@ static int pca953x_probe(struct i2c_client *client,
 		invert = pdata->invert;
 		chip->names = pdata->names;
 	} else {
+		struct gpio_desc *reset_gpio;
+
 		chip->gpio_start = -1;
 		irq_base = 0;
+
+		/* See if we need to de-assert a reset pin */
+		reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_LOW);
+		if (IS_ERR(reset_gpio))
+			return PTR_ERR(reset_gpio);
 	}
 
 	chip->client = client;
-- 
2.7.4
