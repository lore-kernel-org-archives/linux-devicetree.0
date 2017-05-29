From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH v2 2/3] pinctrl: stm32: Implement .get_direction gpio_chip
 callback
Date: Mon, 29 May 2017 18:17:32 +0200
Message-ID: <1496074653-2941-3-git-send-email-alexandre.torgue@st.com>
References: <1496074653-2941-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1496074653-2941-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add .get_direction() gpiochip callback in STM32 pinctrl driver.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5a15c7d..814f76c 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -209,6 +209,24 @@ static int stm32_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 	return irq_create_fwspec_mapping(&fwspec);
 }
 
+static int stm32_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
+	int pin = stm32_gpio_pin(offset);
+	int ret;
+	u32 mode, alt;
+
+	stm32_pmx_get_mode(bank, pin, &mode, &alt);
+	if ((alt == 0) && (mode == 0))
+		ret = 1;
+	else if ((alt == 0) && (mode == 1))
+		ret = 0;
+	else
+		ret = -EINVAL;
+
+	return ret;
+}
+
 static const struct gpio_chip stm32_gpio_template = {
 	.request		= stm32_gpio_request,
 	.free			= stm32_gpio_free,
@@ -217,6 +235,7 @@ static int stm32_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 	.direction_input	= stm32_gpio_direction_input,
 	.direction_output	= stm32_gpio_direction_output,
 	.to_irq			= stm32_gpio_to_irq,
+	.get_direction		= stm32_gpio_get_direction,
 };
 
 static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
@@ -577,8 +596,8 @@ static void stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 	clk_disable(bank->clk);
 }
 
-static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank,
-		int pin, u32 *mode, u32 *alt)
+void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
+			u32 *alt)
 {
 	u32 val;
 	int alt_shift = (pin % 8) * 4;
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 35ebc94..8702a99 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -45,7 +45,10 @@ struct stm32_pinctrl_match_data {
 	const unsigned int npins;
 };
 
-int stm32_pctl_probe(struct platform_device *pdev);
+struct stm32_gpio_bank;
 
+int stm32_pctl_probe(struct platform_device *pdev);
+void stm32_pmx_get_mode(struct stm32_gpio_bank *bank,
+			int pin, u32 *mode, u32 *alt);
 #endif /* __PINCTRL_STM32_H */
 
-- 
1.9.1
