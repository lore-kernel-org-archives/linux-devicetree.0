From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] gpio: Remove const from gpiospec in of_xlate
Date: Fri,  3 Jun 2016 23:26:55 +0300
Message-ID: <1464985616-11821-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464985616-11821-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cascaded GPIO chips modify gpiospec to pass along
the next gpio chip to match against. Remove the const
specifier to make it possible.
Change all in kernel users also.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/gpio/gpio-brcmstb.c | 2 +-
 drivers/gpio/gpio-davinci.c | 2 +-
 drivers/gpio/gpio-etraxfs.c | 2 +-
 drivers/gpio/gpio-lpc32xx.c | 2 +-
 drivers/gpio/gpio-pxa.c     | 2 +-
 drivers/gpio/gpiolib-of.c   | 2 +-
 include/linux/gpio/driver.h | 2 +-
 include/linux/of_gpio.h     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index e648914..29a71d6 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -302,7 +302,7 @@ static int brcmstb_gpio_remove(struct platform_device *pdev)
 }
 
 static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
-		const struct of_phandle_args *gpiospec, u32 *flags)
+		struct of_phandle_args *gpiospec, u32 *flags)
 {
 	struct brcmstb_gpio_priv *priv = brcmstb_gpio_gc_to_priv(gc);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index dd262f0..87add80 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -173,7 +173,7 @@ of_err:
 
 #ifdef CONFIG_OF_GPIO
 static int davinci_gpio_of_xlate(struct gpio_chip *gc,
-			     const struct of_phandle_args *gpiospec,
+			     struct of_phandle_args *gpiospec,
 			     u32 *flags)
 {
 	struct davinci_gpio_controller *chips = dev_get_drvdata(gc->parent);
diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
index 00b022c..660bffb 100644
--- a/drivers/gpio/gpio-etraxfs.c
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -180,7 +180,7 @@ static unsigned int etraxfs_gpio_chip_to_port(struct gpio_chip *gc)
 }
 
 static int etraxfs_gpio_of_xlate(struct gpio_chip *gc,
-			       const struct of_phandle_args *gpiospec,
+			       struct of_phandle_args *gpiospec,
 			       u32 *flags)
 {
 	/*
diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index fc5f197..3be9169 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -478,7 +478,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 };
 
 static int lpc32xx_of_xlate(struct gpio_chip *gc,
-			    const struct of_phandle_args *gpiospec, u32 *flags)
+			    struct of_phandle_args *gpiospec, u32 *flags)
 {
 	/* Is this the correct bank? */
 	u32 bank = gpiospec->args[0];
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 76ac906..47e35ab 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -317,7 +317,7 @@ static void pxa_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 #ifdef CONFIG_OF_GPIO
 static int pxa_gpio_of_xlate(struct gpio_chip *gc,
-			     const struct of_phandle_args *gpiospec,
+			     struct of_phandle_args *gpiospec,
 			     u32 *flags)
 {
 	if (gpiospec->args[0] > pxa_last_gpio)
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d22dcc3..50cb787 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -285,7 +285,7 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
  * is less than ngpios (that is specified in the gpio_chip).
  */
 int of_gpio_simple_xlate(struct gpio_chip *gc,
-			 const struct of_phandle_args *gpiospec, u32 *flags)
+			 struct of_phandle_args *gpiospec, u32 *flags)
 {
 	/*
 	 * We're discouraging gpio_cells < 2, since that way you'll have to
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 50882e0..793297c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -201,7 +201,7 @@ struct gpio_chip {
 	struct device_node *of_node;
 	int of_gpio_n_cells;
 	int (*of_xlate)(struct gpio_chip *gc,
-			const struct of_phandle_args *gpiospec, u32 *flags);
+			struct of_phandle_args *gpiospec, u32 *flags);
 #endif
 };
 
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 092186c..bdeb4b1 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -64,7 +64,7 @@ extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
 extern int of_gpiochip_add(struct gpio_chip *gc);
 extern void of_gpiochip_remove(struct gpio_chip *gc);
 extern int of_gpio_simple_xlate(struct gpio_chip *gc,
-				const struct of_phandle_args *gpiospec,
+				struct of_phandle_args *gpiospec,
 				u32 *flags);
 
 #else /* CONFIG_OF_GPIO */
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
