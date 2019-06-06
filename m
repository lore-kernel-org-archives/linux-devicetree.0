From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 2/7] drivers: regulator: qcom_spmi: Refactor get_mode/set_mode
Date: Thu,  6 Jun 2019 11:49:31 -0700
Message-ID: <20190606184931.39588-1-jeffrey.l.hugo@gmail.com>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org, niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
multi-level ifs which mirror a switch statement.  Refactor to use a switch
statement to make the code flow more clear.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 28 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index fd55438c25d6..1c18fe5969b5 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -911,13 +911,14 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
 
 	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
 
-	if (reg & SPMI_COMMON_MODE_HPM_MASK)
+	switch (reg) {
+	case SPMI_COMMON_MODE_HPM_MASK:
 		return REGULATOR_MODE_NORMAL;
-
-	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
+	case SPMI_COMMON_MODE_AUTO_MASK:
 		return REGULATOR_MODE_FAST;
-
-	return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_IDLE;
+	}
 }
 
 static int
@@ -925,12 +926,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
 	u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
-	u8 val = 0;
+	u8 val;
 
-	if (mode == REGULATOR_MODE_NORMAL)
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
 		val = SPMI_COMMON_MODE_HPM_MASK;
-	else if (mode == REGULATOR_MODE_FAST)
+		break;
+	case REGULATOR_MODE_FAST:
 		val = SPMI_COMMON_MODE_AUTO_MASK;
+		break;
+	default:
+		val = 0;
+		break;
+	}
 
 	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
 }
@@ -1834,9 +1842,9 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			}
 		}
 
-		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
+		if (vreg->set_points->count == 1) {
 			/* since there is only one range */
-			range = spmi_regulator_find_range(vreg);
+			range = vreg->set_points->range;
 			vreg->desc.uV_step = range->step_uV;
 		}
 
-- 
2.17.1
