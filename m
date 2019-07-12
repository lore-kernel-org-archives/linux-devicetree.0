From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH 1/2] bus: imx-weim: optionally enable burst clock mode
Date: Fri, 12 Jul 2019 16:43:15 -0400
Message-ID: <20190712204316.16783-1-TheSven73@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

To enable burst clock mode, add the fsl,burst-clk-enable
property to the weim bus's devicetree node.

Example:
weim: weim@21b8000 {
	compatible = "fsl,imx6q-weim";
	reg = <0x021b8000 0x4000>;
	clocks = <&clks 196>;
	#address-cells = <2>;
	#size-cells = <1>;
	ranges = <0 0 0x08000000 0x08000000>;
	fsl,weim-cs-gpr = <&gpr>;
	fsl,burst-clk-enable;

	client-device@0,0 {
		compatible = "something";
		reg = <0 0 0x02000000>;
		#address-cells = <1>;
		#size-cells = <1>;
		bank-width = <2>;
		fsl,weim-cs-timing = <0x00620081 0x00000001 0x1c022000
				0x0000c000 0x1404a38e 0x00000000>;
	};
};

Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/bus/imx-weim.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index db74334ca5ef..cb7d5504a22a 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -19,6 +19,8 @@ struct imx_weim_devtype {
 	unsigned int	cs_count;
 	unsigned int	cs_regs_count;
 	unsigned int	cs_stride;
+	unsigned int	wcr_offset;
+	unsigned int	wcr_bcm;
 };
 
 static const struct imx_weim_devtype imx1_weim_devtype = {
@@ -37,6 +39,8 @@ static const struct imx_weim_devtype imx50_weim_devtype = {
 	.cs_count	= 4,
 	.cs_regs_count	= 6,
 	.cs_stride	= 0x18,
+	.wcr_offset	= 0x90,
+	.wcr_bcm	= BIT(0),
 };
 
 static const struct imx_weim_devtype imx51_weim_devtype = {
@@ -192,6 +196,7 @@ static int __init weim_parse_dt(struct platform_device *pdev,
 	struct device_node *child;
 	int ret, have_child = 0;
 	struct cs_timing_state ts = {};
+	u32 reg;
 
 	if (devtype == &imx50_weim_devtype) {
 		ret = imx_weim_gpr_setup(pdev);
@@ -199,6 +204,17 @@ static int __init weim_parse_dt(struct platform_device *pdev,
 			return ret;
 	}
 
+	if (of_property_read_bool(pdev->dev.of_node, "fsl,burst-clk-enable")) {
+		if (devtype->wcr_bcm) {
+			reg = readl(base + devtype->wcr_offset);
+			writel(reg | devtype->wcr_bcm,
+				base + devtype->wcr_offset);
+		} else {
+			dev_err(&pdev->dev, "burst clk mode not supported.\n");
+			return -EINVAL;
+		}
+	}
+
 	for_each_available_child_of_node(pdev->dev.of_node, child) {
 		ret = weim_timing_setup(&pdev->dev, child, base, devtype, &ts);
 		if (ret)
-- 
2.17.1
