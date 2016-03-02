From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 RESEND 4/4] regulator: max77620: Add support to configure active-discharge
Date: Wed, 2 Mar 2016 16:24:48 +0530
Message-ID: <1456916088-25543-5-git-send-email-ldewangan@nvidia.com>
References: <1456916088-25543-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456916088-25543-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, lgirdwood@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add regulator ops callback for configuration of active-discharge
and provide necessarily information via regulator descriptor.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Changes from V1:
 None

 drivers/regulator/max77620-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index 259e7e1..73a3356 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -578,6 +578,7 @@ static struct regulator_ops max77620_regulator_ops = {
 	.get_mode = max77620_regulator_get_mode,
 	.set_ramp_delay = max77620_regulator_set_ramp_delay,
 	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
 };
 
 #define MAX77620_SD_CNF2_ROVS_EN_NONE	0
@@ -606,6 +607,10 @@ static struct regulator_ops max77620_regulator_ops = {
 			.enable_time = 500,				\
 			.vsel_mask = MAX77620_##_volt_mask##_VOLT_MASK,	\
 			.vsel_reg = MAX77620_REG_##_id,			\
+			.active_discharge_off = 0,			\
+			.active_discharge_on = MAX77620_SD_CFG1_ADE_ENABLE, \
+			.active_discharge_mask = MAX77620_SD_CFG1_ADE_MASK, \
+			.active_discharge_reg = MAX77620_REG_##_id##_CFG, \
 			.type = REGULATOR_VOLTAGE,			\
 		},							\
 	}
@@ -633,6 +638,10 @@ static struct regulator_ops max77620_regulator_ops = {
 			.enable_time = 500,				\
 			.vsel_mask = MAX77620_LDO_VOLT_MASK,		\
 			.vsel_reg = MAX77620_REG_##_id##_CFG,		\
+			.active_discharge_off = 0,			\
+			.active_discharge_on = MAX77620_LDO_CFG2_ADE_ENABLE, \
+			.active_discharge_mask = MAX77620_LDO_CFG2_ADE_MASK, \
+			.active_discharge_reg = MAX77620_REG_##_id##_CFG2, \
 			.type = REGULATOR_VOLTAGE,			\
 		},							\
 	}
-- 
2.1.4
