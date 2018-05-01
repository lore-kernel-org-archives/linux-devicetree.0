From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next v2 14/15] soc: sunxi: export a regmap for EMAC clock
 reg on A64
Date: Wed,  2 May 2018 00:12:26 +0800
Message-ID: <20180501161227.2110-15-wens@csie.org>
References: <20180501161227.2110-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180501161227.2110-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

The A64 SRAM controller memory zone has a EMAC clock register, which is
needed by the Ethernet MAC driver (dwmac-sun8i).

Export a regmap for this register on A64.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
[wens@csie.org: export whole address range with only EMAC register
		accessible and drop regmap name]
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
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
2.17.0
