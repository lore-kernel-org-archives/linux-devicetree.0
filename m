From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 2/2] pinctrl: stm32: check node status before new gpio bank
 registering
Date: Mon, 16 Jul 2018 14:57:37 +0200
Message-ID: <1531745857-5561-3-git-send-email-alexandre.torgue@st.com>
References: <1531745857-5561-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531745857-5561-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, amelie.delaunay@st.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Register a new GPIO bank only if GPIO bank node is enabled. This patch also
adds checks on ranges which are defined only if a bank is registered.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index eb6ae14..111225e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -639,6 +639,11 @@ static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
 	}
 
 	range = pinctrl_find_gpio_range_from_pin(pctldev, g->pin);
+	if (!range) {
+		dev_err(pctl->dev, "No gpio range defined.\n");
+		return -EINVAL;
+	}
+
 	bank = gpiochip_get_data(range->gc);
 	pin = stm32_gpio_pin(g->pin);
 
@@ -807,11 +812,17 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		unsigned int pin, enum pin_config_param param,
 		enum pin_config_param arg)
 {
+	struct stm32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct pinctrl_gpio_range *range;
 	struct stm32_gpio_bank *bank;
 	int offset, ret = 0;
 
 	range = pinctrl_find_gpio_range_from_pin(pctldev, pin);
+	if (!range) {
+		dev_err(pctl->dev, "No gpio range defined.\n");
+		return -EINVAL;
+	}
+
 	bank = gpiochip_get_data(range->gc);
 	offset = stm32_gpio_pin(pin);
 
@@ -893,6 +904,9 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	bool val;
 
 	range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
+	if (!range)
+		return;
+
 	bank = gpiochip_get_data(range->gc);
 	offset = stm32_gpio_pin(pin);
 
@@ -1173,7 +1187,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return PTR_ERR(pctl->pctl_dev);
 	}
 
-	for_each_child_of_node(np, child)
+	for_each_available_child_of_node(np, child)
 		if (of_property_read_bool(child, "gpio-controller"))
 			banks++;
 
@@ -1186,7 +1200,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		if (of_property_read_bool(child, "gpio-controller")) {
 			ret = stm32_gpiolib_register_bank(pctl, child);
 			if (ret)
-- 
2.7.4
