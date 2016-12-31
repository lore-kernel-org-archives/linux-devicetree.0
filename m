From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] clk: cdce925: add support for CDCE913, CDCE937, and CDCE949
Date: Sun,  1 Jan 2017 03:04:36 +0900
Message-ID: <1483207476-10920-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The CDCE925 is a member of the CDCE(L)9xx programmable clock generator
family.  There are also CDCE913, CDCE937, CDCE949 which have different
number of PLLs and outputs.

The clk-cdce925 driver supports only CDCE925 in the family.  This adds
support for the CDCE913, CDCE937, CDCE949, too.

Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Cc: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
* Changes from v1
- Add Acked-by line from Rob Herring
- Rename local variable 'cdce925_regmap_config' to 'config',
  suggested by Stephen Boyd

 .../devicetree/bindings/clock/ti,cdce925.txt       |  15 ++-
 drivers/clk/Kconfig                                |  11 ++-
 drivers/clk/clk-cdce925.c                          | 108 ++++++++++++++++-----
 3 files changed, 100 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce925.txt b/Documentation/devicetree/bindings/clock/ti,cdce925.txt
index 4c7669a..0d01f2d 100644
--- a/Documentation/devicetree/bindings/clock/ti,cdce925.txt
+++ b/Documentation/devicetree/bindings/clock/ti,cdce925.txt
@@ -1,15 +1,22 @@
-Binding for TO CDCE925 programmable I2C clock synthesizers.
+Binding for TI CDCE913/925/937/949 programmable I2C clock synthesizers.
 
 Reference
 This binding uses the common clock binding[1].
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] http://www.ti.com/product/cdce925
+[2] http://www.ti.com/product/cdce913
+[3] http://www.ti.com/product/cdce925
+[4] http://www.ti.com/product/cdce937
+[5] http://www.ti.com/product/cdce949
 
 The driver provides clock sources for each output Y1 through Y5.
 
 Required properties:
- - compatible: Shall be "ti,cdce925"
+ - compatible: Shall be one of the following:
+	- "ti,cdce913": 1-PLL, 3 Outputs
+	- "ti,cdce925": 2-PLL, 5 Outputs
+	- "ti,cdce937": 3-PLL, 7 Outputs
+	- "ti,cdce949": 4-PLL, 9 Outputs
  - reg: I2C device address.
  - clocks: Points to a fixed parent clock that provides the input frequency.
  - #clock-cells: From common clock bindings: Shall be 1.
@@ -18,7 +25,7 @@ Optional properties:
  - xtal-load-pf: Crystal load-capacitor value to fine-tune performance on a
                  board, or to compensate for external influences.
 
-For both PLL1 and PLL2 an optional child node can be used to specify spread
+For all PLL1, PLL2, ... an optional child node can be used to specify spread
 spectrum clocking parameters for a board.
   - spread-spectrum: SSC mode as defined in the data sheet.
   - spread-spectrum-center: Use "centered" mode instead of "max" mode. When
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index d051edd..8f67dc9 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -104,16 +104,17 @@ config COMMON_CLK_CDCE706
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
 config COMMON_CLK_CDCE925
-	tristate "Clock driver for TI CDCE925 devices"
+	tristate "Clock driver for TI CDCE913/925/937/949 devices"
 	depends on I2C
 	depends on OF
 	select REGMAP_I2C
 	help
 	---help---
-	  This driver supports the TI CDCE925 programmable clock synthesizer.
-	  The chip contains two PLLs with spread-spectrum clocking support and
-	  five output dividers. The driver only supports the following setup,
-	  and uses a fixed setting for the output muxes.
+	  This driver supports the TI CDCE913/925/937/949 programmable clock
+	  synthesizer. Each chip has different number of PLLs and outputs.
+	  For example, the CDCE925 contains two PLLs with spread-spectrum
+	  clocking support and five output dividers. The driver only supports
+	  the following setup, and uses a fixed setting for the output muxes.
 	  Y1 is derived from the input clock
 	  Y2 and Y3 derive from PLL1
 	  Y4 and Y5 derive from PLL2
diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index f793b2d..c933be0 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -1,8 +1,8 @@
 /*
- * Driver for TI Dual PLL CDCE925 clock synthesizer
+ * Driver for TI Multi PLL CDCE913/925/937/949 clock synthesizer
  *
- * This driver always connects the Y1 to the input clock, Y2/Y3 to PLL1
- * and Y4/Y5 to PLL2. PLL frequency is set on a first-come-first-serve
+ * This driver always connects the Y1 to the input clock, Y2/Y3 to PLL1,
+ * Y4/Y5 to PLL2, and so on. PLL frequency is set on a first-come-first-serve
  * basis. Clients can directly request any frequency that the chip can
  * deliver using the standard clk framework. In addition, the device can
  * be configured and activated via the devicetree.
@@ -19,11 +19,32 @@
 #include <linux/slab.h>
 #include <linux/gcd.h>
 
-/* The chip has 2 PLLs which can be routed through dividers to 5 outputs.
+/* Each chip has different number of PLLs and outputs, for example:
+ * The CECE925 has 2 PLLs which can be routed through dividers to 5 outputs.
  * Model this as 2 PLL clocks which are parents to the outputs.
  */
-#define NUMBER_OF_PLLS	2
-#define NUMBER_OF_OUTPUTS	5
+
+enum {
+	CDCE913,
+	CDCE925,
+	CDCE937,
+	CDCE949,
+};
+
+struct clk_cdce925_chip_info {
+	int num_plls;
+	int num_outputs;
+};
+
+static const struct clk_cdce925_chip_info clk_cdce925_chip_info_tbl[] = {
+	[CDCE913] = { .num_plls = 1, .num_outputs = 3 },
+	[CDCE925] = { .num_plls = 2, .num_outputs = 5 },
+	[CDCE937] = { .num_plls = 3, .num_outputs = 7 },
+	[CDCE949] = { .num_plls = 4, .num_outputs = 9 },
+};
+
+#define MAX_NUMBER_OF_PLLS	4
+#define MAX_NUMBER_OF_OUTPUTS	9
 
 #define CDCE925_REG_GLOBAL1	0x01
 #define CDCE925_REG_Y1SPIPDIVH	0x02
@@ -43,7 +64,7 @@ struct clk_cdce925_output {
 	struct clk_hw hw;
 	struct clk_cdce925_chip *chip;
 	u8 index;
-	u16 pdiv; /* 1..127 for Y2-Y5; 1..1023 for Y1 */
+	u16 pdiv; /* 1..127 for Y2-Y9; 1..1023 for Y1 */
 };
 #define to_clk_cdce925_output(_hw) \
 	container_of(_hw, struct clk_cdce925_output, hw)
@@ -60,8 +81,9 @@ struct clk_cdce925_pll {
 struct clk_cdce925_chip {
 	struct regmap *regmap;
 	struct i2c_client *i2c_client;
-	struct clk_cdce925_pll pll[NUMBER_OF_PLLS];
-	struct clk_cdce925_output clk[NUMBER_OF_OUTPUTS];
+	const struct clk_cdce925_chip_info *chip_info;
+	struct clk_cdce925_pll pll[MAX_NUMBER_OF_PLLS];
+	struct clk_cdce925_output clk[MAX_NUMBER_OF_OUTPUTS];
 };
 
 /* ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** */
@@ -284,6 +306,18 @@ static void cdce925_clk_set_pdiv(struct clk_cdce925_output *data, u16 pdiv)
 	case 4:
 		regmap_update_bits(data->chip->regmap, 0x27, 0x7F, pdiv);
 		break;
+	case 5:
+		regmap_update_bits(data->chip->regmap, 0x36, 0x7F, pdiv);
+		break;
+	case 6:
+		regmap_update_bits(data->chip->regmap, 0x37, 0x7F, pdiv);
+		break;
+	case 7:
+		regmap_update_bits(data->chip->regmap, 0x46, 0x7F, pdiv);
+		break;
+	case 8:
+		regmap_update_bits(data->chip->regmap, 0x47, 0x7F, pdiv);
+		break;
 	}
 }
 
@@ -302,6 +336,14 @@ static void cdce925_clk_activate(struct clk_cdce925_output *data)
 	case 4:
 		regmap_update_bits(data->chip->regmap, 0x24, 0x03, 0x03);
 		break;
+	case 5:
+	case 6:
+		regmap_update_bits(data->chip->regmap, 0x34, 0x03, 0x03);
+		break;
+	case 7:
+	case 8:
+		regmap_update_bits(data->chip->regmap, 0x44, 0x03, 0x03);
+		break;
 	}
 }
 
@@ -474,15 +516,6 @@ static const struct clk_ops cdce925_clk_y1_ops = {
 	.set_rate = cdce925_clk_y1_set_rate,
 };
 
-
-static struct regmap_config cdce925_regmap_config = {
-	.name = "configuration0",
-	.reg_bits = 8,
-	.val_bits = 8,
-	.cache_type = REGCACHE_RBTREE,
-	.max_register = 0x2F,
-};
-
 #define CDCE925_I2C_COMMAND_BLOCK_TRANSFER	0x00
 #define CDCE925_I2C_COMMAND_BYTE_TRANSFER	0x80
 
@@ -582,13 +615,19 @@ static int cdce925_probe(struct i2c_client *client,
 	struct clk_cdce925_chip *data;
 	struct device_node *node = client->dev.of_node;
 	const char *parent_name;
-	const char *pll_clk_name[NUMBER_OF_PLLS] = {NULL,};
+	const char *pll_clk_name[MAX_NUMBER_OF_PLLS] = {NULL,};
 	struct clk_init_data init;
 	u32 value;
 	int i;
 	int err;
 	struct device_node *np_output;
 	char child_name[6];
+	struct regmap_config config = {
+		.name = "configuration0",
+		.reg_bits = 8,
+		.val_bits = 8,
+		.cache_type = REGCACHE_RBTREE,
+	};
 
 	dev_dbg(&client->dev, "%s\n", __func__);
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
@@ -596,8 +635,11 @@ static int cdce925_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	data->i2c_client = client;
+	data->chip_info = &clk_cdce925_chip_info_tbl[id->driver_data];
+	config.max_register = CDCE925_OFFSET_PLL +
+		data->chip_info->num_plls * 0x10 - 1;
 	data->regmap = devm_regmap_init(&client->dev, &regmap_cdce925_bus,
-			&client->dev, &cdce925_regmap_config);
+			&client->dev, &config);
 	if (IS_ERR(data->regmap)) {
 		dev_err(&client->dev, "failed to allocate register map\n");
 		return PTR_ERR(data->regmap);
@@ -626,7 +668,7 @@ static int cdce925_probe(struct i2c_client *client,
 	init.num_parents = parent_name ? 1 : 0;
 
 	/* Register PLL clocks */
-	for (i = 0; i < NUMBER_OF_PLLS; ++i) {
+	for (i = 0; i < data->chip_info->num_plls; ++i) {
 		pll_clk_name[i] = kasprintf(GFP_KERNEL, "%s.pll%d",
 			client->dev.of_node->name, i);
 		init.name = pll_clk_name[i];
@@ -684,7 +726,7 @@ static int cdce925_probe(struct i2c_client *client,
 	init.ops = &cdce925_clk_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.num_parents = 1;
-	for (i = 1; i < NUMBER_OF_OUTPUTS; ++i) {
+	for (i = 1; i < data->chip_info->num_outputs; ++i) {
 		init.name = kasprintf(GFP_KERNEL, "%s.Y%d",
 			client->dev.of_node->name, i+1);
 		data->clk[i].chip = data;
@@ -702,6 +744,16 @@ static int cdce925_probe(struct i2c_client *client,
 			/* Mux Y4/5 to PLL2 */
 			init.parent_names = &pll_clk_name[1];
 			break;
+		case 5:
+		case 6:
+			/* Mux Y6/7 to PLL3 */
+			init.parent_names = &pll_clk_name[2];
+			break;
+		case 7:
+		case 8:
+			/* Mux Y8/9 to PLL4 */
+			init.parent_names = &pll_clk_name[3];
+			break;
 		}
 		err = devm_clk_hw_register(&client->dev, &data->clk[i].hw);
 		kfree(init.name); /* clock framework made a copy of the name */
@@ -720,7 +772,7 @@ static int cdce925_probe(struct i2c_client *client,
 	err = 0;
 
 error:
-	for (i = 0; i < NUMBER_OF_PLLS; ++i)
+	for (i = 0; i < data->chip_info->num_plls; ++i)
 		/* clock framework made a copy of the name */
 		kfree(pll_clk_name[i]);
 
@@ -728,13 +780,19 @@ static int cdce925_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id cdce925_id[] = {
-	{ "cdce925", 0 },
+	{ "cdce913", CDCE913 },
+	{ "cdce925", CDCE925 },
+	{ "cdce937", CDCE937 },
+	{ "cdce949", CDCE949 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cdce925_id);
 
 static const struct of_device_id clk_cdce925_of_match[] = {
+	{ .compatible = "ti,cdce913" },
 	{ .compatible = "ti,cdce925" },
+	{ .compatible = "ti,cdce937" },
+	{ .compatible = "ti,cdce949" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_cdce925_of_match);
@@ -750,5 +808,5 @@ static struct i2c_driver cdce925_driver = {
 module_i2c_driver(cdce925_driver);
 
 MODULE_AUTHOR("Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>");
-MODULE_DESCRIPTION("cdce925 driver");
+MODULE_DESCRIPTION("TI CDCE913/925/937/949 driver");
 MODULE_LICENSE("GPL");
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
