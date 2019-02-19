From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 8/8] regulator: stpmic1: Add active discharge support
Date: Tue, 19 Feb 2019 10:04:35 +0000
Message-ID: <1550570647-9555-9-git-send-email-p.paillet@st.com>
References: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "axel.lin@ingics.com" <axel.lin@ingics.com>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Add support for active discharge for USB power switches.

Signed-off-by: pascal paillet <p.paillet@st.com>
---
 drivers/regulator/stpmic1_regulator.c | 68 ++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpmic1_regulator.c
index 41128c4..f090614 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -177,11 +177,19 @@ enum {
 	.disable = regulator_disable_regmap,
 };
 
+static const struct regulator_ops stpmic1_boost_regul_ops = {
+	.is_enabled = regulator_is_enabled_regmap,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.set_over_current_protection = stpmic1_set_icc,
+};
+
 static const struct regulator_ops stpmic1_switch_regul_ops = {
 	.is_enabled = regulator_is_enabled_regmap,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
 	.set_over_current_protection = stpmic1_set_icc,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
 };
 
 #define REG_LDO(ids, base) { \
@@ -282,7 +290,44 @@ enum {
 	.supply_name = #base, \
 }
 
-#define REG_SWITCH(ids, base, reg, mask, val) { \
+#define REG_BOOST(ids, base) { \
+	.name = #ids, \
+	.id = STPMIC1_##ids, \
+	.n_voltages = 1, \
+	.ops = &stpmic1_boost_regul_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.owner = THIS_MODULE, \
+	.min_uV = 0, \
+	.fixed_uV = 5000000, \
+	.enable_reg = BST_SW_CR, \
+	.enable_mask = BOOST_ENABLED, \
+	.enable_val = BOOST_ENABLED, \
+	.disable_val = 0, \
+	.enable_time = PMIC_ENABLE_TIME_US, \
+	.supply_name = #base, \
+}
+
+#define REG_VBUS_OTG(ids, base) { \
+	.name = #ids, \
+	.id = STPMIC1_##ids, \
+	.n_voltages = 1, \
+	.ops = &stpmic1_switch_regul_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.owner = THIS_MODULE, \
+	.min_uV = 0, \
+	.fixed_uV = 5000000, \
+	.enable_reg = BST_SW_CR, \
+	.enable_mask = USBSW_OTG_SWITCH_ENABLED, \
+	.enable_val = USBSW_OTG_SWITCH_ENABLED, \
+	.disable_val = 0, \
+	.enable_time = PMIC_ENABLE_TIME_US, \
+	.supply_name = #base, \
+	.active_discharge_reg = BST_SW_CR, \
+	.active_discharge_mask = VBUS_OTG_DISCHARGE, \
+	.active_discharge_on = VBUS_OTG_DISCHARGE, \
+}
+
+#define REG_SW_OUT(ids, base) { \
 	.name = #ids, \
 	.id = STPMIC1_##ids, \
 	.n_voltages = 1, \
@@ -291,12 +336,15 @@ enum {
 	.owner = THIS_MODULE, \
 	.min_uV = 0, \
 	.fixed_uV = 5000000, \
-	.enable_reg = (reg), \
-	.enable_mask = (mask), \
-	.enable_val = (val), \
+	.enable_reg = BST_SW_CR, \
+	.enable_mask = SWIN_SWOUT_ENABLED, \
+	.enable_val = SWIN_SWOUT_ENABLED, \
 	.disable_val = 0, \
 	.enable_time = PMIC_ENABLE_TIME_US, \
 	.supply_name = #base, \
+	.active_discharge_reg = BST_SW_CR, \
+	.active_discharge_mask = SW_OUT_DISCHARGE, \
+	.active_discharge_on = SW_OUT_DISCHARGE, \
 }
 
 static const struct stpmic1_regulator_cfg stpmic1_regulator_cfgs[] = {
@@ -376,23 +424,17 @@ enum {
 		.mask_reset_mask = BIT(6),
 	},
 	[STPMIC1_BOOST] = {
-		.desc = REG_SWITCH(BOOST, boost, BST_SW_CR,
-				   BOOST_ENABLED,
-				   BOOST_ENABLED),
+		.desc = REG_BOOST(BOOST, boost),
 		.icc_reg = BUCKS_ICCTO_CR,
 		.icc_mask = BIT(6),
 	},
 	[STPMIC1_VBUS_OTG] = {
-		.desc = REG_SWITCH(VBUS_OTG, pwr_sw1, BST_SW_CR,
-				   USBSW_OTG_SWITCH_ENABLED,
-				   USBSW_OTG_SWITCH_ENABLED),
+		.desc = REG_VBUS_OTG(VBUS_OTG, pwr_sw1),
 		.icc_reg = BUCKS_ICCTO_CR,
 		.icc_mask = BIT(4),
 	},
 	[STPMIC1_SW_OUT] = {
-		.desc = REG_SWITCH(SW_OUT, pwr_sw2, BST_SW_CR,
-				   SWIN_SWOUT_ENABLED,
-				   SWIN_SWOUT_ENABLED),
+		.desc = REG_SW_OUT(SW_OUT, pwr_sw2),
 		.icc_reg = BUCKS_ICCTO_CR,
 		.icc_mask = BIT(5),
 	},
-- 
1.9.1
