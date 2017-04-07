From: Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH v4 1/3] clk: vc5: Add structure to describe particular chip features
Date: Fri, 7 Apr 2017 12:12:22 +0300
Message-ID: <1491556344-9465-2-git-send-email-alexey_firago@mentor.com>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, marek.vasut@gmail.com, geert@linux-m68k.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Alexey Firago <alexey_firago@mentor.com>
List-Id: devicetree@vger.kernel.org

Introduce vc5_chip_info structure to describe features of a particular
VC5 chip (id, number of FODs, number of outputs, flags).
For now flags are only used to indicate if chip has internal XTAL.
vc5_chip_info is set on probe from the matched of_device_id->data.

Also add defines to specify maximum number of FODs and clock outputs
supported by the driver.

With these changes it should be easier to extend driver to support
more VC5 models.

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 drivers/clk/clk-versaclock5.c | 65 +++++++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 56741f3..2b1cc69 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -113,12 +113,30 @@
 #define VC5_MUX_IN_XIN		BIT(0)
 #define VC5_MUX_IN_CLKIN	BIT(1)
 
+/* Maximum number of clk_out supported by this driver */
+#define VC5_MAX_CLK_OUT_NUM	3
+
+/* Maximum number of FODs supported by this driver */
+#define VC5_MAX_FOD_NUM	2
+
+/* flags to describe chip features */
+/* chip has built-in oscilator */
+#define VC5_HAS_INTERNAL_XTAL	BIT(0)
+
 /* Supported IDT VC5 models. */
 enum vc5_model {
 	IDT_VC5_5P49V5923,
 	IDT_VC5_5P49V5933,
 };
 
+/* Structure to describe features of a particular VC5 model */
+struct vc5_chip_info {
+	const enum vc5_model	model;
+	const unsigned int	clk_fod_cnt;
+	const unsigned int	clk_out_cnt;
+	const u32		flags;
+};
+
 struct vc5_driver_data;
 
 struct vc5_hw_data {
@@ -132,15 +150,15 @@ struct vc5_hw_data {
 struct vc5_driver_data {
 	struct i2c_client	*client;
 	struct regmap		*regmap;
-	enum vc5_model		model;
+	const struct vc5_chip_info	*chip_info;
 
 	struct clk		*pin_xin;
 	struct clk		*pin_clkin;
 	unsigned char		clk_mux_ins;
 	struct clk_hw		clk_mux;
 	struct vc5_hw_data	clk_pll;
-	struct vc5_hw_data	clk_fod[2];
-	struct vc5_hw_data	clk_out[3];
+	struct vc5_hw_data	clk_fod[VC5_MAX_FOD_NUM];
+	struct vc5_hw_data	clk_out[VC5_MAX_CLK_OUT_NUM];
 };
 
 static const char * const vc5_mux_names[] = {
@@ -563,7 +581,7 @@ static struct clk_hw *vc5_of_clk_get(struct of_phandle_args *clkspec,
 	struct vc5_driver_data *vc5 = data;
 	unsigned int idx = clkspec->args[0];
 
-	if (idx > 2)
+	if (idx >= vc5->chip_info->clk_out_cnt)
 		return ERR_PTR(-EINVAL);
 
 	return &vc5->clk_out[idx].hw;
@@ -586,12 +604,10 @@ static const struct of_device_id clk_vc5_of_match[];
 static int vc5_probe(struct i2c_client *client,
 		     const struct i2c_device_id *id)
 {
-	const struct of_device_id *of_id =
-		of_match_device(clk_vc5_of_match, &client->dev);
 	struct vc5_driver_data *vc5;
 	struct clk_init_data init;
 	const char *parent_names[2];
-	unsigned int n, idx;
+	unsigned int n, idx = 0;
 	int ret;
 
 	vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
@@ -600,7 +616,7 @@ static int vc5_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, vc5);
 	vc5->client = client;
-	vc5->model = (enum vc5_model)of_id->data;
+	vc5->chip_info = of_device_get_match_data(&client->dev);
 
 	vc5->pin_xin = devm_clk_get(&client->dev, "xin");
 	if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
@@ -622,8 +638,7 @@ static int vc5_probe(struct i2c_client *client,
 	if (!IS_ERR(vc5->pin_xin)) {
 		vc5->clk_mux_ins |= VC5_MUX_IN_XIN;
 		parent_names[init.num_parents++] = __clk_get_name(vc5->pin_xin);
-	} else if (vc5->model == IDT_VC5_5P49V5933) {
-		/* IDT VC5 5P49V5933 has built-in oscilator. */
+	} else if (vc5->chip_info->flags & VC5_HAS_INTERNAL_XTAL) {
 		vc5->pin_xin = clk_register_fixed_rate(&client->dev,
 						       "internal-xtal", NULL,
 						       0, 25000000);
@@ -672,8 +687,8 @@ static int vc5_probe(struct i2c_client *client,
 	}
 
 	/* Register FODs */
-	for (n = 0; n < 2; n++) {
-		idx = vc5_map_index_to_output(vc5->model, n);
+	for (n = 0; n < vc5->chip_info->clk_fod_cnt; n++) {
+		idx = vc5_map_index_to_output(vc5->chip_info->model, n);
 		memset(&init, 0, sizeof(init));
 		init.name = vc5_fod_names[idx];
 		init.ops = &vc5_fod_ops;
@@ -709,8 +724,8 @@ static int vc5_probe(struct i2c_client *client,
 	}
 
 	/* Register FOD-connected OUTx outputs */
-	for (n = 1; n < 3; n++) {
-		idx = vc5_map_index_to_output(vc5->model, n - 1);
+	for (n = 1; n < vc5->chip_info->clk_out_cnt; n++) {
+		idx = vc5_map_index_to_output(vc5->chip_info->model, n - 1);
 		parent_names[0] = vc5_fod_names[idx];
 		if (n == 1)
 			parent_names[1] = vc5_mux_names[0];
@@ -744,7 +759,7 @@ static int vc5_probe(struct i2c_client *client,
 	return 0;
 
 err_clk:
-	if (vc5->model == IDT_VC5_5P49V5933)
+	if (vc5->chip_info->flags & VC5_HAS_INTERNAL_XTAL)
 		clk_unregister_fixed_rate(vc5->pin_xin);
 	return ret;
 }
@@ -755,12 +770,26 @@ static int vc5_remove(struct i2c_client *client)
 
 	of_clk_del_provider(client->dev.of_node);
 
-	if (vc5->model == IDT_VC5_5P49V5933)
+	if (vc5->chip_info->flags & VC5_HAS_INTERNAL_XTAL)
 		clk_unregister_fixed_rate(vc5->pin_xin);
 
 	return 0;
 }
 
+static const struct vc5_chip_info idt_5p49v5923_info = {
+	.model = IDT_VC5_5P49V5923,
+	.clk_fod_cnt = 2,
+	.clk_out_cnt = 3,
+	.flags = 0,
+};
+
+static const struct vc5_chip_info idt_5p49v5933_info = {
+	.model = IDT_VC5_5P49V5933,
+	.clk_fod_cnt = 2,
+	.clk_out_cnt = 3,
+	.flags = VC5_HAS_INTERNAL_XTAL,
+};
+
 static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
 	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
@@ -769,8 +798,8 @@ static const struct i2c_device_id vc5_id[] = {
 MODULE_DEVICE_TABLE(i2c, vc5_id);
 
 static const struct of_device_id clk_vc5_of_match[] = {
-	{ .compatible = "idt,5p49v5923", .data = (void *)IDT_VC5_5P49V5923 },
-	{ .compatible = "idt,5p49v5933", .data = (void *)IDT_VC5_5P49V5933 },
+	{ .compatible = "idt,5p49v5923", .data = &idt_5p49v5923_info },
+	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
-- 
2.7.4

