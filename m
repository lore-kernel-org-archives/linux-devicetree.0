From: Martin Schiller <mschiller@tdt.de>
Subject: [PATCH 4/4] pinctrl/lantiq: fix up pinmux
Date: Fri, 20 Nov 2015 05:52:31 +0100
Message-ID: <1447995151-3857-4-git-send-email-mschiller@tdt.de>
References: <1447995151-3857-1-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1447995151-3857-1-git-send-email-mschiller@tdt.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ralf@linux-mips.org, blogic@openwrt.org, hauke@hauke-m.de, jogo@openwrt.org, Martin Schiller <mschiller@tdt.de>
List-Id: devicetree@vger.kernel.org

From: John Crispin <blogic@openwrt.org>

This patch is included in the openwrt patchset for several years now and needs
to go upstream as well. It includes the following changes:
1. Fix up inline function call to xway_mux_apply
2. Fix GPIO Setup of GPIO Port3
3. Implement gpio_chip.to_irq

Signed-off-by: John Crispin <blogic@openwrt.org>
Signed-off-by: Martin Schiller <mschiller@tdt.de>
---
 drivers/pinctrl/pinctrl-xway.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 234d3f4..11ec71c 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1507,10 +1507,9 @@ static struct pinctrl_desc xway_pctrl_desc = {
 	.confops	= &xway_pinconf_ops,
 };
 
-static inline int xway_mux_apply(struct pinctrl_dev *pctrldev,
+static int mux_apply(struct ltq_pinmux_info *info,
 				int pin, int mux)
 {
-	struct ltq_pinmux_info *info = pinctrl_dev_get_drvdata(pctrldev);
 	int port = PORT(pin);
 	u32 alt1_reg = GPIO_ALT1(pin);
 
@@ -1530,6 +1529,14 @@ static inline int xway_mux_apply(struct pinctrl_dev *pctrldev,
 	return 0;
 }
 
+static inline int xway_mux_apply(struct pinctrl_dev *pctrldev,
+				int pin, int mux)
+{
+	struct ltq_pinmux_info *info = pinctrl_dev_get_drvdata(pctrldev);
+
+	return mux_apply(info, pin, mux);
+}
+
 static const struct ltq_cfg_param xway_cfg_params[] = {
 	{"lantiq,pull",		LTQ_PINCONF_PARAM_PULL},
 	{"lantiq,open-drain",	LTQ_PINCONF_PARAM_OPEN_DRAIN},
@@ -1574,12 +1581,28 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 {
 	struct ltq_pinmux_info *info = dev_get_drvdata(chip->dev);
 
+	if (PORT(pin) == PORT3)
+		gpio_setbit(info->membase[0], GPIO3_OD, PORT_PIN(pin));
+	else
+		gpio_setbit(info->membase[0], GPIO_OD(pin), PORT_PIN(pin));
 	gpio_setbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
 	xway_gpio_set(chip, pin, val);
 
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
@@ -1588,6 +1611,7 @@ static struct gpio_chip xway_chip = {
 	.set = xway_gpio_set,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
+	.to_irq = xway_gpio_to_irq,
 	.base = -1,
 };
 
-- 
2.1.4
