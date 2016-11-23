From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] gpio: axp209: use correct register for GPIO input status
Date: Wed, 23 Nov 2016 14:27:48 +0100
Message-ID: <20161123132749.11666-2-quentin.schulz@free-electrons.com>
References: <20161123132749.11666-1-quentin.schulz@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161123132749.11666-1-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

The GPIO input status was read from control register
(AXP20X_GPIO[210]_CTRL) instead of status register (AXP20X_GPIO20_SS).

Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpio/gpio-axp209.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-axp209.c b/drivers/gpio/gpio-axp209.c
index d9c2a51..4a346b7 100644
--- a/drivers/gpio/gpio-axp209.c
+++ b/drivers/gpio/gpio-axp209.c
@@ -64,13 +64,9 @@ static int axp20x_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct axp20x_gpio *gpio = gpiochip_get_data(chip);
 	unsigned int val;
-	int reg, ret;
-
-	reg = axp20x_gpio_get_reg(offset);
-	if (reg < 0)
-		return reg;
+	int ret;
 
-	ret = regmap_read(gpio->regmap, reg, &val);
+	ret = regmap_read(gpio->regmap, AXP20X_GPIO20_SS, &val);
 	if (ret)
 		return ret;
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
