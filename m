From: Pramod Kumar <pramodku@broadcom.com>
Subject: [PATCH 07/11] pinctrl: use ngpios propety from DT
Date: Mon, 19 Oct 2015 11:13:14 +0530
Message-ID: <1445233398-27129-8-git-send-email-pramodku@broadcom.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

Since identical hardware is used in several instances and all pins
are not routed to pinctrl hence getting total number of gpios from
DT make more sense hence stop using total number of gpios pins from
drivers and extract it from DT.

Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c | 45 +++++++------------------------
 1 file changed, 9 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
index 12a48f4..498a58a 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
@@ -642,35 +642,11 @@ static void cygnus_gpio_unregister_pinconf(struct cygnus_gpio *chip)
 		pinctrl_unregister(chip->pctl);
 }
 
-struct cygnus_gpio_data {
-	unsigned num_gpios;
-};
-
-static const struct cygnus_gpio_data cygnus_cmm_gpio_data = {
-	.num_gpios = 24,
-};
-
-static const struct cygnus_gpio_data cygnus_asiu_gpio_data = {
-	.num_gpios = 146,
-};
-
-static const struct cygnus_gpio_data cygnus_crmu_gpio_data = {
-	.num_gpios = 6,
-};
-
 static const struct of_device_id cygnus_gpio_of_match[] = {
-	{
-		.compatible = "brcm,cygnus-ccm-gpio",
-		.data = &cygnus_cmm_gpio_data,
-	},
-	{
-		.compatible = "brcm,cygnus-asiu-gpio",
-		.data = &cygnus_asiu_gpio_data,
-	},
-	{
-		.compatible = "brcm,cygnus-crmu-gpio",
-		.data = &cygnus_crmu_gpio_data,
-	}
+	{ .compatible = "brcm,cygnus-ccm-gpio" },
+	{ .compatible = "brcm,cygnus-asiu-gpio" },
+	{ .compatible = "brcm,cygnus-crmu-gpio" },
+	{ }
 };
 
 static int cygnus_gpio_probe(struct platform_device *pdev)
@@ -681,14 +657,6 @@ static int cygnus_gpio_probe(struct platform_device *pdev)
 	struct gpio_chip *gc;
 	u32 ngpios;
 	int irq, ret;
-	const struct of_device_id *match;
-	const struct cygnus_gpio_data *gpio_data;
-
-	match = of_match_device(cygnus_gpio_of_match, dev);
-	if (!match)
-		return -ENODEV;
-	gpio_data = match->data;
-	ngpios = gpio_data->num_gpios;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -713,6 +681,11 @@ static int cygnus_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_property_read_u32(dev->of_node, "ngpios", &ngpios)) {
+		dev_err(&pdev->dev, "missing ngpios DT property\n");
+		return -ENODEV;
+	}
+
 	spin_lock_init(&chip->lock);
 
 	gc = &chip->gc;
-- 
1.9.1
