From: Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH 2/2] clk: vc5: Add support for IDT VersaClock 5P49V5935
Date: Tue, 4 Apr 2017 16:16:28 +0300
Message-ID: <1491311788-31905-3-git-send-email-alexey_firago@mentor.com>
References: <1491311788-31905-1-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1491311788-31905-1-git-send-email-alexey_firago@mentor.com>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, marek.vasut@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Alexey Firago <alexey_firago@mentor.com>
List-Id: devicetree@vger.kernel.org

Update IDT VersaClock 5 driver to support 5P49V5935. This chip has
two clock inputs (internal XTAL or external CLKIN), four fractional
dividers (FODs) and five clock outputs (four universal clock outputs
and one reference clock output at OUT0_SELB_I2C).

Current driver supports up to 2 FODs and up to 3 clock outputs.
This patch sets max number of supported FODs to 4 and max number
of supported clocks to 5.

Number of used FODs and clock outputs is set on probe according to
the model specified via device-tree.

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 drivers/clk/clk-versaclock5.c | 50 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 56741f3..f74d6e4 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -113,10 +113,17 @@
 #define VC5_MUX_IN_XIN		BIT(0)
 #define VC5_MUX_IN_CLKIN	BIT(1)
 
+/* Maximum number of clk_out supported by this driver */
+#define VC5_MAX_CLK_OUT_NUM	5
+
+/* Maximum number of FODs supported by this driver */
+#define VC5_MAX_FOD_NUM		4
+
 /* Supported IDT VC5 models. */
 enum vc5_model {
 	IDT_VC5_5P49V5923,
 	IDT_VC5_5P49V5933,
+	IDT_VC5_5P49V5935,
 };
 
 struct vc5_driver_data;
@@ -139,8 +146,10 @@ struct vc5_driver_data {
 	unsigned char		clk_mux_ins;
 	struct clk_hw		clk_mux;
 	struct vc5_hw_data	clk_pll;
-	struct vc5_hw_data	clk_fod[2];
-	struct vc5_hw_data	clk_out[3];
+	int			clk_fod_cnt;
+	struct vc5_hw_data	clk_fod[VC5_MAX_FOD_NUM];
+	int			clk_out_cnt;
+	struct vc5_hw_data	clk_out[VC5_MAX_CLK_OUT_NUM];
 };
 
 static const char * const vc5_mux_names[] = {
@@ -563,7 +572,7 @@ static struct clk_hw *vc5_of_clk_get(struct of_phandle_args *clkspec,
 	struct vc5_driver_data *vc5 = data;
 	unsigned int idx = clkspec->args[0];
 
-	if (idx > 2)
+	if (idx > vc5->clk_out_cnt)
 		return ERR_PTR(-EINVAL);
 
 	return &vc5->clk_out[idx].hw;
@@ -576,6 +585,7 @@ static int vc5_map_index_to_output(const enum vc5_model model,
 	case IDT_VC5_5P49V5933:
 		return (n == 0) ? 0 : 3;
 	case IDT_VC5_5P49V5923:
+	case IDT_VC5_5P49V5935:
 	default:
 		return n;
 	}
@@ -591,7 +601,7 @@ static int vc5_probe(struct i2c_client *client,
 	struct vc5_driver_data *vc5;
 	struct clk_init_data init;
 	const char *parent_names[2];
-	unsigned int n, idx;
+	unsigned int n, idx = 0;
 	int ret;
 
 	vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
@@ -602,6 +612,23 @@ static int vc5_probe(struct i2c_client *client,
 	vc5->client = client;
 	vc5->model = (enum vc5_model)of_id->data;
 
+	/* Set number of supported outputs according to the repoted model */
+	switch (vc5->model) {
+	case IDT_VC5_5P49V5923:
+	case IDT_VC5_5P49V5933:
+		vc5->clk_fod_cnt = 2;
+		vc5->clk_out_cnt = 3;
+		break;
+	case IDT_VC5_5P49V5935:
+		vc5->clk_fod_cnt = 4;
+		vc5->clk_out_cnt = 5;
+		break;
+	default:
+		/* Should never go here */
+		dev_err(&client->dev, "unsupported IDT VC5 ID specified\n");
+		return -EINVAL;
+	}
+
 	vc5->pin_xin = devm_clk_get(&client->dev, "xin");
 	if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
@@ -622,8 +649,9 @@ static int vc5_probe(struct i2c_client *client,
 	if (!IS_ERR(vc5->pin_xin)) {
 		vc5->clk_mux_ins |= VC5_MUX_IN_XIN;
 		parent_names[init.num_parents++] = __clk_get_name(vc5->pin_xin);
-	} else if (vc5->model == IDT_VC5_5P49V5933) {
-		/* IDT VC5 5P49V5933 has built-in oscilator. */
+	} else if (vc5->model == IDT_VC5_5P49V5933 ||
+		   vc5->model == IDT_VC5_5P49V5935) {
+		/* IDT VC5 5P49V5933 and 5P49V5935 have built-in oscilator. */
 		vc5->pin_xin = clk_register_fixed_rate(&client->dev,
 						       "internal-xtal", NULL,
 						       0, 25000000);
@@ -672,7 +700,7 @@ static int vc5_probe(struct i2c_client *client,
 	}
 
 	/* Register FODs */
-	for (n = 0; n < 2; n++) {
+	for (n = 0; n < vc5->clk_fod_cnt; n++) {
 		idx = vc5_map_index_to_output(vc5->model, n);
 		memset(&init, 0, sizeof(init));
 		init.name = vc5_fod_names[idx];
@@ -709,7 +737,7 @@ static int vc5_probe(struct i2c_client *client,
 	}
 
 	/* Register FOD-connected OUTx outputs */
-	for (n = 1; n < 3; n++) {
+	for (n = 1; n < vc5->clk_out_cnt; n++) {
 		idx = vc5_map_index_to_output(vc5->model, n - 1);
 		parent_names[0] = vc5_fod_names[idx];
 		if (n == 1)
@@ -744,7 +772,7 @@ static int vc5_probe(struct i2c_client *client,
 	return 0;
 
 err_clk:
-	if (vc5->model == IDT_VC5_5P49V5933)
+	if (vc5->model == IDT_VC5_5P49V5933 || vc5->model == IDT_VC5_5P49V5935)
 		clk_unregister_fixed_rate(vc5->pin_xin);
 	return ret;
 }
@@ -755,7 +783,7 @@ static int vc5_remove(struct i2c_client *client)
 
 	of_clk_del_provider(client->dev.of_node);
 
-	if (vc5->model == IDT_VC5_5P49V5933)
+	if (vc5->model == IDT_VC5_5P49V5933 || vc5->model == IDT_VC5_5P49V5935)
 		clk_unregister_fixed_rate(vc5->pin_xin);
 
 	return 0;
@@ -764,6 +792,7 @@ static int vc5_remove(struct i2c_client *client)
 static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
 	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
+	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vc5_id);
@@ -771,6 +800,7 @@ MODULE_DEVICE_TABLE(i2c, vc5_id);
 static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5923", .data = (void *)IDT_VC5_5P49V5923 },
 	{ .compatible = "idt,5p49v5933", .data = (void *)IDT_VC5_5P49V5933 },
+	{ .compatible = "idt,5p49v5935", .data = (void *)IDT_VC5_5P49V5935 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
-- 
2.7.4

