From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v8 3/3] mailbox: qcom: Add support for APCS clock controller
Date: Fri, 23 Jun 2017 19:15:33 +0300
Message-ID: <20170623161533.20449-4-georgi.djakov@linaro.org>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170623161533.20449-1-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a driver for the APCS clock controller. It is part of the APCS
hardware block, which among other things implements also a combined
mux and half integer divider functionality. It can choose between a
fixed-rate clock or the dedicated APCS (A53) PLL. The source and the
divider can be set both at the same time.

This is required for enabling CPU frequency scaling on MSM8916-based
platforms.

Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.txt     |   5 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            | 122 +++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index fb961c310f44..2432be307083 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -21,6 +21,11 @@ platforms.
 	Value type: <u32>
 	Definition: as described in mailbox.txt, must be 1
 
+- #clock-cells:
+	Usage: required for msm8916 platforms
+	Value type: <u32>
+	Definition: as described in clock-bindings.txt, must be 0
+
 
 = EXAMPLE
 The following example describes the APCS HMSS found in MSM8996 and part of the
diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 9924c6d7f05d..da363c6580da 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -11,6 +11,8 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/io.h>
@@ -19,6 +21,34 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/mailbox_controller.h>
+#include <linux/regmap.h>
+
+#include "../clk/qcom/clk-regmap.h"
+#include "../clk/qcom/clk-regmap-mux-div.h"
+
+enum {
+	P_GPLL0,
+	P_A53PLL,
+};
+
+static const struct parent_map gpll0_a53cc_map[] = {
+	{ P_GPLL0, 4 },
+	{ P_A53PLL, 5 },
+};
+
+static const char * const gpll0_a53cc[] = {
+	"gpll0_vote",
+	"a53pll",
+};
+
+static const struct regmap_config a53cc_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x1000,
+	.fast_io		= true,
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
+};
 
 #define QCOM_APCS_IPC_BITS	32
 
@@ -45,8 +75,93 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
 	.send_data = qcom_apcs_ipc_send_data,
 };
 
+/*
+ * We use the notifier function for switching to a temporary safe configuration
+ * (mux and divider), while the A53 PLL is reconfigured.
+ */
+static int a53cc_notifier_cb(struct notifier_block *nb, unsigned long event,
+			     void *data)
+{
+	int ret = 0;
+	struct clk_regmap_mux_div *md = container_of(nb,
+						     struct clk_regmap_mux_div,
+						     clk_nb);
+	if (event == PRE_RATE_CHANGE)
+		/* set the mux and divider to safe frequency (400mhz) */
+		ret = __mux_div_set_src_div(md, 4, 3);
+
+	return notifier_from_errno(ret);
+}
+
+static int msm8916_register_clk(struct device *dev, void __iomem *base)
+{
+	struct clk_regmap_mux_div *a53cc;
+	struct clk *pclk;
+	struct regmap *regmap;
+	struct clk_init_data init = { };
+	int ret;
+
+	a53cc = devm_kzalloc(dev, sizeof(*a53cc), GFP_KERNEL);
+	if (!a53cc)
+		return -ENOMEM;
+
+	a53cc->reg_offset = 0x50;
+	a53cc->hid_width = 5;
+	a53cc->hid_shift = 0;
+	a53cc->src_width = 3;
+	a53cc->src_shift = 8;
+	a53cc->parent_map = gpll0_a53cc_map;
+
+	init.name = "a53mux";
+	init.parent_names = gpll0_a53cc;
+	init.num_parents = 2;
+	init.ops = &clk_regmap_mux_div_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	a53cc->clkr.hw.init = &init;
+
+	pclk = __clk_lookup(gpll0_a53cc[1]);
+	if (!pclk)
+		return -EPROBE_DEFER;
+
+	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
+	ret = clk_notifier_register(pclk, &a53cc->clk_nb);
+	if (ret) {
+		dev_err(dev, "failed to register clock notifier: %d\n", ret);
+		return ret;
+	}
+
+	regmap = devm_regmap_init_mmio(dev, base, &a53cc_regmap_config);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		dev_err(dev, "failed to init regmap mmio: %d\n", ret);
+		goto err;
+	}
+
+	a53cc->clkr.regmap = regmap;
+
+	ret = devm_clk_register_regmap(dev, &a53cc->clkr);
+	if (ret) {
+		dev_err(dev, "failed to register regmap clock: %d\n", ret);
+		goto err;
+	}
+
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
+				     &a53cc->clkr.hw);
+	if (ret) {
+		dev_err(dev, "failed to add clock provider: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	clk_notifier_unregister(pclk, &a53cc->clk_nb);
+	return ret;
+}
+
 static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct qcom_apcs_ipc *apcs;
 	struct resource *res;
 	unsigned long offset;
@@ -63,6 +178,13 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
+		/* register the APCS mux and divider clock */
+		ret = msm8916_register_clk(&pdev->dev, base);
+		if (ret)
+			return ret;
+	}
+
 	offset = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	apcs->reg = base + offset;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
