From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] pinctrl: abx500: fix bitwise AND test
Date: Mon, 26 Aug 2013 19:03:50 +0300
Message-ID: <20130826160350.GE12428@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The intent here was to test if the bit was set or not but there is a
logical vs bitwise AND typo so it is true if any bits are set.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I can't compile this.

diff --git a/drivers/pinctrl/pinctrl-abx500.c b/drivers/pinctrl/pinctrl-abx500.c
index 1d3f988..9afae3f 100644
--- a/drivers/pinctrl/pinctrl-abx500.c
+++ b/drivers/pinctrl/pinctrl-abx500.c
@@ -426,7 +426,7 @@ static int abx500_set_mode(struct pinctrl_dev *pctldev, struct gpio_chip *chip,
 				ret = abx500_gpio_set_bits(chip,
 					AB8500_GPIO_ALTFUN_REG,
 					af.alt_bit2,
-					!!(af.alta_val && BIT(1)));
+					!!(af.alta_val & BIT(1)));
 		} else
 			ret = abx500_gpio_set_bits(chip, AB8500_GPIO_SEL1_REG,
 					offset, 1);
@@ -447,7 +447,7 @@ static int abx500_set_mode(struct pinctrl_dev *pctldev, struct gpio_chip *chip,
 			ret = abx500_gpio_set_bits(chip,
 					AB8500_GPIO_ALTFUN_REG,
 					af.alt_bit2,
-					!!(af.altb_val && BIT(1)));
+					!!(af.altb_val & BIT(1)));
 		break;
 
 	case ABX500_ALT_C:
@@ -457,7 +457,7 @@ static int abx500_set_mode(struct pinctrl_dev *pctldev, struct gpio_chip *chip,
 			goto out;
 
 		ret = abx500_gpio_set_bits(chip, AB8500_GPIO_ALTFUN_REG,
-				af.alt_bit2, !!(af.altc_val && BIT(0)));
+				af.alt_bit2, !!(af.altc_val & BIT(0)));
 		if (ret < 0)
 			goto out;
 
