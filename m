From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH v4 1/6] gpio: davinci: Fixed a check for unbanked gpio
Date: Sat,  2 Nov 2013 21:09:30 +0530
Message-ID: <1383406775-14902-2-git-send-email-prabhakar.csenng@gmail.com>
References: <1383406775-14902-1-git-send-email-prabhakar.csenng@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1383406775-14902-1-git-send-email-prabhakar.csenng@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Alex Elder <alex.elder@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, davinci-linux-open-source@linux.davincidsp.com, linux-gpio@vger.kernel.org, Lad Prabhakar <prabhakar.csengg@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

This patch fixes the check for the offset in
gpio_to_irq_unbanked() function.

Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
---
 drivers/gpio/gpio-davinci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 8847adf..6c90cfb 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -327,7 +327,7 @@ static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
 	 * NOTE:  we assume for now that only irqs in the first gpio_chip
 	 * can provide direct-mapped IRQs to AINTC (up to 32 GPIOs).
 	 */
-	if (offset < d->irq_base)
+	if (offset < d->gpio_unbanked)
 		return d->gpio_irq + offset;
 	else
 		return -ENODEV;
-- 
1.7.9.5

