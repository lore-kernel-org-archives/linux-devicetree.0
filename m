From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next v2 02/15] clk: sunxi-ng: r40: export a regmap to
 access the GMAC register
Date: Wed,  2 May 2018 00:12:14 +0800
Message-ID: <20180501161227.2110-3-wens@csie.org>
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

There's a GMAC configuration register, which exists on A64/A83T/H3/H5 in
the syscon part, in the CCU of R40 SoC.

Export a regmap of the CCU.

Read access is not restricted to all registers, but only the GMAC
register is allowed to be written.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index c3aa839a453d..65ba6455feb7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -1251,9 +1251,37 @@ static struct ccu_mux_nb sun8i_r40_cpu_nb = {
 	.bypass_index	= 1, /* index of 24 MHz oscillator */
 };
 
+/*
+ * Add a regmap for the GMAC driver (dwmac-sun8i) to access the
+ * GMAC configuration register.
+ * Only this register is allowed to be written, in order to
+ * prevent overriding critical clock configuration.
+ */
+
+#define SUN8I_R40_GMAC_CFG_REG 0x164
+static bool sun8i_r40_ccu_regmap_accessible_reg(struct device *dev,
+						unsigned int reg)
+{
+	if (reg == SUN8I_R40_GMAC_CFG_REG)
+		return true;
+	return false;
+}
+
+static struct regmap_config sun8i_r40_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x320, /* PLL_LOCK_CTRL_REG */
+
+	/* other devices have no business accessing other registers */
+	.readable_reg	= sun8i_r40_ccu_regmap_accessible_reg,
+	.writeable_reg	= sun8i_r40_ccu_regmap_accessible_reg,
+};
+
 static int sun8i_r40_ccu_probe(struct platform_device *pdev)
 {
 	struct resource *res;
+	struct regmap *regmap;
 	void __iomem *reg;
 	u32 val;
 	int ret;
@@ -1278,6 +1306,11 @@ static int sun8i_r40_ccu_probe(struct platform_device *pdev)
 	val &= ~GENMASK(25, 20);
 	writel(val, reg + SUN8I_R40_USB_CLK_REG);
 
+	regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+				       &sun8i_r40_ccu_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
 	ret = sunxi_ccu_probe(pdev->dev.of_node, reg, &sun8i_r40_ccu_desc);
 	if (ret)
 		return ret;
-- 
2.17.0
