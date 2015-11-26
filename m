From: Martin Schiller <mschiller@tdt.de>
Subject: [PATCH v3 4/5] pinctrl/lantiq: Fix GPIO Setup of GPIO Port3
Date: Thu, 26 Nov 2015 11:00:09 +0100
Message-ID: <1448532010-30930-4-git-send-email-mschiller@tdt.de>
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

 drivers/pinctrl/pinctrl-xway.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index a064962..b78baaa 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1563,6 +1563,10 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 {
 	struct ltq_pinmux_info *info = dev_get_drvdata(chip->dev);
 
+	if (PORT(pin) == PORT3)
+		gpio_setbit(info->membase[0], GPIO3_OD, PORT_PIN(pin));
+	else
+		gpio_setbit(info->membase[0], GPIO_OD(pin), PORT_PIN(pin));
 	gpio_setbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
 	xway_gpio_set(chip, pin, val);
 
-- 
2.1.4

