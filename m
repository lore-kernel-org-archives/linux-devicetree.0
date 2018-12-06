From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH v3 3/3] bus: imx-weim: guard against timing configuration conflicts
Date: Thu,  6 Dec 2018 14:26:33 -0500
Message-ID: <20181206192633.25319-4-TheSven73@googlemail.com>
References: <20181206192633.25319-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206192633.25319-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: TheSven73@googlemail.com, Shawn Guo <shawnguo@kernel.org>, Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When specifying weim child devices, there is a risk that more than
one timing setting is specified for the same chip select.

The driver cannot support such a configuration.

In case of conflict, this patch will print a warning to the log,
and will ignore the child node in question.

In this example, node acme@1 will be ignored, as it tries to modify
timing settings for CS0:

&weim {
	acme@0 {
		compatible = "acme,whatever";
		reg = <0 0 0x100>;
		fsl,weim-cs-timing = <something>;
	};
	acme@1 {
		compatible = "acme,whatnot";
		reg = <0 0x500 0x100>;
		fsl,weim-cs-timing = <something else>;
	};
};

However in this example, the driver will be happy:

&weim {
        acme@0 {
                compatible = "acme,whatever";
                reg = <0 0 0x100>;
                fsl,weim-cs-timing = <something>;
        };
        acme@1 {
                compatible = "acme,whatnot";
                reg = <0 0x500 0x100>;
                fsl,weim-cs-timing = <something>;
        };
};

Signed-off-by: Sven Van Asbroeck <TheSven73@googlemail.com>
---
 drivers/bus/imx-weim.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 5452d22d1bd8..dfe74b8c512a 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -46,8 +46,18 @@ static const struct imx_weim_devtype imx51_weim_devtype = {
 };
 
 #define MAX_CS_REGS_COUNT	6
+#define MAX_CS_REGS		6
 #define OF_REG_SIZE		3
 
+struct cs_timing {
+	bool is_applied;
+	u32 regs[MAX_CS_REGS_COUNT];
+};
+
+struct cs_timing_state {
+	struct cs_timing cs[MAX_CS_REGS];
+};
+
 static const struct of_device_id weim_id_table[] = {
 	/* i.MX1/21 */
 	{ .compatible = "fsl,imx1-weim", .data = &imx1_weim_devtype, },
@@ -112,11 +122,14 @@ static int __init imx_weim_gpr_setup(struct platform_device *pdev)
 }
 
 /* Parse and set the timing for this device. */
-static int __init weim_timing_setup(struct device_node *np, void __iomem *base,
-				    const struct imx_weim_devtype *devtype)
+static int __init weim_timing_setup(struct device *dev,
+				    struct device_node *np, void __iomem *base,
+				    const struct imx_weim_devtype *devtype,
+				    struct cs_timing_state *ts)
 {
 	u32 cs_idx, value[MAX_CS_REGS_COUNT];
 	int i, ret, reg_idx, num_regs;
+	struct cs_timing *cst;
 
 	if (WARN_ON(devtype->cs_regs_count > MAX_CS_REGS_COUNT))
 		return -EINVAL;
@@ -145,10 +158,23 @@ static int __init weim_timing_setup(struct device_node *np, void __iomem *base,
 		if (cs_idx >= devtype->cs_count)
 			return -EINVAL;
 
+		/* prevent re-configuring a CS that's already been configured */
+		cst = &ts->cs[cs_idx];
+		if (cst->is_applied && memcmp(value, cst->regs,
+					devtype->cs_regs_count*sizeof(u32))) {
+			dev_err(dev, "fsl,weim-cs-timing conflict on %pOF", np);
+			return -EINVAL;
+		}
+
 		/* set the timing for WEIM */
 		for (i = 0; i < devtype->cs_regs_count; i++)
 			writel(value[i],
 				base + cs_idx * devtype->cs_stride + i * 4);
+		if (!cst->is_applied) {
+			cst->is_applied = true;
+			memcpy(cst->regs, value,
+				devtype->cs_regs_count*sizeof(u32));
+		}
 	}
 
 	return 0;
@@ -162,6 +188,7 @@ static int __init weim_parse_dt(struct platform_device *pdev,
 	const struct imx_weim_devtype *devtype = of_id->data;
 	struct device_node *child;
 	int ret, have_child = 0;
+	struct cs_timing_state ts = {};
 
 	if (devtype == &imx50_weim_devtype) {
 		ret = imx_weim_gpr_setup(pdev);
@@ -170,7 +197,7 @@ static int __init weim_parse_dt(struct platform_device *pdev,
 	}
 
 	for_each_available_child_of_node(pdev->dev.of_node, child) {
-		ret = weim_timing_setup(child, base, devtype);
+		ret = weim_timing_setup(&pdev->dev, child, base, devtype, &ts);
 		if (ret)
 			dev_warn(&pdev->dev, "%pOF set timing failed.\n",
 				child);
-- 
2.17.1
