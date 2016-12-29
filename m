From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 10/20] gpio: pca953x: Add optional reset gpio control
Date: Thu, 29 Dec 2016 14:27:25 -0800
Message-ID: <1483050455-10683-11-git-send-email-steve_longerbeam@mentor.com>
References: <1483050455-10683-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1483050455-10683-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, gnurou@gmail.com, mchehab@kernel.org, gregkh@linuxfoundation.org, p.zabel@pengutronix.de
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add optional reset-gpios pin control. If present, de-assert the
specified reset gpio pin to bring the chip out of reset.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---

v2:
- documented optional reset-gpios property in
  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt.
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |  4 ++++
 drivers/gpio/gpio-pca953x.c                             | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

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
index d5d72d8..d1c0bd5 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -22,6 +22,7 @@
 #include <linux/of_platform.h>
 #include <linux/acpi.h>
 #include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
 
 #define PCA953X_INPUT		0
 #define PCA953X_OUTPUT		1
@@ -133,6 +134,7 @@ struct pca953x_chip {
 	const char *const *names;
 	unsigned long driver_data;
 	struct regulator *regulator;
+	struct gpio_desc *reset_gpio;
 
 	const struct pca953x_reg_config *regs;
 
@@ -756,6 +758,21 @@ static int pca953x_probe(struct i2c_client *client,
 	} else {
 		chip->gpio_start = -1;
 		irq_base = 0;
+
+		/* see if we need to de-assert a reset pin */
+		chip->reset_gpio = devm_gpiod_get_optional(&client->dev,
+							   "reset",
+							   GPIOD_OUT_LOW);
+		if (IS_ERR(chip->reset_gpio)) {
+			dev_err(&client->dev, "request for reset pin failed\n");
+			return PTR_ERR(chip->reset_gpio);
+		}
+
+		if (chip->reset_gpio) {
+			/* bring chip out of reset */
+			dev_info(&client->dev, "releasing reset\n");
+			gpiod_set_value(chip->reset_gpio, 0);
+		}
 	}
 
 	chip->client = client;
-- 
2.7.4
