From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v2 2/4] pinctrl: aspeed: Add core pinconf support
Date: Fri,  7 Apr 2017 22:27:11 +0930
Message-ID: <20170407125713.15678-3-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170407125713.15678-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Several pinconf parameters have a fairly straight-forward mapping onto
the Aspeed pin controller. These include management of pull-down bias,
drive-strength, and some debounce configuration.

Pin biasing largely is managed on a per-GPIO-bank basis, aside from the
ADC and RMII/RGMII pins. As the bias configuration for each pin in a
bank maps onto a single per-bank bit, configuration tables will be
introduced to describe the ranges of pins and the supported pinconf
parameter. The use of tables also helps with the sparse support of
pinconf properties, and the fact that not all GPIO banks support
biasing or drive-strength configuration.

Further, as the pin controller uses a consistent approach for bias and
drive strength configuration at the register level, a second table is
defined for looking up the the bit-state required to enable or query the
provided configuration.

Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
system, and pinctrl-aspeed-g5 on an AST2500EVB as well as under QEMU.
The test method was to set the appropriate bits via devmem and verify
the result through the controller's pinconf-pins debugfs file. This
simultaneously validates the get() path and half of the set() path. The
remainder of the set() path was validated by configuring a handful of
pins via the devicetree with the supported pinconf properties and
verifying the appropriate registers were touched.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 211 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h |  28 +++++
 2 files changed, 239 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 76f62bd45f02..3dcf82533bef 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -537,3 +537,214 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+
+static inline bool pin_in_config_range(unsigned int offset,
+		const struct aspeed_pin_config *config)
+{
+	return offset >= config->pins[0] && offset <= config->pins[1];
+}
+
+static inline const struct aspeed_pin_config *find_pinconf_config(
+		const struct aspeed_pinctrl_data *pdata,
+		unsigned int offset,
+		enum pin_config_param param)
+{
+	unsigned int i;
+
+	for (i = 0; i < pdata->nconfigs; i++) {
+		if (param == pdata->configs[i].param &&
+				pin_in_config_range(offset, &pdata->configs[i]))
+			return &pdata->configs[i];
+	}
+
+	return NULL;
+}
+
+/**
+ * @param: pinconf configuration parameter
+ * @arg: The supported argument for @param, or -1 if any value is supported
+ * @value: The register value to write to configure @arg for @param
+ *
+ * The map is to be used in conjunction with the configuration array supplied
+ * by the driver implementation.
+ */
+struct aspeed_pin_config_map {
+	enum pin_config_param param;
+	s32 arg;
+	u32 val;
+};
+
+enum aspeed_pin_config_map_type { MAP_TYPE_ARG, MAP_TYPE_VAL };
+
+/* Aspeed consistently both:
+ *
+ * 1. Defines "disable bits" for internal pull-downs
+ * 2. Uses 8mA or 16mA drive strengths
+ */
+static const struct aspeed_pin_config_map pin_config_map[] = {
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0 },
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1 },
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0 },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1 },
+};
+
+static const struct aspeed_pin_config_map *find_pinconf_map(
+		enum pin_config_param param,
+		enum aspeed_pin_config_map_type type,
+		s64 value)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pin_config_map); i++) {
+		const struct aspeed_pin_config_map *elem;
+		bool match;
+
+		elem = &pin_config_map[i];
+
+		switch (type) {
+		case MAP_TYPE_ARG:
+			match = (elem->arg == -1 || elem->arg == value);
+			break;
+		case MAP_TYPE_VAL:
+			match = (elem->val == value);
+			break;
+		}
+
+		if (param == elem->param && match)
+			return elem;
+	}
+
+	return NULL;
+}
+
+int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *config)
+{
+	const enum pin_config_param param = pinconf_to_config_param(*config);
+	const struct aspeed_pin_config_map *pmap;
+	const struct aspeed_pinctrl_data *pdata;
+	const struct aspeed_pin_config *pconf;
+	unsigned int val;
+	int rc = 0;
+	u32 arg;
+
+	pdata = pinctrl_dev_get_drvdata(pctldev);
+	pconf = find_pinconf_config(pdata, offset, param);
+	if (!pconf)
+		return -ENOTSUPP;
+
+	rc = regmap_read(pdata->maps[ASPEED_IP_SCU], pconf->reg, &val);
+	if (rc < 0)
+		return rc;
+
+	pmap = find_pinconf_map(param, MAP_TYPE_VAL,
+			(val & BIT(pconf->bit)) >> pconf->bit);
+
+	if (!pmap)
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		arg = (u32) pmap->arg;
+	else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
+		arg = !!pmap->arg;
+	else
+		arg = 1;
+
+	if (!arg)
+		return -EINVAL;
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *configs, unsigned int num_configs)
+{
+	const struct aspeed_pinctrl_data *pdata;
+	unsigned int i;
+	int rc = 0;
+
+	pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	for (i = 0; i < num_configs; i++) {
+		const struct aspeed_pin_config_map *pmap;
+		const struct aspeed_pin_config *pconf;
+		enum pin_config_param param;
+		unsigned int val;
+		u32 arg;
+
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		pconf = find_pinconf_config(pdata, offset, param);
+		if (!pconf)
+			return -ENOTSUPP;
+
+		pmap = find_pinconf_map(param, MAP_TYPE_ARG, arg);
+
+		if (unlikely(WARN_ON(!pmap)))
+			return -EINVAL;
+
+		val = pmap->val << pconf->bit;
+
+		rc = regmap_update_bits(pdata->maps[ASPEED_IP_SCU], pconf->reg,
+				BIT(pconf->bit), val);
+
+		if (rc < 0)
+			return rc;
+
+		pr_debug("%s: Set SCU%02X[%d]=%d for param %d(=%d) on pin %d\n",
+				__func__, pconf->reg, pconf->bit, pmap->val,
+				param, arg, offset);
+	}
+
+	return 0;
+}
+
+int aspeed_pin_config_group_get(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int rc;
+
+	rc = aspeed_pinctrl_get_group_pins(pctldev, selector, &pins, &npins);
+	if (rc < 0)
+		return rc;
+
+	if (!npins)
+		return -ENODEV;
+
+	rc = aspeed_pin_config_get(pctldev, pins[0], config);
+
+	return rc;
+}
+
+int aspeed_pin_config_group_set(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *configs,
+		unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int rc;
+	int i;
+
+	pr_debug("%s: Fetching pins for group selector %d\n",
+			__func__, selector);
+	rc = aspeed_pinctrl_get_group_pins(pctldev, selector, &pins, &npins);
+	if (rc < 0)
+		return rc;
+
+	for (i = 0; i < npins; i++) {
+		rc = aspeed_pin_config_set(pctldev, pins[i], configs,
+				num_configs);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 08a10d4db229..fa125db828f5 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -514,6 +514,20 @@ struct aspeed_pin_desc {
 	SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
 	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(gpio))
 
+/**
+ * @param The pinconf parameter type
+ * @pins The pin range this config struct covers, [low, high]
+ * @reg The register housing the configuration bits
+ * @mask The mask to select the bits of interest in @reg
+ */
+struct aspeed_pin_config {
+	enum pin_config_param param;
+	unsigned int pins[2];
+	unsigned int reg;
+	u8 bit;
+	u8 value;
+};
+
 struct aspeed_pinctrl_data {
 	struct regmap *maps[ASPEED_NR_PINMUX_IPS];
 
@@ -525,6 +539,9 @@ struct aspeed_pinctrl_data {
 
 	const struct aspeed_pin_function *functions;
 	const unsigned int nfunctions;
+
+	const struct aspeed_pin_config *configs;
+	const unsigned int nconfigs;
 };
 
 #define ASPEED_PINCTRL_PIN(name_) \
@@ -580,5 +597,16 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 int aspeed_pinctrl_probe(struct platform_device *pdev,
 		struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
+int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *config);
+int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *configs, unsigned int num_configs);
+int aspeed_pin_config_group_get(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *config);
+int aspeed_pin_config_group_set(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *configs,
+		unsigned int num_configs);
 
 #endif /* PINCTRL_ASPEED */
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
