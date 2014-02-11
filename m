From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH v2 2/2] of/gpio: Automatically decode OF_GPIO_OPEN_DRAIN and OF_GPIO_OPEN_SOURCE flags in gpiolib.
Date: Tue, 11 Feb 2014 11:50:00 -0800
Message-ID: <1392148200-5393-3-git-send-email-ddaney.cavm@gmail.com>
References: <1392148200-5393-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392148200-5393-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

Just as gpiod_get() automatically interprets the OF_GPIO_ACTIVE_LOW
flag from the device tree, add handling for OF_GPIO_OPEN_DRAIN and
OF_GPIO_OPEN_SOURCE.

This keeps the details of handling open-drain GPIOs in the core GPIO
code, and out of the individual drivers.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 50c4922..7f596d0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2307,6 +2307,12 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	if (of_flags & OF_GPIO_ACTIVE_LOW)
 		*flags |= GPIO_ACTIVE_LOW;
 
+	if (of_flags & OF_GPIO_OPEN_DRAIN)
+		*flags |= GPIO_OPEN_DRAIN;
+
+	if (of_flags & OF_GPIO_OPEN_SOURCE)
+		*flags |= GPIO_OPEN_SOURCE;
+
 	return desc;
 }
 #else
-- 
1.7.11.7
