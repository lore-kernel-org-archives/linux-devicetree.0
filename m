From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 4/4] gpio: aspeed: Add open-source and open-drain support
Date: Fri,  7 Apr 2017 22:29:02 +0930
Message-ID: <20170407125902.15960-5-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170407125902.15960-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

As per the datasheet, manage the IO and value states to implement
open-source/open-drain, but do this by falling back to gpiolib's
emulation.

This commit simply makes the behaviour explicit for clarity, rather than
relying on the implicit return of -ENOTSUPP to trigger the emulation.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 3327a48df862..ccea609676ee 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -761,6 +761,10 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 			param == PIN_CONFIG_BIAS_PULL_DOWN ||
 			param == PIN_CONFIG_DRIVE_STRENGTH)
 		return pinctrl_gpio_set_config(offset, config);
+	else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
+			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
+		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
+		return -ENOTSUPP;
 
 	return -ENOTSUPP;
 }
-- 
2.9.3

