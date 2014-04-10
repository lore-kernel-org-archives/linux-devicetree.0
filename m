From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 4/7] pinctrl: sunxi: support multiple pin controller
Date: Thu, 10 Apr 2014 15:52:43 +0200
Message-ID: <1397137966-30818-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1397137966-30818-1-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB6WETKNAKGQEUKXUKWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1397137966-30818-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for multiple pin controller instances.

First remove the static definition of the sunxi gpio chip struct and fill
the dynamically struct instead.
Then define a new pin_base field in the sunxi_pinctrl_desc which will be
used to specify the gpiochip base pin.

Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/pinctrl/pinctrl-sunxi.c | 30 ++++++++++++++----------------
 drivers/pinctrl/pinctrl-sunxi.h |  1 +
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sunxi.c b/drivers/pinctrl/pinctrl-sunxi.c
index 73d11e2..6db1c9e 100644
--- a/drivers/pinctrl/pinctrl-sunxi.c
+++ b/drivers/pinctrl/pinctrl-sunxi.c
@@ -538,19 +538,6 @@ static int sunxi_pinctrl_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 	return irq_find_mapping(pctl->domain, desc->irqnum);
 }
 
-static struct gpio_chip sunxi_pinctrl_gpio_chip = {
-	.owner			= THIS_MODULE,
-	.request		= sunxi_pinctrl_gpio_request,
-	.free			= sunxi_pinctrl_gpio_free,
-	.direction_input	= sunxi_pinctrl_gpio_direction_input,
-	.direction_output	= sunxi_pinctrl_gpio_direction_output,
-	.get			= sunxi_pinctrl_gpio_get,
-	.set			= sunxi_pinctrl_gpio_set,
-	.of_xlate		= sunxi_pinctrl_gpio_of_xlate,
-	.to_irq			= sunxi_pinctrl_gpio_to_irq,
-	.of_gpio_n_cells	= 3,
-	.can_sleep		= false,
-};
 
 static int sunxi_pinctrl_irq_set_type(struct irq_data *d,
 				      unsigned int type)
@@ -858,11 +845,22 @@ static int sunxi_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
-	pctl->chip = &sunxi_pinctrl_gpio_chip;
-	pctl->chip->ngpio = round_up(last_pin, PINS_PER_BANK);
+	pctl->chip->owner = THIS_MODULE;
+	pctl->chip->request = sunxi_pinctrl_gpio_request,
+	pctl->chip->free = sunxi_pinctrl_gpio_free,
+	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input,
+	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output,
+	pctl->chip->get = sunxi_pinctrl_gpio_get,
+	pctl->chip->set = sunxi_pinctrl_gpio_set,
+	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate,
+	pctl->chip->to_irq = sunxi_pinctrl_gpio_to_irq,
+	pctl->chip->of_gpio_n_cells = 3,
+	pctl->chip->can_sleep = false,
+	pctl->chip->ngpio = round_up(last_pin, PINS_PER_BANK) -
+			    pctl->desc->pin_base;
 	pctl->chip->label = dev_name(&pdev->dev);
 	pctl->chip->dev = &pdev->dev;
-	pctl->chip->base = 0;
+	pctl->chip->base = pctl->desc->pin_base;
 
 	ret = gpiochip_add(pctl->chip);
 	if (ret)
diff --git a/drivers/pinctrl/pinctrl-sunxi.h b/drivers/pinctrl/pinctrl-sunxi.h
index ed3c4d7..35d15b2 100644
--- a/drivers/pinctrl/pinctrl-sunxi.h
+++ b/drivers/pinctrl/pinctrl-sunxi.h
@@ -450,6 +450,7 @@ struct sunxi_pinctrl_desc {
 	int				npins;
 	struct pinctrl_gpio_range	*ranges;
 	int				nranges;
+	unsigned			pin_base;
 };
 
 struct sunxi_pinctrl_function {
-- 
1.8.3.2
