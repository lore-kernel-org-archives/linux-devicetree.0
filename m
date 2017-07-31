From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 03/14] pinctrl: rockchip: add input schmitt support for rv1108
Date: Mon, 31 Jul 2017 18:10:22 +0800
Message-ID: <1501495822-21503-1-git-send-email-andy.yan@rock-chips.com>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Some pins like i2c SCL/SDA need the schmitt input function
to avoid crosstalk problems.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/pinctrl/pinctrl-rockchip.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e831647..868cb9c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1084,6 +1084,36 @@ static void rv1108_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	*bit *= RV1108_DRV_BITS_PER_PIN;
 }
 
+#define RV1108_SCHMITT_PMU_OFFSET		0x30
+#define RV1108_SCHMITT_GRF_OFFSET		0x388
+#define RV1108_SCHMITT_BANK_STRIDE		8
+#define RV1108_SCHMITT_PINS_PER_GRF_REG		16
+#define RV1108_SCHMITT_PINS_PER_PMU_REG		8
+
+static int rv1108_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int pins_per_reg;
+
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RV1108_SCHMITT_PMU_OFFSET;
+		pins_per_reg = RV1108_SCHMITT_PINS_PER_PMU_REG;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RV1108_SCHMITT_GRF_OFFSET;
+		pins_per_reg = RV1108_SCHMITT_PINS_PER_GRF_REG;
+		*reg += (bank->bank_num  - 1) * RV1108_SCHMITT_BANK_STRIDE;
+	}
+	*reg += ((pin_num / pins_per_reg) * 4);
+	*bit = pin_num % pins_per_reg;
+
+	return 0;
+}
+
 #define RK2928_PULL_OFFSET		0x118
 #define RK2928_PULL_PINS_PER_REG	16
 #define RK2928_PULL_BANK_STRIDE		8
@@ -3017,6 +3047,7 @@ static struct rockchip_pin_ctrl rv1108_pin_ctrl = {
 	.pmu_mux_offset		= 0x0,
 	.pull_calc_reg		= rv1108_calc_pull_reg_and_bit,
 	.drv_calc_reg		= rv1108_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rv1108_calc_schmitt_reg_and_bit,
 };
 
 static struct rockchip_pin_bank rk2928_pin_banks[] = {
-- 
2.7.4
