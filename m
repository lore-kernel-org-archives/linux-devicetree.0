From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v3 3/7] NFC: trf7970a: Convert to descriptor based GPIO interface
Date: Fri, 20 Jan 2017 12:17:41 -0700
Message-ID: <20170120191745.29255-4-mgreer@animalcreek.com>
References: <20170120191745.29255-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120191745.29255-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The trf7970a driver uses the deprecated integer-based GPIO consumer
interface so convert it to use the new descriptor-based GPIO
consumer interface.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 drivers/nfc/Kconfig    |  2 +-
 drivers/nfc/trf7970a.c | 54 ++++++++++++++++++++------------------------------
 2 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/drivers/nfc/Kconfig b/drivers/nfc/Kconfig
index 9d2369269abf..4deacbada74d 100644
--- a/drivers/nfc/Kconfig
+++ b/drivers/nfc/Kconfig
@@ -18,7 +18,7 @@ config NFC_WILINK
 
 config NFC_TRF7970A
 	tristate "Texas Instruments TRF7970a NFC driver"
-	depends on SPI && NFC_DIGITAL
+	depends on SPI && NFC_DIGITAL && GPIOLIB
 	help
 	  This option enables the NFC driver for Texas Instruments' TRF7970a
 	  device. Such device supports 5 different protocols: ISO14443A,
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 0c0567adefcb..bd3d9a09da0d 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -20,9 +20,8 @@
 #include <linux/nfc.h>
 #include <linux/skbuff.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/spi/spi.h>
 #include <linux/regulator/consumer.h>
 
@@ -448,8 +447,8 @@ struct trf7970a {
 	u8				tx_cmd;
 	bool				issue_eof;
 	bool				adjust_resp_len;
-	int				en2_gpio;
-	int				en_gpio;
+	struct gpio_desc		*en_gpiod;
+	struct gpio_desc		*en2_gpiod;
 	struct mutex			lock;
 	unsigned int			timeout;
 	bool				ignore_timeout;
@@ -1884,13 +1883,13 @@ static int trf7970a_power_up(struct trf7970a *trf)
 
 	usleep_range(5000, 6000);
 
-	if (gpio_is_valid(trf->en2_gpio) &&
+	if (trf->en2_gpiod &&
 	    !(trf->quirks & TRF7970A_QUIRK_EN2_MUST_STAY_LOW)) {
-		gpio_set_value(trf->en2_gpio, 1);
+		gpiod_set_value_cansleep(trf->en2_gpiod, 1);
 		usleep_range(1000, 2000);
 	}
 
-	gpio_set_value(trf->en_gpio, 1);
+	gpiod_set_value_cansleep(trf->en_gpiod, 1);
 
 	usleep_range(20000, 21000);
 
@@ -1914,11 +1913,11 @@ static int trf7970a_power_down(struct trf7970a *trf)
 		return -EBUSY;
 	}
 
-	gpio_set_value(trf->en_gpio, 0);
+	gpiod_set_value_cansleep(trf->en_gpiod, 0);
 
-	if (gpio_is_valid(trf->en2_gpio) &&
+	if (trf->en2_gpiod &&
 	    !(trf->quirks & TRF7970A_QUIRK_EN2_MUST_STAY_LOW))
-		gpio_set_value(trf->en2_gpio, 0);
+		gpiod_set_value_cansleep(trf->en2_gpiod, 0);
 
 	ret = regulator_disable(trf->regulator);
 	if (ret)
@@ -2021,33 +2020,24 @@ static int trf7970a_probe(struct spi_device *spi)
 		trf->quirks |= TRF7970A_QUIRK_IRQ_STATUS_READ;
 
 	/* There are two enable pins - only EN must be present in DT */
-	trf->en_gpio = of_get_named_gpio(np, "ti,enable-gpios", 0);
-	if (!gpio_is_valid(trf->en_gpio)) {
+	trf->en_gpiod = devm_gpiod_get_index(trf->dev, "ti,enable", 0,
+					     GPIOD_OUT_LOW);
+	if (IS_ERR(trf->en_gpiod)) {
 		dev_err(trf->dev, "No EN GPIO property\n");
-		return trf->en_gpio;
+		return PTR_ERR(trf->en_gpiod);
 	}
 
-	ret = devm_gpio_request_one(trf->dev, trf->en_gpio,
-			GPIOF_DIR_OUT | GPIOF_INIT_LOW, "trf7970a EN");
-	if (ret) {
-		dev_err(trf->dev, "Can't request EN GPIO: %d\n", ret);
-		return ret;
-	}
-
-	trf->en2_gpio = of_get_named_gpio(np, "ti,enable-gpios", 1);
-	if (gpio_is_valid(trf->en2_gpio)) {
-		ret = devm_gpio_request_one(trf->dev, trf->en2_gpio,
-					    GPIOF_DIR_OUT | GPIOF_INIT_LOW,
-					    "trf7970a EN2");
-		if (ret) {
-			dev_err(trf->dev, "Can't request EN2 GPIO: %d\n", ret);
-			return ret;
-		}
-
+	trf->en2_gpiod = devm_gpiod_get_index_optional(trf->dev, "ti,enable", 1,
+						       GPIOD_OUT_LOW);
+	if (!trf->en2_gpiod) {
+		dev_err(trf->dev, "No EN2 GPIO property - ignoring EN2\n");
+	} else if (IS_ERR(trf->en2_gpiod)) {
+		dev_err(trf->dev, "Error getting EN2 GPIO property: %ld\n",
+			PTR_ERR(trf->en2_gpiod));
+		return PTR_ERR(trf->en2_gpiod);
+	} else {
 		if (of_property_read_bool(np, "en2-rf-quirk"))
 			trf->quirks |= TRF7970A_QUIRK_EN2_MUST_STAY_LOW;
-	} else {
-		dev_err(trf->dev, "No EN2 GPIO property - ignoring EN2\n");
 	}
 
 	ret = devm_request_threaded_irq(trf->dev, spi->irq, NULL,
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
