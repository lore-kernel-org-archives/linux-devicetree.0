From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH] gpio: pca953x: Add optional reset gpio control
Date: Mon,  2 Jan 2017 13:07:51 -0800
Message-ID: <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
References: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
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
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |  4 ++++
 drivers/gpio/gpio-pca953x.c                             | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 08dd15f..da54f4c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -29,6 +29,10 @@ Required properties:
 	onsemi,pca9654
 	exar,xra1202
 
+Optional properties:
+ - reset-gpios: GPIO specification for the RESET input
+
+
 Example:
 
 
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d5d72d8..ca2ddea 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -22,6 +22,7 @@
 #include <linux/of_platform.h>
 #include <linux/acpi.h>
 #include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
 
 #define PCA953X_INPUT		0
 #define PCA953X_OUTPUT		1
@@ -754,8 +755,18 @@ static int pca953x_probe(struct i2c_client *client,
 		invert = pdata->invert;
 		chip->names = pdata->names;
 	} else {
+		struct gpio_desc *reset_gpio;
+
 		chip->gpio_start = -1;
 		irq_base = 0;
+
+		/* see if we need to de-assert a reset pin */
+		reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_LOW);
+		if (IS_ERR(reset_gpio)) {
+			dev_err(&client->dev, "request for reset pin failed\n");
+			return PTR_ERR(reset_gpio);
+		}
 	}
 
 	chip->client = client;
-- 
2.7.4
