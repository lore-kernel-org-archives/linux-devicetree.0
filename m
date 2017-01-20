From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v3 2/7] NFC: trf7970a: Don't manage EN2 when not specified in DT
Date: Fri, 20 Jan 2017 12:17:40 -0700
Message-ID: <20170120191745.29255-3-mgreer@animalcreek.com>
References: <20170120191745.29255-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120191745.29255-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently, the trf7970a driver assumes that there is a GPIO
connected to the EN2 pin of the trf7970a part; however, that
may not always be the case.  Some boards may tie EN2 low and
not connect it to a GPIO.  Support these configurations by making
the driver ignore EN2 when the second entry in the 'ti,enable-gpios'
DT property is missing (i.e., the one that specifies the GPIO for
EN2).

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 drivers/nfc/trf7970a.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 92f3cf3e012a..0c0567adefcb 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -1884,7 +1884,8 @@ static int trf7970a_power_up(struct trf7970a *trf)
 
 	usleep_range(5000, 6000);
 
-	if (!(trf->quirks & TRF7970A_QUIRK_EN2_MUST_STAY_LOW)) {
+	if (gpio_is_valid(trf->en2_gpio) &&
+	    !(trf->quirks & TRF7970A_QUIRK_EN2_MUST_STAY_LOW)) {
 		gpio_set_value(trf->en2_gpio, 1);
 		usleep_range(1000, 2000);
 	}
@@ -1915,7 +1916,8 @@ static int trf7970a_power_down(struct trf7970a *trf)
 
 	gpio_set_value(trf->en_gpio, 0);
 
-	if (!(trf->quirks & TRF7970A_QUIRK_EN2_MUST_STAY_LOW))
+	if (gpio_is_valid(trf->en2_gpio) &&
+	    !(trf->quirks & TRF7970A_QUIRK_EN2_MUST_STAY_LOW))
 		gpio_set_value(trf->en2_gpio, 0);
 
 	ret = regulator_disable(trf->regulator);
@@ -2018,7 +2020,7 @@ static int trf7970a_probe(struct spi_device *spi)
 	if (of_property_read_bool(np, "irq-status-read-quirk"))
 		trf->quirks |= TRF7970A_QUIRK_IRQ_STATUS_READ;
 
-	/* There are two enable pins - both must be present */
+	/* There are two enable pins - only EN must be present in DT */
 	trf->en_gpio = of_get_named_gpio(np, "ti,enable-gpios", 0);
 	if (!gpio_is_valid(trf->en_gpio)) {
 		dev_err(trf->dev, "No EN GPIO property\n");
@@ -2033,21 +2035,21 @@ static int trf7970a_probe(struct spi_device *spi)
 	}
 
 	trf->en2_gpio = of_get_named_gpio(np, "ti,enable-gpios", 1);
-	if (!gpio_is_valid(trf->en2_gpio)) {
-		dev_err(trf->dev, "No EN2 GPIO property\n");
-		return trf->en2_gpio;
-	}
+	if (gpio_is_valid(trf->en2_gpio)) {
+		ret = devm_gpio_request_one(trf->dev, trf->en2_gpio,
+					    GPIOF_DIR_OUT | GPIOF_INIT_LOW,
+					    "trf7970a EN2");
+		if (ret) {
+			dev_err(trf->dev, "Can't request EN2 GPIO: %d\n", ret);
+			return ret;
+		}
 
-	ret = devm_gpio_request_one(trf->dev, trf->en2_gpio,
-			GPIOF_DIR_OUT | GPIOF_INIT_LOW, "trf7970a EN2");
-	if (ret) {
-		dev_err(trf->dev, "Can't request EN2 GPIO: %d\n", ret);
-		return ret;
+		if (of_property_read_bool(np, "en2-rf-quirk"))
+			trf->quirks |= TRF7970A_QUIRK_EN2_MUST_STAY_LOW;
+	} else {
+		dev_err(trf->dev, "No EN2 GPIO property - ignoring EN2\n");
 	}
 
-	if (of_property_read_bool(np, "en2-rf-quirk"))
-		trf->quirks |= TRF7970A_QUIRK_EN2_MUST_STAY_LOW;
-
 	ret = devm_request_threaded_irq(trf->dev, spi->irq, NULL,
 			trf7970a_irq, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 			"trf7970a", trf);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
