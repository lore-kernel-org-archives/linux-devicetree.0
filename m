From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 4/4] pinctrl: aspeed: g5: Add pinconf support
Date: Fri,  7 Apr 2017 22:27:13 +0930
Message-ID: <20170407125713.15678-5-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170407125713.15678-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Testing for pinctrl-aspeed-g5 was performed on an AST2500EVB system,
using the strategy outlined in the commit message for the change to the
Aspeed pinctrl core.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 153 ++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 43221a3c7e23..68aa04664a62 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2285,6 +2285,146 @@ static const struct aspeed_pin_function aspeed_g5_functions[] = {
 	ASPEED_PINCTRL_FUNC(WDTRST2),
 };
 
+static struct aspeed_pin_config aspeed_g5_configs[] = {
+	/* GPIOA, GPIOQ */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B14, B13 }, SCU8C, 16 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B14, B13 }, SCU8C, 16 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A11, N20 }, SCU8C, 16 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A11, N20 }, SCU8C, 16 },
+
+	/* GPIOB, GPIOR */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { K19, H20 }, SCU8C, 17 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { K19, H20 }, SCU8C, 17 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { AA19, E10 }, SCU8C, 17 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { AA19, E10 }, SCU8C, 17 },
+
+	/* GPIOC, GPIOS*/
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C12, B11 }, SCU8C, 18 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C12, B11 }, SCU8C, 18 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V20, AA20 }, SCU8C, 18 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V20, AA20 }, SCU8C, 18 },
+
+	/* GPIOD, GPIOY */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F19, C21 }, SCU8C, 19 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F19, C21 }, SCU8C, 19 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { R22, P20 }, SCU8C, 19 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { R22, P20 }, SCU8C, 19 },
+
+	/* GPIOE, GPIOZ */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B20, B19 }, SCU8C, 20 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B20, B19 }, SCU8C, 20 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { Y20, W21 }, SCU8C, 20 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { Y20, W21 }, SCU8C, 20 },
+
+	/* GPIOF, GPIOAA */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { J19, H18 }, SCU8C, 21 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { J19, H18 }, SCU8C, 21 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { Y21, P19 }, SCU8C, 21 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { Y21, P19 }, SCU8C, 21 },
+
+	/* GPIOG, GPIOAB */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A19, E14 }, SCU8C, 22 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A19, E14 }, SCU8C, 22 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N19, R20 }, SCU8C, 22 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N19, R20 }, SCU8C, 22 },
+
+	/* GPIOH, GPIOAC */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A18,  D18  }, SCU8C, 23 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A18,  D18  }, SCU8C, 23 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G21,  G22  }, SCU8C, 23 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G21,  G22  }, SCU8C, 23 },
+
+	/* GPIOs [I, P] */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C18, A15 }, SCU8C, 24 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C18, A15 }, SCU8C, 24 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { R2,  T3  }, SCU8C, 25 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { R2,  T3  }, SCU8C, 25 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L3,  R1  }, SCU8C, 26 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L3,  R1  }, SCU8C, 26 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { T2,  W1  }, SCU8C, 27 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { T2,  W1  }, SCU8C, 27 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { Y1,  T5  }, SCU8C, 28 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { Y1,  T5  }, SCU8C, 28 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V2,  T4  }, SCU8C, 29 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V2,  T4  }, SCU8C, 29 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { U5,  W4  }, SCU8C, 30 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { U5,  W4  }, SCU8C, 30 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V4,  V6  }, SCU8C, 31 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V4,  V6  }, SCU8C, 31 },
+
+	/* GPIOs T[0-5] (RGMII1 Tx pins) */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B5, B5 }, SCU90, 8 },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E9, A5 }, SCU90, 9 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B5, D7 }, SCU90, 12 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B5, D7 }, SCU90, 12 },
+
+	/* GPIOs T[6-7], U[0-3] (RGMII2 TX pins) */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B2, B2 }, SCU90, 10 },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B1, B3 }, SCU90, 11 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B2, D4 }, SCU90, 14 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B2, D4 }, SCU90, 14 },
+
+	/* GPIOs U[4-7], V[0-1] (RGMII1 Rx pins) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B4, C4 }, SCU90, 13 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B4, C4 }, SCU90, 13 },
+
+	/* GPIOs V[2-7] (RGMII2 Rx pins) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C2, E6 }, SCU90, 15 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C2, E6 }, SCU90, 15 },
+
+	/* ADC pull-downs (SCUA8[19:4]) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F4, F4 }, SCUA8, 4 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F4, F4 }, SCUA8, 4 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F5, F5 }, SCUA8, 5 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F5, F5 }, SCUA8, 5 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { E2, E2 }, SCUA8, 6 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { E2, E2 }, SCUA8, 6 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { E1, E1 }, SCUA8, 7 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { E1, E1 }, SCUA8, 7 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F3, F3 }, SCUA8, 8 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F3, F3 }, SCUA8, 8 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { E3, E3 }, SCUA8, 9 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { E3, E3 }, SCUA8, 9 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G5, G5 }, SCUA8, 10 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G5, G5 }, SCUA8, 10 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G4, G4 }, SCUA8, 11 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G4, G4 }, SCUA8, 11 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F2, F2 }, SCUA8, 12 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F2, F2 }, SCUA8, 12 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G3, G3 }, SCUA8, 13 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G3, G3 }, SCUA8, 13 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G2, G2 }, SCUA8, 14 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G2, G2 }, SCUA8, 14 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F1, F1 }, SCUA8, 15 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F1, F1 }, SCUA8, 15 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { H5, H5 }, SCUA8, 16 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { H5, H5 }, SCUA8, 16 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G1, G1 }, SCUA8, 17 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G1, G1 }, SCUA8, 17 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { H3, H3 }, SCUA8, 18 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { H3, H3 }, SCUA8, 18 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { H4, H4 }, SCUA8, 19 },
+	{ PIN_CONFIG_BIAS_DISABLE,   { H4, H4 }, SCUA8, 19 },
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
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { F19, E21 }, SCUA8, 20 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { F20, D20 }, SCUA8, 21 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { D21, E20 }, SCUA8, 22 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { G18, C21 }, SCUA8, 23 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { B20, C20 }, SCUA8, 24 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { F18, F17 }, SCUA8, 25 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { E18, D19 }, SCUA8, 26 },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { A20, B19 }, SCUA8, 27 },
+};
+
 static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
@@ -2292,6 +2432,8 @@ static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
 	.ngroups = ARRAY_SIZE(aspeed_g5_groups),
 	.functions = aspeed_g5_functions,
 	.nfunctions = ARRAY_SIZE(aspeed_g5_functions),
+	.configs = aspeed_g5_configs,
+	.nconfigs = ARRAY_SIZE(aspeed_g5_configs),
 };
 
 static struct pinmux_ops aspeed_g5_pinmux_ops = {
@@ -2308,16 +2450,25 @@ static struct pinctrl_ops aspeed_g5_pinctrl_ops = {
 	.get_group_name = aspeed_pinctrl_get_group_name,
 	.get_group_pins = aspeed_pinctrl_get_group_pins,
 	.pin_dbg_show = aspeed_pinctrl_pin_dbg_show,
-	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinctrl_utils_free_map,
 };
 
+static struct pinconf_ops aspeed_g5_conf_ops = {
+	.is_generic = true,
+	.pin_config_get = aspeed_pin_config_get,
+	.pin_config_set = aspeed_pin_config_set,
+	.pin_config_group_get = aspeed_pin_config_group_get,
+	.pin_config_group_set = aspeed_pin_config_group_set,
+};
+
 static struct pinctrl_desc aspeed_g5_pinctrl_desc = {
 	.name = "aspeed-g5-pinctrl",
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
 	.pctlops = &aspeed_g5_pinctrl_ops,
 	.pmxops = &aspeed_g5_pinmux_ops,
+	.confops = &aspeed_g5_conf_ops,
 };
 
 static int aspeed_g5_pinctrl_probe(struct platform_device *pdev)
-- 
2.9.3
