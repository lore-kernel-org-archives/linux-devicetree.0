From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: [PATCH v2] gpio: davinci: fix gpio selection for OF
Date: Wed,  5 Mar 2014 12:21:01 +0100
Message-ID: <1394018461-757-1-git-send-email-holler@ahsoftware.de>
References: <5316FFCE.1060603@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5316FFCE.1060603-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The driver missed an of_xlate function to translate gpio numbers
as found in the DT to the correct chip and number.

While there I've set #gpio_cells to a fixed value of 2.

I've used gpio-pxa.c as template for those changes and tested my changes
successfully on a da850 board using entries for gpio-leds in a DT. So I didn't
reinvent the wheel but just copied and tested stuff.

Thanks to Grygorii Strashko for the hint to the existing code in gpio-pxa.

Signed-off-by: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 drivers/gpio/gpio-davinci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

 Changes in v2: replaced static variables by indirections.

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 7629b4f..92574a0 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -172,6 +172,27 @@ of_err:
 	return NULL;
 }
 
+#ifdef CONFIG_OF_GPIO
+static int davinci_gpio_of_xlate(struct gpio_chip *gc,
+			     const struct of_phandle_args *gpiospec,
+			     u32 *flags)
+{
+	struct davinci_gpio_controller *chips = dev_get_drvdata(gc->dev);
+	struct davinci_gpio_platform_data *pdata = dev_get_platdata(gc->dev);
+
+	if (gpiospec->args[0] > pdata->ngpio)
+		return -EINVAL;
+
+	if (gc != &chips[gpiospec->args[0] / 32].chip)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[1];
+
+	return gpiospec->args[0] % 32;
+}
+#endif
+
 static int davinci_gpio_probe(struct platform_device *pdev)
 {
 	int i, base;
@@ -236,6 +257,9 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 			chips[i].chip.ngpio = 32;
 
 #ifdef CONFIG_OF_GPIO
+		chips[i].chip.of_gpio_n_cells = 2;
+		chips[i].chip.of_xlate = davinci_gpio_of_xlate;
+		chips[i].chip.dev = dev;
 		chips[i].chip.of_node = dev->of_node;
 #endif
 		spin_lock_init(&chips[i].lock);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
