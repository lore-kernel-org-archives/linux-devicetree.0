From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v2 3/4] pinctrl: aspeed: g4: Add pinconf support
Date: Fri,  7 Apr 2017 22:27:12 +0930
Message-ID: <20170407125713.15678-4-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170407125713.15678-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
system, using the strategy outlined in the commit message for the
change to the Aspeed pinctrl core.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 117 ++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 7de596e2b9d4..b6a049643555 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2234,6 +2234,110 @@ static const struct aspeed_pin_function aspeed_g4_functions[] = {
 	ASPEED_PINCTRL_FUNC(WDTRST2),
 };
 
+static const struct aspeed_pin_config aspeed_g4_configs[] = {
+	/* GPIO banks ranges [A, B], [D, J], [M, R] */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { D6,  D5  }, SCU8C, 16 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { D6,  D5  }, SCU8C, 16 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { J21, E18 }, SCU8C, 17 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { J21, E18 }, SCU8C, 17 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A18, E15 }, SCU8C, 19 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A18, E15 }, SCU8C, 19 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { D15, B14 }, SCU8C, 20 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { D15, B14 }, SCU8C, 20 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { D18, C17 }, SCU8C, 21 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { D18, C17 }, SCU8C, 21 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A14, U18 }, SCU8C, 22 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A14, U18 }, SCU8C, 22 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A8,  E7  }, SCU8C, 23 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A8,  E7  }, SCU8C, 23 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C22, E20 }, SCU8C, 24 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C22, E20 }, SCU8C, 24 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { J5,  T1  }, SCU8C, 25 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { J5,  T1  }, SCU8C, 25 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { U1,  U5  }, SCU8C, 26 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { U1,  U5  }, SCU8C, 26 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V3,  V5  }, SCU8C, 27 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V3,  V5  }, SCU8C, 27 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { W4,  AB2 }, SCU8C, 28 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { W4,  AB2 }, SCU8C, 28 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V6,  V7  }, SCU8C, 29 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V6,  V7  }, SCU8C, 29 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { Y6,  AB7 }, SCU8C, 30 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { Y6,  AB7 }, SCU8C, 30 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V20, A5  }, SCU8C, 31 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V20, A5  }, SCU8C, 31 },
+
+	/* GPIOs T[0-5] (RGMII1 Tx pins) */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A12, A13 }, SCU90, 9  },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A12, A13 }, SCU90, 12 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A12, A13 }, SCU90, 12 },
+
+	/* GPIOs T[6-7], U[0-3] (RGMII2 TX pins) */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D9,  D10 }, SCU90, 11 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { D9,  D10 }, SCU90, 14 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { D9,  D10 }, SCU90, 14 },
+
+	/* GPIOs U[4-7], V[0-1] (RGMII1 Rx pins) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { E11, E10 }, SCU90, 13 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { E11, E10 }, SCU90, 13 },
+
+	/* GPIOs V[2-7] (RGMII2 Rx pins) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C9,  C8  }, SCU90, 15 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C9,  C8  }, SCU90, 15 },
+
+	/* ADC pull-downs (SCUA8[19:4]) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L5,  L5  }, SCUA8, 4 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L5,  L5  }, SCUA8, 4 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L4,  L4  }, SCUA8, 5 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L4,  L4  }, SCUA8, 5 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L3,  L3  }, SCUA8, 6 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L3,  L3  }, SCUA8, 6 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L2,  L2  }, SCUA8, 7 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L2,  L2  }, SCUA8, 7 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L1,  L1  }, SCUA8, 8 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L1,  L1  }, SCUA8, 8 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M5,  M5  }, SCUA8, 9 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M5,  M5  }, SCUA8, 9 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M4,  M4  }, SCUA8, 10 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M4,  M4  }, SCUA8, 10 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M3,  M3  }, SCUA8, 11 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M3,  M3  }, SCUA8, 11 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M2,  M2  }, SCUA8, 12 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M2,  M2  }, SCUA8, 12 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M1,  M1  }, SCUA8, 13 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M1,  M1  }, SCUA8, 13 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N5,  N5  }, SCUA8, 14 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N5,  N5  }, SCUA8, 14 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N4,  N4  }, SCUA8, 15 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N4,  N4  }, SCUA8, 15 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N3,  N3  }, SCUA8, 16 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N3,  N3  }, SCUA8, 16 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N2,  N2  }, SCUA8, 17 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N2,  N2  }, SCUA8, 17 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N1,  N1  }, SCUA8, 18 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N1,  N1  }, SCUA8, 18 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { P5,  P5  }, SCUA8, 19 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { P5,  P5  }, SCUA8, 19 },
+
+	/*
+	 * Debounce settings for GPIOs D and E passthrough mode are in
+	 * SCUA8[27:20] and so are managed by pinctrl. Normal GPIO debounce for
+	 * banks D and E is handled by the GPIO driver - GPIO passthrough is
+	 * treated like any other non-GPIO mux function. There is a catch
+	 * however, in that the debounce period is configured in the GPIO
+	 * controller. Due to this tangle between GPIO and pinctrl we don't yet
+	 * fully support pass-through debounce.
+	 */
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { A18, D16 }, SCUA8, 20 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { B17, A17 }, SCUA8, 21 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { C16, B16 }, SCUA8, 22 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { A16, E15 }, SCUA8, 23 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { D15, C15 }, SCUA8, 24 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { B15, A15 }, SCUA8, 25 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { E14, D14 }, SCUA8, 26 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { C14, B14 }, SCUA8, 27 },
+};
+
 static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data = {
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
@@ -2241,6 +2345,8 @@ static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data = {
 	.ngroups = ARRAY_SIZE(aspeed_g4_groups),
 	.functions = aspeed_g4_functions,
 	.nfunctions = ARRAY_SIZE(aspeed_g4_functions),
+	.configs = aspeed_g4_configs,
+	.nconfigs = ARRAY_SIZE(aspeed_g4_configs),
 };
 
 static struct pinmux_ops aspeed_g4_pinmux_ops = {
@@ -2257,16 +2363,25 @@ static struct pinctrl_ops aspeed_g4_pinctrl_ops = {
 	.get_group_name = aspeed_pinctrl_get_group_name,
 	.get_group_pins = aspeed_pinctrl_get_group_pins,
 	.pin_dbg_show = aspeed_pinctrl_pin_dbg_show,
-	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinctrl_utils_free_map,
 };
 
+static const struct pinconf_ops aspeed_g4_conf_ops = {
+	.is_generic = true,
+	.pin_config_get = aspeed_pin_config_get,
+	.pin_config_set = aspeed_pin_config_set,
+	.pin_config_group_get = aspeed_pin_config_group_get,
+	.pin_config_group_set = aspeed_pin_config_group_set,
+};
+
 static struct pinctrl_desc aspeed_g4_pinctrl_desc = {
 	.name = "aspeed-g4-pinctrl",
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
 	.pctlops = &aspeed_g4_pinctrl_ops,
 	.pmxops = &aspeed_g4_pinmux_ops,
+	.confops = &aspeed_g4_conf_ops,
 };
 
 static int aspeed_g4_pinctrl_probe(struct platform_device *pdev)
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
