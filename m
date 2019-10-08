From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] pinctrl: rockchip: add rk3308 SoC support
Date: Tue,  8 Oct 2019 16:54:07 +0800
Message-ID: <20191008085407.22191-1-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch do support pinctrl for RK3308 SoCs.

Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 .../bindings/pinctrl/rockchip,pinctrl.txt     |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 420 ++++++++++++++++++
 2 files changed, 421 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index 0919db294c17..2113cfaa26e6 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -29,6 +29,7 @@ Required properties for iomux controller:
 		"rockchip,rk3188-pinctrl":  for Rockchip RK3188
 		"rockchip,rk3228-pinctrl":  for Rockchip RK3228
 		"rockchip,rk3288-pinctrl":  for Rockchip RK3288
+		"rockchip,rk3308-pinctrl":  for Rockchip RK3308
 		"rockchip,rk3328-pinctrl":  for Rockchip RK3328
 		"rockchip,rk3368-pinctrl":  for Rockchip RK3368
 		"rockchip,rk3399-pinctrl":  for Rockchip RK3399
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index dc0bbf198cbc..e91db155bd11 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -58,6 +58,7 @@ enum rockchip_pinctrl_type {
 	RK3128,
 	RK3188,
 	RK3288,
+	RK3308,
 	RK3368,
 	RK3399,
 };
@@ -656,6 +657,100 @@ static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
 	},
 };
 
+static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
+	{
+		.num = 1,
+		.pin = 14,
+		.reg = 0x28,
+		.bit = 12,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 15,
+		.reg = 0x2c,
+		.bit = 0,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 18,
+		.reg = 0x30,
+		.bit = 4,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 19,
+		.reg = 0x30,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 20,
+		.reg = 0x30,
+		.bit = 12,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 21,
+		.reg = 0x34,
+		.bit = 0,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 22,
+		.reg = 0x34,
+		.bit = 4,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 23,
+		.reg = 0x34,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		.num = 3,
+		.pin = 12,
+		.reg = 0x68,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		.num = 3,
+		.pin = 13,
+		.reg = 0x68,
+		.bit = 12,
+		.mask = 0xf
+	}, {
+		.num = 2,
+		.pin = 2,
+		.reg = 0x608,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 3,
+		.reg = 0x608,
+		.bit = 4,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 16,
+		.reg = 0x610,
+		.bit = 8,
+		.mask = 0x7
+	}, {
+		.num = 3,
+		.pin = 10,
+		.reg = 0x610,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		.num = 3,
+		.pin = 11,
+		.reg = 0x610,
+		.bit = 4,
+		.mask = 0x7
+	},
+};
+
 static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
 	{
 		.num = 2,
@@ -982,6 +1077,192 @@ static struct rockchip_mux_route_data rk3288_mux_route_data[] = {
 	},
 };
 
+static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
+	{
+		/* rtc_clk */
+		.bank_num = 0,
+		.pin = 19,
+		.func = 1,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 0) | BIT(0),
+	}, {
+		/* uart2_rxm0 */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 2) | BIT(16 + 3),
+	}, {
+		/* uart2_rxm1 */
+		.bank_num = 4,
+		.pin = 26,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 2) | BIT(16 + 3) | BIT(2),
+	}, {
+		/* i2c3_sdam0 */
+		.bank_num = 0,
+		.pin = 15,
+		.func = 2,
+		.route_offset = 0x608,
+		.route_val = BIT(16 + 8) | BIT(16 + 9),
+	}, {
+		/* i2c3_sdam1 */
+		.bank_num = 3,
+		.pin = 12,
+		.func = 2,
+		.route_offset = 0x608,
+		.route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(8),
+	}, {
+		/* i2c3_sdam2 */
+		.bank_num = 2,
+		.pin = 0,
+		.func = 3,
+		.route_offset = 0x608,
+		.route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(9),
+	}, {
+		/* i2s-8ch-1-sclktxm0 */
+		.bank_num = 1,
+		.pin = 3,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* i2s-8ch-1-sclkrxm0 */
+		.bank_num = 1,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* i2s-8ch-1-sclktxm1 */
+		.bank_num = 1,
+		.pin = 13,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 3) | BIT(3),
+	}, {
+		/* i2s-8ch-1-sclkrxm1 */
+		.bank_num = 1,
+		.pin = 14,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 3) | BIT(3),
+	}, {
+		/* pdm-clkm0 */
+		.bank_num = 1,
+		.pin = 4,
+		.func = 3,
+		.route_offset = 0x308,
+		.route_val =  BIT(16 + 12) | BIT(16 + 13),
+	}, {
+		/* pdm-clkm1 */
+		.bank_num = 1,
+		.pin = 14,
+		.func = 4,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
+	}, {
+		/* pdm-clkm2 */
+		.bank_num = 2,
+		.pin = 6,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
+	}, {
+		/* pdm-clkm-m2 */
+		.bank_num = 2,
+		.pin = 4,
+		.func = 3,
+		.route_offset = 0x600,
+		.route_val = BIT(16 + 2) | BIT(2),
+	}, {
+		/* spi1_miso */
+		.bank_num = 3,
+		.pin = 10,
+		.func = 3,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 9),
+	}, {
+		/* spi1_miso_m1 */
+		.bank_num = 2,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 9) | BIT(9),
+	}, {
+		/* owire_m0 */
+		.bank_num = 0,
+		.pin = 11,
+		.func = 3,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 10) | BIT(16 + 11),
+	}, {
+		/* owire_m1 */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 7,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
+	}, {
+		/* owire_m2 */
+		.bank_num = 2,
+		.pin = 2,
+		.func = 5,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
+	}, {
+		/* can_rxd_m0 */
+		.bank_num = 0,
+		.pin = 11,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 12) | BIT(16 + 13),
+	}, {
+		/* can_rxd_m1 */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 5,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
+	}, {
+		/* can_rxd_m2 */
+		.bank_num = 2,
+		.pin = 2,
+		.func = 4,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
+	}, {
+		/* mac_rxd0_m0 */
+		.bank_num = 1,
+		.pin = 20,
+		.func = 3,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 14),
+	}, {
+		/* mac_rxd0_m1 */
+		.bank_num = 4,
+		.pin = 2,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 14) | BIT(14),
+	}, {
+		/* uart3_rx */
+		.bank_num = 3,
+		.pin = 12,
+		.func = 4,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 15),
+	}, {
+		/* uart3_rx_m1 */
+		.bank_num = 0,
+		.pin = 17,
+		.func = 3,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 15) | BIT(15),
+	},
+};
+
 static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
 	{
 		/* uart2dbg_rxm0 */
@@ -1475,6 +1756,27 @@ static int rv1108_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RK3308_SCHMITT_PINS_PER_REG		8
+#define RK3308_SCHMITT_BANK_STRIDE		16
+#define RK3308_SCHMITT_GRF_OFFSET		0x1a0
+
+static int rk3308_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3308_SCHMITT_GRF_OFFSET;
+
+	*reg += bank->bank_num * RK3308_SCHMITT_BANK_STRIDE;
+	*reg += ((pin_num / RK3308_SCHMITT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3308_SCHMITT_PINS_PER_REG;
+
+	return 0;
+}
+
 #define RK2928_PULL_OFFSET		0x118
 #define RK2928_PULL_PINS_PER_REG	16
 #define RK2928_PULL_BANK_STRIDE		8
@@ -1646,6 +1948,43 @@ static void rk3228_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	*bit *= RK3288_DRV_BITS_PER_PIN;
 }
 
+#define RK3308_PULL_OFFSET		0xa0
+
+static void rk3308_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					 int pin_num, struct regmap **regmap,
+					 int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3308_PULL_OFFSET;
+	*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
+	*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
+
+	*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
+	*bit *= RK3188_PULL_BITS_PER_PIN;
+}
+
+#define RK3308_DRV_GRF_OFFSET		0x100
+
+static enum rockchip_pin_drv_type rk3308_calc_drv_reg_and_bit(
+				       struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3308_DRV_GRF_OFFSET;
+	*reg += bank->bank_num * RK3288_DRV_BANK_STRIDE;
+	*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
+
+	*bit = (pin_num % RK3288_DRV_PINS_PER_REG);
+	*bit *= RK3288_DRV_BITS_PER_PIN;
+
+	return DRV_TYPE_IO_DEFAULT;
+}
+
 #define RK3368_PULL_GRF_OFFSET		0x100
 #define RK3368_PULL_PMU_OFFSET		0x10
 
@@ -3482,6 +3821,46 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* SoC data specially handle */
+
+/* rk3308 SoC data initialize */
+#define RK3308_GRF_SOC_CON13			0x608
+#define RK3308_GRF_SOC_CON15			0x610
+
+/* RK3308_GRF_SOC_CON13 */
+#define RK3308_GRF_I2C3_IOFUNC_SRC_CTRL	(BIT(16 + 10) | BIT(10))
+#define RK3308_GRF_GPIO2A3_SEL_SRC_CTRL	(BIT(16 + 7)  | BIT(7))
+#define RK3308_GRF_GPIO2A2_SEL_SRC_CTRL	(BIT(16 + 3)  | BIT(3))
+
+/* RK3308_GRF_SOC_CON15 */
+#define RK3308_GRF_GPIO2C0_SEL_SRC_CTRL	(BIT(16 + 11) | BIT(11))
+#define RK3308_GRF_GPIO3B3_SEL_SRC_CTRL	(BIT(16 + 7)  | BIT(7))
+#define RK3308_GRF_GPIO3B2_SEL_SRC_CTRL	(BIT(16 + 3)  | BIT(3))
+
+static int rk3308_soc_data_init(struct rockchip_pinctrl *info)
+{
+	int ret;
+
+	/*
+	 * Enable the special ctrl of selected sources.
+	 */
+	ret = regmap_write(info->regmap_base, RK3308_GRF_SOC_CON13,
+			   RK3308_GRF_I2C3_IOFUNC_SRC_CTRL |
+			   RK3308_GRF_GPIO2A3_SEL_SRC_CTRL |
+			   RK3308_GRF_GPIO2A2_SEL_SRC_CTRL);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(info->regmap_base, RK3308_GRF_SOC_CON15,
+			   RK3308_GRF_GPIO2C0_SEL_SRC_CTRL |
+			   RK3308_GRF_GPIO3B3_SEL_SRC_CTRL |
+			   RK3308_GRF_GPIO3B2_SEL_SRC_CTRL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static struct rockchip_pin_bank px30_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -3709,6 +4088,45 @@ static struct rockchip_pin_ctrl rk3288_pin_ctrl = {
 		.drv_calc_reg		= rk3288_calc_drv_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3308_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT),
+	PIN_BANK_IOMUX_FLAGS(4, 32, "gpio4", IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT,
+					     IOMUX_8WIDTH_2BIT),
+};
+
+static struct rockchip_pin_ctrl rk3308_pin_ctrl = {
+		.pin_banks		= rk3308_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3308_pin_banks),
+		.label			= "RK3308-GPIO",
+		.type			= RK3308,
+		.grf_mux_offset		= 0x0,
+		.iomux_recalced		= rk3308_mux_recalced_data,
+		.niomux_recalced	= ARRAY_SIZE(rk3308_mux_recalced_data),
+		.iomux_routes		= rk3308_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3308_mux_route_data),
+		.soc_data_init		= rk3308_soc_data_init,
+		.pull_calc_reg		= rk3308_calc_pull_reg_and_bit,
+		.drv_calc_reg		= rk3308_calc_drv_reg_and_bit,
+		.schmitt_calc_reg	= rk3308_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk3328_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
 	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
@@ -3849,6 +4267,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3228_pin_ctrl },
 	{ .compatible = "rockchip,rk3288-pinctrl",
 		.data = &rk3288_pin_ctrl },
+	{ .compatible = "rockchip,rk3308-pinctrl",
+		.data = &rk3308_pin_ctrl },
 	{ .compatible = "rockchip,rk3328-pinctrl",
 		.data = &rk3328_pin_ctrl },
 	{ .compatible = "rockchip,rk3368-pinctrl",
-- 
2.17.1
