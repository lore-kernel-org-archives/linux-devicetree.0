From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 5/8] regulator: stpmic1: Remove support for regulator pull
 down
Date: Tue, 19 Feb 2019 10:04:33 +0000
Message-ID: <1550570647-9555-6-git-send-email-p.paillet@st.com>
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

Regulator high pull down are enabled by default so remove support in the
driver.

Signed-off-by: pascal paillet <p.paillet@st.com>
---
 drivers/regulator/stpmic1_regulator.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpmic1_regulator.c
index f5c0e58..6970e45 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -133,7 +133,6 @@ enum {
 	.disable = regulator_disable_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
-	.set_pull_down = regulator_set_pull_down_regmap,
 	.set_over_current_protection = stpmic1_set_icc,
 };
 
@@ -145,7 +144,6 @@ enum {
 	.disable = regulator_disable_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
-	.set_pull_down = regulator_set_pull_down_regmap,
 	.get_bypass = regulator_get_bypass_regmap,
 	.set_bypass = regulator_set_bypass_regmap,
 	.set_over_current_protection = stpmic1_set_icc,
@@ -155,7 +153,6 @@ enum {
 	.is_enabled = regulator_is_enabled_regmap,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
-	.set_pull_down = regulator_set_pull_down_regmap,
 	.set_over_current_protection = stpmic1_set_icc,
 };
 
@@ -177,7 +174,6 @@ enum {
 	.is_enabled = regulator_is_enabled_regmap,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
-	.set_pull_down = regulator_set_pull_down_regmap,
 };
 
 static const struct regulator_ops stpmic1_switch_regul_ops = {
@@ -203,8 +199,6 @@ enum {
 	.enable_val = 1, \
 	.disable_val = 0, \
 	.enable_time = PMIC_ENABLE_TIME_US, \
-	.pull_down_reg = ids##_PULL_DOWN_REG, \
-	.pull_down_mask = ids##_PULL_DOWN_MASK, \
 	.supply_name = #base, \
 }
 
@@ -228,8 +222,6 @@ enum {
 	.bypass_mask = LDO_BYPASS_MASK, \
 	.bypass_val_on = LDO_BYPASS_MASK, \
 	.bypass_val_off = 0, \
-	.pull_down_reg = ids##_PULL_DOWN_REG, \
-	.pull_down_mask = ids##_PULL_DOWN_MASK, \
 	.supply_name = #base, \
 }
 
@@ -247,8 +239,6 @@ enum {
 	.enable_val = 1, \
 	.disable_val = 0, \
 	.enable_time = PMIC_ENABLE_TIME_US, \
-	.pull_down_reg = ids##_PULL_DOWN_REG, \
-	.pull_down_mask = ids##_PULL_DOWN_MASK, \
 	.supply_name = #base, \
 }
 
@@ -288,8 +278,6 @@ enum {
 	.enable_val = 1, \
 	.disable_val = 0, \
 	.enable_time = PMIC_ENABLE_TIME_US, \
-	.pull_down_reg = ids##_PULL_DOWN_REG, \
-	.pull_down_mask = ids##_PULL_DOWN_MASK, \
 	.supply_name = #base, \
 }
 
-- 
1.9.1
