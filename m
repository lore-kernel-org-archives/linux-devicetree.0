From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH 1/8] regulator: bd71837: Disable voltage monitoring for LDO3/4
Date: Wed, 29 Aug 2018 15:36:10 +0300
Message-ID: <cad2e7baeb7af2d6efbc6afba831b0513087d832.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

There is a HW quirk in BD71837. The shutdown sequence timings for
bucks/LDOs which are enabled via register interface are changed.
At PMIC poweroff the voltage for BUCK6/7 is cut immediately at the
beginning of shut-down sequence. This causes LDO5/6 voltage
monitoring to detect under voltage and force PMIC to emergency
state instead of poweroff. Disable voltage monitoring for LDO5 and
LDO6 at probe to avoid this.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd71837-regulator.c | 19 +++++++++++++++++++
 include/linux/mfd/rohm-bd718x7.h      | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/bd71837-regulator.c b/drivers/regulator/bd71837-regulator.c
index 0f8ac8dec3e1..a1bd8aaf4d98 100644
--- a/drivers/regulator/bd71837-regulator.c
+++ b/drivers/regulator/bd71837-regulator.c
@@ -569,6 +569,25 @@ static int bd71837_probe(struct platform_device *pdev)
 			BD71837_REG_REGLOCK);
 	}
 
+	/*
+	 * There is a HW quirk in BD71837. The shutdown sequence timings for
+	 * bucks/LDOs which are controlled via register interface are changed.
+	 * At PMIC poweroff the voltage for BUCK6/7 is cut immediately at the
+	 * beginning of shut-down sequence. As bucks 6 and 7 are parent
+	 * supplies for LDO5 and LDO6 - this causes LDO5/6 voltage
+	 * monitoring to errorneously detect under voltage and force PMIC to
+	 * emergency state instead of poweroff. In order to avoid this we
+	 * disable voltage monitoring for LDO5 and LDO6
+	 */
+	err = regmap_update_bits(pmic->mfd->regmap, BD718XX_REG_MVRFLTMASK2,
+				 BD718XX_LDO5_VRMON80 | BD718XX_LDO6_VRMON80,
+				 BD718XX_LDO5_VRMON80 | BD718XX_LDO6_VRMON80);
+	if (err) {
+		dev_err(&pmic->pdev->dev,
+			"Failed to disable voltage monitoring\n");
+		goto err;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(pmic_regulator_inits); i++) {
 
 		struct regulator_desc *desc;
diff --git a/include/linux/mfd/rohm-bd718x7.h b/include/linux/mfd/rohm-bd718x7.h
index a528747f8aed..e8338e5dc10b 100644
--- a/include/linux/mfd/rohm-bd718x7.h
+++ b/include/linux/mfd/rohm-bd718x7.h
@@ -78,9 +78,9 @@ enum {
 	BD71837_REG_TRANS_COND0        = 0x1F,
 	BD71837_REG_TRANS_COND1        = 0x20,
 	BD71837_REG_VRFAULTEN          = 0x21,
-	BD71837_REG_MVRFLTMASK0        = 0x22,
-	BD71837_REG_MVRFLTMASK1        = 0x23,
-	BD71837_REG_MVRFLTMASK2        = 0x24,
+	BD718XX_REG_MVRFLTMASK0        = 0x22,
+	BD718XX_REG_MVRFLTMASK1        = 0x23,
+	BD718XX_REG_MVRFLTMASK2        = 0x24,
 	BD71837_REG_RCVCFG             = 0x25,
 	BD71837_REG_RCVNUM             = 0x26,
 	BD71837_REG_PWRONCONFIG0       = 0x27,
@@ -159,6 +159,33 @@ enum {
 #define BUCK8_MASK		0x3F
 #define BUCK8_DEFAULT		0x1E
 
+/* BD718XX Voltage monitoring masks */
+#define BD718XX_BUCK1_VRMON80           0x1
+#define BD718XX_BUCK1_VRMON130          0x2
+#define BD718XX_BUCK2_VRMON80           0x4
+#define BD718XX_BUCK2_VRMON130          0x8
+#define BD718XX_1ST_NODVS_BUCK_VRMON80  0x1
+#define BD718XX_1ST_NODVS_BUCK_VRMON130 0x2
+#define BD718XX_2ND_NODVS_BUCK_VRMON80  0x4
+#define BD718XX_2ND_NODVS_BUCK_VRMON130 0x8
+#define BD718XX_3RD_NODVS_BUCK_VRMON80  0x10
+#define BD718XX_3RD_NODVS_BUCK_VRMON130 0x20
+#define BD718XX_4TH_NODVS_BUCK_VRMON80  0x40
+#define BD718XX_4TH_NODVS_BUCK_VRMON130 0x80
+#define BD718XX_LDO1_VRMON80            0x1
+#define BD718XX_LDO2_VRMON80            0x2
+#define BD718XX_LDO3_VRMON80            0x4
+#define BD718XX_LDO4_VRMON80            0x8
+#define BD718XX_LDO5_VRMON80            0x10
+#define BD718XX_LDO6_VRMON80            0x20
+
+/* BD71837 specific voltage monitoring masks */
+#define BD71837_BUCK3_VRMON80           0x10
+#define BD71837_BUCK3_VRMON130          0x20
+#define BD71837_BUCK4_VRMON80           0x40
+#define BD71837_BUCK4_VRMON130          0x80
+#define BD71837_LDO7_VRMON80            0x40
+
 /* BD71837_REG_IRQ bits */
 #define IRQ_SWRST		0x40
 #define IRQ_PWRON_S		0x20
-- 
2.14.3
