From: Martin Schiller <mschiller@tdt.de>
Subject: [PATCH v3 5/5] pinctrl/lantiq: Implement gpio_chip.to_irq
Date: Thu, 26 Nov 2015 11:00:10 +0100
Message-ID: <1448532010-30930-5-git-send-email-mschiller@tdt.de>
References: <1448532010-30930-1-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1448532010-30930-1-git-send-email-mschiller@tdt.de>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ralf@linux-mips.org, blogic@openwrt.org, hauke@hauke-m.de, jogo@openwrt.org, daniel.schwierzeck@gmail.com, Martin Schiller <mschiller@tdt.de>
List-Id: devicetree@vger.kernel.org

From: John Crispin <blogic@openwrt.org>

Signed-off-by: John Crispin <blogic@openwrt.org>
Signed-off-by: Martin Schiller <mschiller@tdt.de>
---
Changes in v3:
- Moved this change into a separate patch

Changes in v2: 
None

 drivers/pinctrl/pinctrl-xway.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index b78baaa..8ae99a8 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1573,6 +1573,18 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 	return 0;
 }
 
+static int xway_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+{
+	struct ltq_pinmux_info *info = dev_get_drvdata(chip->dev);
+	int i;
+
+	for (i = 0; i < info->num_exin; i++)
+		if (info->exin[i] == offset)
+			return ltq_eiu_get_irq(i);
+
+	return -1;
+}
+
 static struct gpio_chip xway_chip = {
 	.label = "gpio-xway",
 	.direction_input = xway_gpio_dir_in,
@@ -1581,6 +1593,7 @@ static struct gpio_chip xway_chip = {
 	.set = xway_gpio_set,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
+	.to_irq = xway_gpio_to_irq,
 	.base = -1,
 };
 
-- 
2.1.4

