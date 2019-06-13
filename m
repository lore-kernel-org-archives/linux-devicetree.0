From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v4 1/7] regulator: qcom_spmi: enable linear range info
Date: Thu, 13 Jun 2019 14:25:30 -0700
Message-ID: <20190613212531.10452-1-jeffrey.l.hugo@gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 53a61fb65642..42c429d50743 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1744,6 +1744,7 @@ MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
 static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 {
 	const struct spmi_regulator_data *reg;
+	const struct spmi_voltage_range *range;
 	const struct of_device_id *match;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
@@ -1833,6 +1834,12 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (vreg->set_points->count == 1) {
+			/* since there is only one range */
+			range = vreg->set_points->range;
+			vreg->desc.uV_step = range->step_uV;
+		}
+
 		config.dev = dev;
 		config.driver_data = vreg;
 		config.regmap = regmap;
-- 
2.17.1
