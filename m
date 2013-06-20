From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/2] regulator: palmas: model SMPS10 as two regulators
Date: Thu, 20 Jun 2013 14:07:38 +0530
Message-ID: <1371717458-10307-3-git-send-email-kishon@ti.com>
References: <1371717458-10307-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371717458-10307-1-git-send-email-kishon-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

SMPS10 has two outputs OUT1 and OUT2 and have one input IN1.
SMPS10-OUT2 is connected to SMPS10-IN1 and can be configured either
in BOOST mode or BYPASS mode. regulator_enable of SMPS10-OUT2 configures
it in BOOST mode. For BYPASS mode regulator_allow_bypass() API can be
used. SMPS10-OUT1 is connected to SMPS10-OUT2 and can be enabled using
regulator_enable().

Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
---
 drivers/regulator/palmas-regulator.c |   39 ++++++++++++++++++++++++++++++----
 include/linux/mfd/palmas.h           |    9 ++++----
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
index 3ae44ac..7004bab 100644
--- a/drivers/regulator/palmas-regulator.c
+++ b/drivers/regulator/palmas-regulator.c
@@ -97,7 +97,12 @@ static const struct regs_info palmas_regs_info[] = {
 		.ctrl_addr	= PALMAS_SMPS9_CTRL,
 	},
 	{
-		.name		= "SMPS10",
+		.name		= "SMPS10_OUT1",
+		.sname		= "smps10-out2",
+		.ctrl_addr	= PALMAS_SMPS10_CTRL,
+	},
+	{
+		.name		= "SMPS10_OUT2",
 		.sname		= "smps10-in",
 		.ctrl_addr	= PALMAS_SMPS10_CTRL,
 	},
@@ -487,6 +492,8 @@ static struct regulator_ops palmas_ops_smps10 = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
+	.set_bypass		= regulator_set_bypass_regmap,
+	.get_bypass		= regulator_get_bypass_regmap,
 };
 
 static int palmas_is_enabled_ldo(struct regulator_dev *dev)
@@ -538,7 +545,8 @@ static int palmas_smps_init(struct palmas *palmas, int id,
 		return ret;
 
 	switch (id) {
-	case PALMAS_REG_SMPS10:
+	case PALMAS_REG_SMPS10_OUT1:
+	case PALMAS_REG_SMPS10_OUT2:
 		reg &= ~PALMAS_SMPS10_CTRL_MODE_SLEEP_MASK;
 		if (reg_init->mode_sleep)
 			reg |= reg_init->mode_sleep <<
@@ -681,7 +689,8 @@ static struct of_regulator_match palmas_matches[] = {
 	{ .name = "smps7", },
 	{ .name = "smps8", },
 	{ .name = "smps9", },
-	{ .name = "smps10", },
+	{ .name = "smps10_out1", },
+	{ .name = "smps10_out2", },
 	{ .name = "ldo1", },
 	{ .name = "ldo2", },
 	{ .name = "ldo3", },
@@ -869,7 +878,25 @@ static int palmas_regulators_probe(struct platform_device *pdev)
 		pmic->desc[id].id = id;
 
 		switch (id) {
-		case PALMAS_REG_SMPS10:
+		case PALMAS_REG_SMPS10_OUT1:
+			pmic->desc[id].n_voltages = PALMAS_SMPS10_NUM_VOLTAGES;
+			pmic->desc[id].ops = &palmas_ops_smps10;
+			pmic->desc[id].vsel_reg =
+					PALMAS_BASE_TO_REG(PALMAS_SMPS_BASE,
+							PALMAS_SMPS10_CTRL);
+			pmic->desc[id].vsel_mask = SMPS10_VSEL;
+			pmic->desc[id].enable_reg =
+					PALMAS_BASE_TO_REG(PALMAS_SMPS_BASE,
+							PALMAS_SMPS10_CTRL);
+			pmic->desc[id].enable_mask = SMPS10_SWITCH_EN;
+			pmic->desc[id].bypass_reg =
+					PALMAS_BASE_TO_REG(PALMAS_SMPS_BASE,
+							PALMAS_SMPS10_CTRL);
+			pmic->desc[id].bypass_mask = SMPS10_BYPASS_EN;
+			pmic->desc[id].min_uV = 3750000;
+			pmic->desc[id].uV_step = 1250000;
+			break;
+		case PALMAS_REG_SMPS10_OUT2:
 			pmic->desc[id].n_voltages = PALMAS_SMPS10_NUM_VOLTAGES;
 			pmic->desc[id].ops = &palmas_ops_smps10;
 			pmic->desc[id].vsel_reg =
@@ -880,6 +907,10 @@ static int palmas_regulators_probe(struct platform_device *pdev)
 					PALMAS_BASE_TO_REG(PALMAS_SMPS_BASE,
 							PALMAS_SMPS10_CTRL);
 			pmic->desc[id].enable_mask = SMPS10_BOOST_EN;
+			pmic->desc[id].bypass_reg =
+					PALMAS_BASE_TO_REG(PALMAS_SMPS_BASE,
+							PALMAS_SMPS10_CTRL);
+			pmic->desc[id].bypass_mask = SMPS10_BYPASS_EN;
 			pmic->desc[id].min_uV = 3750000;
 			pmic->desc[id].uV_step = 1250000;
 			break;
diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
index 8f21daf..1bbcda9 100644
--- a/include/linux/mfd/palmas.h
+++ b/include/linux/mfd/palmas.h
@@ -138,7 +138,8 @@ enum palmas_regulators {
 	PALMAS_REG_SMPS7,
 	PALMAS_REG_SMPS8,
 	PALMAS_REG_SMPS9,
-	PALMAS_REG_SMPS10,
+	PALMAS_REG_SMPS10_OUT1,
+	PALMAS_REG_SMPS10_OUT2,
 	/* LDO regulators */
 	PALMAS_REG_LDO1,
 	PALMAS_REG_LDO2,
@@ -336,9 +337,9 @@ struct palmas_pmic {
 	int smps123;
 	int smps457;
 
-	int range[PALMAS_REG_SMPS10];
-	unsigned int ramp_delay[PALMAS_REG_SMPS10];
-	unsigned int current_reg_mode[PALMAS_REG_SMPS10];
+	int range[PALMAS_REG_SMPS10_OUT2];
+	unsigned int ramp_delay[PALMAS_REG_SMPS10_OUT2];
+	unsigned int current_reg_mode[PALMAS_REG_SMPS10_OUT2];
 };
 
 struct palmas_resource {
-- 
1.7.10.4
