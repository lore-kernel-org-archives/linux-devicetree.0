From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 2/5] pinctrl: stm32: introduce package support
Date: Wed, 10 Apr 2019 13:30:21 +0200
Message-ID: <1554895824-25709-3-git-send-email-alexandre.torgue@st.com>
References: <1554895824-25709-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554895824-25709-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Alexandre Torgue <alexandre.torgue@st.com>
List-Id: devicetree@vger.kernel.org

A same SoC can be available in several packages. Differences between
packages are only the numbers of available balls. In order not to write
a driver for each new package, same driver (ex: pinctrl-stm32mp157.c) will
be used. This patch introduces the "package" property for each pin. So on a
same driver, it will be possible to indicate on which package the pin is
available. The package information will be got from the device tree.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 0b9ff5a..0aebc31 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -95,6 +95,9 @@ struct stm32_pinctrl {
 	struct regmap		*regmap;
 	struct regmap_field	*irqmux[STM32_GPIO_PINS_PER_BANK];
 	struct hwspinlock *hwlock;
+	struct stm32_desc_pin *pins;
+	u32 npins;
+	u32 pkg;
 };
 
 static inline int stm32_gpio_pin(int gpio)
@@ -358,8 +361,8 @@ static bool stm32_pctrl_is_function_valid(struct stm32_pinctrl *pctl,
 {
 	int i;
 
-	for (i = 0; i < pctl->match_data->npins; i++) {
-		const struct stm32_desc_pin *pin = pctl->match_data->pins + i;
+	for (i = 0; i < pctl->npins; i++) {
+		const struct stm32_desc_pin *pin = pctl->pins + i;
 		const struct stm32_desc_function *func = pin->functions;
 
 		if (pin->pin.number != pin_num)
@@ -1175,7 +1178,7 @@ static int stm32_pctrl_build_state(struct platform_device *pdev)
 	struct stm32_pinctrl *pctl = platform_get_drvdata(pdev);
 	int i;
 
-	pctl->ngroups = pctl->match_data->npins;
+	pctl->ngroups = pctl->npins;
 
 	/* Allocate groups */
 	pctl->groups = devm_kcalloc(&pdev->dev, pctl->ngroups,
@@ -1189,19 +1192,50 @@ static int stm32_pctrl_build_state(struct platform_device *pdev)
 	if (!pctl->grp_names)
 		return -ENOMEM;
 
-	for (i = 0; i < pctl->match_data->npins; i++) {
-		const struct stm32_desc_pin *pin = pctl->match_data->pins + i;
+	for (i = 0; i < pctl->npins; i++) {
+		const struct stm32_desc_pin *pin = pctl->pins + i;
 		struct stm32_pinctrl_group *group = pctl->groups + i;
 
 		group->name = pin->pin.name;
 		group->pin = pin->pin.number;
-
 		pctl->grp_names[i] = pin->pin.name;
 	}
 
 	return 0;
 }
 
+static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
+				       struct stm32_desc_pin *pins)
+{
+	const struct stm32_desc_pin *p;
+	int i, nb_pins_available = 0;
+
+	for (i = 0; i < pctl->match_data->npins; i++) {
+		p = pctl->match_data->pins + i;
+		if (pctl->pkg && !(pctl->pkg & p->pkg))
+			continue;
+		pins->pin = p->pin;
+		pins->functions = p->functions;
+		pins++;
+		nb_pins_available++;
+	}
+
+	pctl->npins = nb_pins_available;
+
+	return 0;
+}
+
+static void stm32_pctl_get_package(struct device_node *np,
+				   struct stm32_pinctrl *pctl)
+{
+	if (of_property_read_u32(np, "st,package", &pctl->pkg)) {
+		pctl->pkg = 0;
+		dev_warn(pctl->dev, "No package detected, use default one\n");
+	} else {
+		dev_dbg(pctl->dev, "package detected: %x\n", pctl->pkg);
+	}
+}
+
 int stm32_pctl_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1241,6 +1275,19 @@ int stm32_pctl_probe(struct platform_device *pdev)
 
 	pctl->dev = dev;
 	pctl->match_data = match->data;
+
+	/*  get package information */
+	stm32_pctl_get_package(np, pctl);
+
+	pctl->pins = devm_kcalloc(pctl->dev, pctl->match_data->npins,
+				  sizeof(*pctl->pins), GFP_KERNEL);
+	if (!pctl->pins)
+		return -ENOMEM;
+
+	ret = stm32_pctrl_create_pins_tab(pctl, pctl->pins);
+	if (ret)
+		return ret;
+
 	ret = stm32_pctrl_build_state(pdev);
 	if (ret) {
 		dev_err(dev, "build state failed: %d\n", ret);
@@ -1253,18 +1300,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, pctl->match_data->npins, sizeof(*pins),
+	pins = devm_kcalloc(&pdev->dev, pctl->npins, sizeof(*pins),
 			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < pctl->match_data->npins; i++)
-		pins[i] = pctl->match_data->pins[i].pin;
+	for (i = 0; i < pctl->npins; i++)
+		pins[i] = pctl->pins[i].pin;
 
 	pctl->pctl_desc.name = dev_name(&pdev->dev);
 	pctl->pctl_desc.owner = THIS_MODULE;
 	pctl->pctl_desc.pins = pins;
-	pctl->pctl_desc.npins = pctl->match_data->npins;
+	pctl->pctl_desc.npins = pctl->npins;
 	pctl->pctl_desc.confops = &stm32_pconf_ops;
 	pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
 	pctl->pctl_desc.pmxops = &stm32_pmx_ops;
@@ -1305,4 +1352,3 @@ int stm32_pctl_probe(struct platform_device *pdev)
 
 	return 0;
 }
-
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 473a623..8acdf48 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -26,6 +26,7 @@ struct stm32_desc_function {
 struct stm32_desc_pin {
 	struct pinctrl_pin_desc pin;
 	const struct stm32_desc_function *functions;
+	const unsigned int pkg;
 };
 
 #define STM32_PIN(_pin, ...)					\
@@ -35,6 +36,13 @@ struct stm32_desc_pin {
 			__VA_ARGS__, { } },			\
 	}
 
+#define STM32_PIN_PKG(_pin, _pkg, ...)					\
+	{							\
+		.pin = _pin,					\
+		.pkg  = _pkg,				\
+		.functions = (struct stm32_desc_function[]){	\
+			__VA_ARGS__, { } },			\
+	}
 #define STM32_FUNCTION(_num, _name)		\
 	{							\
 		.num = _num,					\
-- 
2.7.4
