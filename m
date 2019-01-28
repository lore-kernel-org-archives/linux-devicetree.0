From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH v2 05/14] clk: qcom: apcs-msm8916: get parent clock names from DT
Date: Mon, 28 Jan 2019 19:32:52 +0100
Message-ID: <1548700381-22376-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, sibis@codeaurora.org, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net
Cc: vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

Allow accessing the parent clock names required for the driver
operation by using the device tree node.

This permits extending the driver to other platforms without having to
modify its source code.

For backwards compatibility leave previous values as default.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/clk/qcom/apcs-msm8916.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index a6c89a3..987ee00 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -19,7 +19,7 @@
 
 static const u32 gpll0_a53cc_map[] = { 4, 5 };
 
-static const char * const gpll0_a53cc[] = {
+static const char *gpll0_a53cc[] = {
 	"gpll0_vote",
 	"a53pll",
 };
@@ -50,6 +50,10 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct clk_init_data init = { };
 	int ret = -ENODEV;
+	struct clk_bulk_data pclks[] = {
+		[0] = { .id = "aux", .clk = NULL },
+		[1] = { .id = "pll", .clk = NULL },
+	};
 
 	regmap = dev_get_regmap(parent, NULL);
 	if (!regmap) {
@@ -61,6 +65,25 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	if (!a53cc)
 		return -ENOMEM;
 
+	/* check if the parent names are present in the device tree */
+	ret = devm_clk_bulk_get(parent, ARRAY_SIZE(pclks), pclks);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+
+	if (!ret) {
+		gpll0_a53cc[0] = __clk_get_name(pclks[0].clk);
+		gpll0_a53cc[1] = __clk_get_name(pclks[1].clk);
+		a53cc->pclk = pclks[1].clk;
+	} else {
+		/* support old binding where only pll was explicitily defined */
+		a53cc->pclk = devm_clk_get(parent, NULL);
+		if (IS_ERR(a53cc->pclk)) {
+			ret = PTR_ERR(a53cc->pclk);
+			dev_err(dev, "failed to get clk: %d\n", ret);
+			return ret;
+		}
+	}
+
 	init.name = "a53mux";
 	init.parent_names = gpll0_a53cc;
 	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
@@ -76,13 +99,6 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	a53cc->src_shift = 8;
 	a53cc->parent_map = gpll0_a53cc_map;
 
-	a53cc->pclk = devm_clk_get(parent, NULL);
-	if (IS_ERR(a53cc->pclk)) {
-		ret = PTR_ERR(a53cc->pclk);
-		dev_err(dev, "failed to get clk: %d\n", ret);
-		return ret;
-	}
-
 	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
 	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
 	if (ret) {
-- 
2.7.4
