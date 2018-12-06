From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH v3 1/3] bus: imx-weim: support multiple address ranges per child node
Date: Thu,  6 Dec 2018 14:26:31 -0500
Message-ID: <20181206192633.25319-2-TheSven73@googlemail.com>
References: <20181206192633.25319-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206192633.25319-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: TheSven73@googlemail.com, Shawn Guo <shawnguo@kernel.org>, Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Ensure that timing values for the child node are applied to
all chip selects in the child's address ranges.

Note that this does not support multiple timing settings per
child; this can be added in the future if required.

Example:
&weim {
	acme@0 {
		compatible = "acme,whatever";
		reg = <0 0 0x100>, <0 0x400000 0x800>,
				<1 0x400000 0x800>;
		fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
				0x00000000 0xa0000240 0x00000000>;
	};
};

Signed-off-by: Sven Van Asbroeck <TheSven73@googlemail.com>
---
 drivers/bus/imx-weim.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index d84996a4528e..5452d22d1bd8 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -46,6 +46,7 @@ static const struct imx_weim_devtype imx51_weim_devtype = {
 };
 
 #define MAX_CS_REGS_COUNT	6
+#define OF_REG_SIZE		3
 
 static const struct of_device_id weim_id_table[] = {
 	/* i.MX1/21 */
@@ -115,27 +116,40 @@ static int __init weim_timing_setup(struct device_node *np, void __iomem *base,
 				    const struct imx_weim_devtype *devtype)
 {
 	u32 cs_idx, value[MAX_CS_REGS_COUNT];
-	int i, ret;
+	int i, ret, reg_idx, num_regs;
 
 	if (WARN_ON(devtype->cs_regs_count > MAX_CS_REGS_COUNT))
 		return -EINVAL;
 
-	/* get the CS index from this child node's "reg" property. */
-	ret = of_property_read_u32(np, "reg", &cs_idx);
+	ret = of_property_read_u32_array(np, "fsl,weim-cs-timing",
+					 value, devtype->cs_regs_count);
 	if (ret)
 		return ret;
 
-	if (cs_idx >= devtype->cs_count)
+	/*
+	 * the child node's "reg" property may contain multiple address ranges,
+	 * extract the chip select for each.
+	 */
+	num_regs = of_property_count_elems_of_size(np, "reg", OF_REG_SIZE);
+	if (num_regs < 0)
+		return num_regs;
+	if (!num_regs)
 		return -EINVAL;
+	for (reg_idx = 0; reg_idx < num_regs; reg_idx++) {
+		/* get the CS index from this child node's "reg" property. */
+		ret = of_property_read_u32_index(np, "reg",
+					reg_idx*OF_REG_SIZE, &cs_idx);
+		if (ret)
+			break;
 
-	ret = of_property_read_u32_array(np, "fsl,weim-cs-timing",
-					 value, devtype->cs_regs_count);
-	if (ret)
-		return ret;
+		if (cs_idx >= devtype->cs_count)
+			return -EINVAL;
 
-	/* set the timing for WEIM */
-	for (i = 0; i < devtype->cs_regs_count; i++)
-		writel(value[i], base + cs_idx * devtype->cs_stride + i * 4);
+		/* set the timing for WEIM */
+		for (i = 0; i < devtype->cs_regs_count; i++)
+			writel(value[i],
+				base + cs_idx * devtype->cs_stride + i * 4);
+	}
 
 	return 0;
 }
-- 
2.17.1
