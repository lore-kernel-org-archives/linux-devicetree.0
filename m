From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/5] regulator: s5m8767: Add symbols for hard-coded DVS_RAMP
 register
Date: Tue, 17 Dec 2013 14:23:17 +0100
Message-ID: <1387286601-21646-2-git-send-email-k.kozlowski@samsung.com>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Add symbols for hard-coded values of BUCK_RAMP field in DVS_RAMP
register. This simplifies a little the code as register update is called
only once.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/regulator/s5m8767.c         |   22 ++++++++++------------
 include/linux/mfd/samsung/s5m8767.h |   15 +++++++++++++++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 397917611ecd..10b4b6a5b08e 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -881,31 +881,29 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 
 	if (s5m8767->buck2_ramp || s5m8767->buck3_ramp
 		|| s5m8767->buck4_ramp) {
+		unsigned int val;
 		switch (s5m8767->ramp_delay) {
 		case 5:
-			sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP,
-					0x40, 0xf0);
+			val = S5M8767_DVS_BUCK_RAMP_5;
 			break;
 		case 10:
-			sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP,
-					0x90, 0xf0);
+			val = S5M8767_DVS_BUCK_RAMP_10;
 			break;
 		case 25:
-			sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP,
-					0xd0, 0xf0);
+			val = S5M8767_DVS_BUCK_RAMP_25;
 			break;
 		case 50:
-			sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP,
-					0xe0, 0xf0);
+			val = S5M8767_DVS_BUCK_RAMP_50;
 			break;
 		case 100:
-			sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP,
-					0xf0, 0xf0);
+			val = S5M8767_DVS_BUCK_RAMP_100;
 			break;
 		default:
-			sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP,
-					0x90, 0xf0);
+			val = S5M8767_DVS_BUCK_RAMP_10;
 		}
+		sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP,
+					val << S5M8767_DVS_BUCK_RAMP_SHIFT,
+					S5M8767_DVS_BUCK_RAMP_MASK);
 	}
 
 	for (i = 0; i < pdata->num_regulators; i++) {
diff --git a/include/linux/mfd/samsung/s5m8767.h b/include/linux/mfd/samsung/s5m8767.h
index 9198377ee859..2ab0b0f03641 100644
--- a/include/linux/mfd/samsung/s5m8767.h
+++ b/include/linux/mfd/samsung/s5m8767.h
@@ -186,4 +186,19 @@ enum s5m8767_regulators {
 #define S5M8767_ENCTRL_SHIFT		6
 #define S5M8767_ENCTRL_MASK		(0x3 << S5M8767_ENCTRL_SHIFT)
 
+/*
+ * Values for BUCK_RAMP field in DVS_RAMP register, matching raw values
+ * in mV/us.
+ */
+enum s5m8767_dvs_buck_ramp_values {
+	S5M8767_DVS_BUCK_RAMP_5		= 0x4,
+	S5M8767_DVS_BUCK_RAMP_10	= 0x9,
+	S5M8767_DVS_BUCK_RAMP_12_5	= 0xb,
+	S5M8767_DVS_BUCK_RAMP_25	= 0xd,
+	S5M8767_DVS_BUCK_RAMP_50	= 0xe,
+	S5M8767_DVS_BUCK_RAMP_100	= 0xf,
+};
+#define S5M8767_DVS_BUCK_RAMP_SHIFT	4
+#define S5M8767_DVS_BUCK_RAMP_MASK	(0xf << S5M8767_DVS_BUCK_RAMP_SHIFT)
+
 #endif /* __LINUX_MFD_S5M8767_H */
-- 
1.7.9.5

