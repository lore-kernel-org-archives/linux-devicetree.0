From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 1/4] soc: sunxi: export a regmap for EMAC
 clock reg on A64
Date: Thu, 14 Jun 2018 23:35:45 +0800
Message-ID: <20180614153548.9644-2-wens@csie.org>
References: <20180614153548.9644-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWUWRLMQKGQE66HBUTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180614153548.9644-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

The A64 SRAM controller memory zone has a EMAC clock register, which is
needed by the Ethernet MAC driver (dwmac-sun8i).

Export a regmap for this register on A64.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
[wens-jdAy2FN1RRM@public.gmane.org: export whole address range with only EMAC register
		accessible and drop regmap name]
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 57 ++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 882be5ed7e84..eec7fc6e9f66 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -17,6 +17,7 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <linux/soc/sunxi/sunxi_sram.h>
 
@@ -281,13 +282,51 @@ int sunxi_sram_release(struct device *dev)
 }
 EXPORT_SYMBOL(sunxi_sram_release);
 
+struct sunxi_sramc_variant {
+	bool has_emac_clock;
+};
+
+static const struct sunxi_sramc_variant sun4i_a10_sramc_variant = {
+	/* Nothing special */
+};
+
+static const struct sunxi_sramc_variant sun50i_a64_sramc_variant = {
+	.has_emac_clock = true,
+};
+
+#define SUNXI_SRAM_EMAC_CLOCK_REG	0x30
+static bool sunxi_sram_regmap_accessible_reg(struct device *dev,
+					     unsigned int reg)
+{
+	if (reg == SUNXI_SRAM_EMAC_CLOCK_REG)
+		return true;
+	return false;
+}
+
+static struct regmap_config sunxi_sram_emac_clock_regmap = {
+	.reg_bits       = 32,
+	.val_bits       = 32,
+	.reg_stride     = 4,
+	/* last defined register */
+	.max_register   = SUNXI_SRAM_EMAC_CLOCK_REG,
+	/* other devices have no business accessing other registers */
+	.readable_reg	= sunxi_sram_regmap_accessible_reg,
+	.writeable_reg	= sunxi_sram_regmap_accessible_reg,
+};
+
 static int sunxi_sram_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct dentry *d;
+	struct regmap *emac_clock;
+	const struct sunxi_sramc_variant *variant;
 
 	sram_dev = &pdev->dev;
 
+	variant = of_device_get_match_data(&pdev->dev);
+	if (!variant)
+		return -EINVAL;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base))
@@ -300,12 +339,26 @@ static int sunxi_sram_probe(struct platform_device *pdev)
 	if (!d)
 		return -ENOMEM;
 
+	if (variant->has_emac_clock) {
+		emac_clock = devm_regmap_init_mmio(&pdev->dev, base,
+						   &sunxi_sram_emac_clock_regmap);
+
+		if (IS_ERR(emac_clock))
+			return PTR_ERR(emac_clock);
+	}
+
 	return 0;
 }
 
 static const struct of_device_id sunxi_sram_dt_match[] = {
-	{ .compatible = "allwinner,sun4i-a10-sram-controller" },
-	{ .compatible = "allwinner,sun50i-a64-sram-controller" },
+	{
+		.compatible = "allwinner,sun4i-a10-sram-controller",
+		.data = &sun4i_a10_sramc_variant,
+	},
+	{
+		.compatible = "allwinner,sun50i-a64-sram-controller",
+		.data = &sun50i_a64_sramc_variant,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sunxi_sram_dt_match);
-- 
2.17.1
