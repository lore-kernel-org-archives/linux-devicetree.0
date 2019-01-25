From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] regulator: mc13xxx: Use lowercase regulator names to match the DT
Date: Fri, 25 Jan 2019 09:37:04 -0600
Message-ID: <20190125153705.29921-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Since c32569e358ad ("regulator: Use of_node_name_eq for node name
comparisons") Vivien reported the mc13892-regulator complaining about
not being able to find regulators.

This is because prior to that commit we used of_node_cmp() to compare
the regulator array passed from mc13892_regulators down to
mc13xxx_parse_regulators_dt() and they are all defined in uppercase
letters by the MC13892_*_DEFINE* macros, whereas they are defined as
lowercase in the DTS.

Fix this by using a lowercase regulator name to match the DT node name.

Fixes: c32569e358ad ("regulator: Use of_node_name_eq for node name comparisons")
Reported-by: Vivien Didelot <vivien.didelot@gmail.com>
Reported-by: Florian Fainelli <f.fainelli@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/regulator/mc13783-regulator.c | 78 +++++++++++++--------------
 drivers/regulator/mc13892-regulator.c | 64 +++++++++++-----------
 drivers/regulator/mc13xxx.h           | 20 +++----
 3 files changed, 81 insertions(+), 81 deletions(-)

diff --git a/drivers/regulator/mc13783-regulator.c b/drivers/regulator/mc13783-regulator.c
index 8fd1adc9c9a9..887a1d1726ad 100644
--- a/drivers/regulator/mc13783-regulator.c
+++ b/drivers/regulator/mc13783-regulator.c
@@ -228,67 +228,67 @@ static const unsigned int mc13783_pwgtdrv_val[] = {
 
 static struct regulator_ops mc13783_gpo_regulator_ops;
 
-#define MC13783_DEFINE(prefix, name, reg, vsel_reg, voltages)	\
-	MC13xxx_DEFINE(MC13783_REG_, name, reg, vsel_reg, voltages, \
+#define MC13783_DEFINE(prefix, name, node, reg, vsel_reg, voltages)	\
+	MC13xxx_DEFINE(MC13783_REG_, name, node, reg, vsel_reg, voltages, \
 			mc13xxx_regulator_ops)
 
-#define MC13783_FIXED_DEFINE(prefix, name, reg, voltages)		\
-	MC13xxx_FIXED_DEFINE(MC13783_REG_, name, reg, voltages, \
+#define MC13783_FIXED_DEFINE(prefix, name, node, reg, voltages)		\
+	MC13xxx_FIXED_DEFINE(MC13783_REG_, name, node, reg, voltages,	\
 			mc13xxx_fixed_regulator_ops)
 
-#define MC13783_GPO_DEFINE(prefix, name, reg, voltages)		\
-	MC13xxx_GPO_DEFINE(MC13783_REG_, name, reg, voltages, \
+#define MC13783_GPO_DEFINE(prefix, name, node, reg, voltages)		\
+	MC13xxx_GPO_DEFINE(MC13783_REG_, name, node, reg, voltages,	\
 			mc13783_gpo_regulator_ops)
 
-#define MC13783_DEFINE_SW(_name, _reg, _vsel_reg, _voltages)		\
-	MC13783_DEFINE(REG, _name, _reg, _vsel_reg, _voltages)
-#define MC13783_DEFINE_REGU(_name, _reg, _vsel_reg, _voltages)		\
-	MC13783_DEFINE(REG, _name, _reg, _vsel_reg, _voltages)
+#define MC13783_DEFINE_SW(_name, _node, _reg, _vsel_reg, _voltages)	\
+	MC13783_DEFINE(REG, _name, _node, _reg, _vsel_reg, _voltages)
+#define MC13783_DEFINE_REGU(_name, _node, _reg, _vsel_reg, _voltages)	\
+	MC13783_DEFINE(REG, _name, _node, _reg, _vsel_reg, _voltages)
 
 static struct mc13xxx_regulator mc13783_regulators[] = {
-	MC13783_DEFINE_SW(SW1A, SWITCHERS0, SWITCHERS0, mc13783_sw1x_val),
-	MC13783_DEFINE_SW(SW1B, SWITCHERS1, SWITCHERS1, mc13783_sw1x_val),
-	MC13783_DEFINE_SW(SW2A, SWITCHERS2, SWITCHERS2, mc13783_sw2x_val),
-	MC13783_DEFINE_SW(SW2B, SWITCHERS3, SWITCHERS3, mc13783_sw2x_val),
-	MC13783_DEFINE_SW(SW3, SWITCHERS5, SWITCHERS5, mc13783_sw3_val),
-
-	MC13783_FIXED_DEFINE(REG, VAUDIO, REGULATORMODE0, mc13783_vaudio_val),
-	MC13783_FIXED_DEFINE(REG, VIOHI, REGULATORMODE0, mc13783_viohi_val),
-	MC13783_DEFINE_REGU(VIOLO, REGULATORMODE0, REGULATORSETTING0,
+	MC13783_DEFINE_SW(SW1A, sw1a, SWITCHERS0, SWITCHERS0, mc13783_sw1x_val),
+	MC13783_DEFINE_SW(SW1B, sw1b, SWITCHERS1, SWITCHERS1, mc13783_sw1x_val),
+	MC13783_DEFINE_SW(SW2A, sw2a, SWITCHERS2, SWITCHERS2, mc13783_sw2x_val),
+	MC13783_DEFINE_SW(SW2B, sw2b, SWITCHERS3, SWITCHERS3, mc13783_sw2x_val),
+	MC13783_DEFINE_SW(SW3, sw3, SWITCHERS5, SWITCHERS5, mc13783_sw3_val),
+
+	MC13783_FIXED_DEFINE(REG, VAUDIO, vaudio, REGULATORMODE0, mc13783_vaudio_val),
+	MC13783_FIXED_DEFINE(REG, VIOHI, viohi, REGULATORMODE0, mc13783_viohi_val),
+	MC13783_DEFINE_REGU(VIOLO, violo, REGULATORMODE0, REGULATORSETTING0,
 			    mc13783_violo_val),
-	MC13783_DEFINE_REGU(VDIG, REGULATORMODE0, REGULATORSETTING0,
+	MC13783_DEFINE_REGU(VDIG, vdig, REGULATORMODE0, REGULATORSETTING0,
 			    mc13783_vdig_val),
-	MC13783_DEFINE_REGU(VGEN, REGULATORMODE0, REGULATORSETTING0,
+	MC13783_DEFINE_REGU(VGEN, vgen, REGULATORMODE0, REGULATORSETTING0,
 			    mc13783_vgen_val),
-	MC13783_DEFINE_REGU(VRFDIG, REGULATORMODE0, REGULATORSETTING0,
+	MC13783_DEFINE_REGU(VRFDIG, vrfdig, REGULATORMODE0, REGULATORSETTING0,
 			    mc13783_vrfdig_val),
-	MC13783_DEFINE_REGU(VRFREF, REGULATORMODE0, REGULATORSETTING0,
+	MC13783_DEFINE_REGU(VRFREF, vrfref, REGULATORMODE0, REGULATORSETTING0,
 			    mc13783_vrfref_val),
-	MC13783_DEFINE_REGU(VRFCP, REGULATORMODE0, REGULATORSETTING0,
+	MC13783_DEFINE_REGU(VRFCP, vrfcp, REGULATORMODE0, REGULATORSETTING0,
 			    mc13783_vrfcp_val),
-	MC13783_DEFINE_REGU(VSIM, REGULATORMODE1, REGULATORSETTING0,
+	MC13783_DEFINE_REGU(VSIM, vsim, REGULATORMODE1, REGULATORSETTING0,
 			    mc13783_vsim_val),
-	MC13783_DEFINE_REGU(VESIM, REGULATORMODE1, REGULATORSETTING0,
+	MC13783_DEFINE_REGU(VESIM, vesim, REGULATORMODE1, REGULATORSETTING0,
 			    mc13783_vesim_val),
-	MC13783_DEFINE_REGU(VCAM, REGULATORMODE1, REGULATORSETTING0,
+	MC13783_DEFINE_REGU(VCAM, vcam, REGULATORMODE1, REGULATORSETTING0,
 			    mc13783_vcam_val),
-	MC13783_FIXED_DEFINE(REG, VRFBG, REGULATORMODE1, mc13783_vrfbg_val),
-	MC13783_DEFINE_REGU(VVIB, REGULATORMODE1, REGULATORSETTING1,
+	MC13783_FIXED_DEFINE(REG, VRFBG, vrfbg, REGULATORMODE1, mc13783_vrfbg_val),
+	MC13783_DEFINE_REGU(VVIB, vvib, REGULATORMODE1, REGULATORSETTING1,
 			    mc13783_vvib_val),
-	MC13783_DEFINE_REGU(VRF1, REGULATORMODE1, REGULATORSETTING1,
+	MC13783_DEFINE_REGU(VRF1, vrf1, REGULATORMODE1, REGULATORSETTING1,
 			    mc13783_vrf_val),
-	MC13783_DEFINE_REGU(VRF2, REGULATORMODE1, REGULATORSETTING1,
+	MC13783_DEFINE_REGU(VRF2, vrf2, REGULATORMODE1, REGULATORSETTING1,
 			    mc13783_vrf_val),
-	MC13783_DEFINE_REGU(VMMC1, REGULATORMODE1, REGULATORSETTING1,
+	MC13783_DEFINE_REGU(VMMC1, vmmc1, REGULATORMODE1, REGULATORSETTING1,
 			    mc13783_vmmc_val),
-	MC13783_DEFINE_REGU(VMMC2, REGULATORMODE1, REGULATORSETTING1,
+	MC13783_DEFINE_REGU(VMMC2, vmmc2, REGULATORMODE1, REGULATORSETTING1,
 			    mc13783_vmmc_val),
-	MC13783_GPO_DEFINE(REG, GPO1, POWERMISC, mc13783_gpo_val),
-	MC13783_GPO_DEFINE(REG, GPO2, POWERMISC, mc13783_gpo_val),
-	MC13783_GPO_DEFINE(REG, GPO3, POWERMISC, mc13783_gpo_val),
-	MC13783_GPO_DEFINE(REG, GPO4, POWERMISC, mc13783_gpo_val),
-	MC13783_GPO_DEFINE(REG, PWGT1SPI, POWERMISC, mc13783_pwgtdrv_val),
-	MC13783_GPO_DEFINE(REG, PWGT2SPI, POWERMISC, mc13783_pwgtdrv_val),
+	MC13783_GPO_DEFINE(REG, GPO1, gpo1, POWERMISC, mc13783_gpo_val),
+	MC13783_GPO_DEFINE(REG, GPO2, gpo1, POWERMISC, mc13783_gpo_val),
+	MC13783_GPO_DEFINE(REG, GPO3, gpo1, POWERMISC, mc13783_gpo_val),
+	MC13783_GPO_DEFINE(REG, GPO4, gpo1, POWERMISC, mc13783_gpo_val),
+	MC13783_GPO_DEFINE(REG, PWGT1SPI, pwgt1spi, POWERMISC, mc13783_pwgtdrv_val),
+	MC13783_GPO_DEFINE(REG, PWGT2SPI, pwgt2spi, POWERMISC, mc13783_pwgtdrv_val),
 };
 
 static int mc13783_powermisc_rmw(struct mc13xxx_regulator_priv *priv, u32 mask,
diff --git a/drivers/regulator/mc13892-regulator.c b/drivers/regulator/mc13892-regulator.c
index f3fba1cc1379..b55894980066 100644
--- a/drivers/regulator/mc13892-regulator.c
+++ b/drivers/regulator/mc13892-regulator.c
@@ -246,57 +246,57 @@ static struct regulator_ops mc13892_gpo_regulator_ops;
 static struct regulator_ops mc13892_sw_regulator_ops;
 
 
-#define MC13892_FIXED_DEFINE(name, reg, voltages)		\
-	MC13xxx_FIXED_DEFINE(MC13892_, name, reg, voltages,	\
+#define MC13892_FIXED_DEFINE(name, node, reg, voltages)			\
+	MC13xxx_FIXED_DEFINE(MC13892_, name, node, reg, voltages,	\
 			mc13xxx_fixed_regulator_ops)
 
-#define MC13892_GPO_DEFINE(name, reg, voltages)			\
-	MC13xxx_GPO_DEFINE(MC13892_, name, reg, voltages,	\
+#define MC13892_GPO_DEFINE(name, node, reg, voltages)			\
+	MC13xxx_GPO_DEFINE(MC13892_, name, node, reg, voltages,		\
 			mc13892_gpo_regulator_ops)
 
-#define MC13892_SW_DEFINE(name, reg, vsel_reg, voltages)	\
-	MC13xxx_DEFINE(MC13892_, name, reg, vsel_reg, voltages, \
+#define MC13892_SW_DEFINE(name, node, reg, vsel_reg, voltages)		\
+	MC13xxx_DEFINE(MC13892_, name, node, reg, vsel_reg, voltages,	\
 			mc13892_sw_regulator_ops)
 
-#define MC13892_DEFINE_REGU(name, reg, vsel_reg, voltages)	\
-	MC13xxx_DEFINE(MC13892_, name, reg, vsel_reg, voltages, \
+#define MC13892_DEFINE_REGU(name, node, reg, vsel_reg, voltages)	\
+	MC13xxx_DEFINE(MC13892_, name, node, reg, vsel_reg, voltages, \
 			mc13xxx_regulator_ops)
 
 static struct mc13xxx_regulator mc13892_regulators[] = {
-	MC13892_DEFINE_REGU(VCOINCELL, POWERCTL0, POWERCTL0, mc13892_vcoincell),
-	MC13892_SW_DEFINE(SW1, SWITCHERS0, SWITCHERS0, mc13892_sw1),
-	MC13892_SW_DEFINE(SW2, SWITCHERS1, SWITCHERS1, mc13892_sw),
-	MC13892_SW_DEFINE(SW3, SWITCHERS2, SWITCHERS2, mc13892_sw),
-	MC13892_SW_DEFINE(SW4, SWITCHERS3, SWITCHERS3, mc13892_sw),
-	MC13892_FIXED_DEFINE(SWBST, SWITCHERS5, mc13892_swbst),
-	MC13892_FIXED_DEFINE(VIOHI, REGULATORMODE0, mc13892_viohi),
-	MC13892_DEFINE_REGU(VPLL, REGULATORMODE0, REGULATORSETTING0,
+	MC13892_DEFINE_REGU(VCOINCELL, vcoincell, POWERCTL0, POWERCTL0, mc13892_vcoincell),
+	MC13892_SW_DEFINE(SW1, sw1, SWITCHERS0, SWITCHERS0, mc13892_sw1),
+	MC13892_SW_DEFINE(SW2, sw2, SWITCHERS1, SWITCHERS1, mc13892_sw),
+	MC13892_SW_DEFINE(SW3, sw3, SWITCHERS2, SWITCHERS2, mc13892_sw),
+	MC13892_SW_DEFINE(SW4, sw4, SWITCHERS3, SWITCHERS3, mc13892_sw),
+	MC13892_FIXED_DEFINE(SWBST, swbst, SWITCHERS5, mc13892_swbst),
+	MC13892_FIXED_DEFINE(VIOHI, viohi, REGULATORMODE0, mc13892_viohi),
+	MC13892_DEFINE_REGU(VPLL, vpll, REGULATORMODE0, REGULATORSETTING0,
 		mc13892_vpll),
-	MC13892_DEFINE_REGU(VDIG, REGULATORMODE0, REGULATORSETTING0,
+	MC13892_DEFINE_REGU(VDIG, vdig, REGULATORMODE0, REGULATORSETTING0,
 		mc13892_vdig),
-	MC13892_DEFINE_REGU(VSD, REGULATORMODE1, REGULATORSETTING1,
+	MC13892_DEFINE_REGU(VSD, vsd, REGULATORMODE1, REGULATORSETTING1,
 		mc13892_vsd),
-	MC13892_DEFINE_REGU(VUSB2, REGULATORMODE0, REGULATORSETTING0,
+	MC13892_DEFINE_REGU(VUSB2, vusb2, REGULATORMODE0, REGULATORSETTING0,
 		mc13892_vusb2),
-	MC13892_DEFINE_REGU(VVIDEO, REGULATORMODE1, REGULATORSETTING1,
+	MC13892_DEFINE_REGU(VVIDEO, vvideo, REGULATORMODE1, REGULATORSETTING1,
 		mc13892_vvideo),
-	MC13892_DEFINE_REGU(VAUDIO, REGULATORMODE1, REGULATORSETTING1,
+	MC13892_DEFINE_REGU(VAUDIO, vaudio, REGULATORMODE1, REGULATORSETTING1,
 		mc13892_vaudio),
-	MC13892_DEFINE_REGU(VCAM, REGULATORMODE1, REGULATORSETTING0,
+	MC13892_DEFINE_REGU(VCAM, vcam, REGULATORMODE1, REGULATORSETTING0,
 		mc13892_vcam),
-	MC13892_DEFINE_REGU(VGEN1, REGULATORMODE0, REGULATORSETTING0,
+	MC13892_DEFINE_REGU(VGEN1, vgen1, REGULATORMODE0, REGULATORSETTING0,
 		mc13892_vgen1),
-	MC13892_DEFINE_REGU(VGEN2, REGULATORMODE0, REGULATORSETTING0,
+	MC13892_DEFINE_REGU(VGEN2, vgen2, REGULATORMODE0, REGULATORSETTING0,
 		mc13892_vgen2),
-	MC13892_DEFINE_REGU(VGEN3, REGULATORMODE1, REGULATORSETTING0,
+	MC13892_DEFINE_REGU(VGEN3, vgen3, REGULATORMODE1, REGULATORSETTING0,
 		mc13892_vgen3),
-	MC13892_FIXED_DEFINE(VUSB, USB1, mc13892_vusb),
-	MC13892_GPO_DEFINE(GPO1, POWERMISC, mc13892_gpo),
-	MC13892_GPO_DEFINE(GPO2, POWERMISC, mc13892_gpo),
-	MC13892_GPO_DEFINE(GPO3, POWERMISC, mc13892_gpo),
-	MC13892_GPO_DEFINE(GPO4, POWERMISC, mc13892_gpo),
-	MC13892_GPO_DEFINE(PWGT1SPI, POWERMISC, mc13892_pwgtdrv),
-	MC13892_GPO_DEFINE(PWGT2SPI, POWERMISC, mc13892_pwgtdrv),
+	MC13892_FIXED_DEFINE(VUSB, vusb, USB1, mc13892_vusb),
+	MC13892_GPO_DEFINE(GPO1, gpo1, POWERMISC, mc13892_gpo),
+	MC13892_GPO_DEFINE(GPO2, gpo2, POWERMISC, mc13892_gpo),
+	MC13892_GPO_DEFINE(GPO3, gpo3, POWERMISC, mc13892_gpo),
+	MC13892_GPO_DEFINE(GPO4, gpo4, POWERMISC, mc13892_gpo),
+	MC13892_GPO_DEFINE(PWGT1SPI, pwgt1spi, POWERMISC, mc13892_pwgtdrv),
+	MC13892_GPO_DEFINE(PWGT2SPI, pwgt2spi, POWERMISC, mc13892_pwgtdrv),
 };
 
 static int mc13892_powermisc_rmw(struct mc13xxx_regulator_priv *priv, u32 mask,
diff --git a/drivers/regulator/mc13xxx.h b/drivers/regulator/mc13xxx.h
index 2ab9bfd93b4e..a602b08d4c9e 100644
--- a/drivers/regulator/mc13xxx.h
+++ b/drivers/regulator/mc13xxx.h
@@ -56,10 +56,10 @@ static inline struct mc13xxx_regulator_init_data *mc13xxx_parse_regulators_dt(
 extern struct regulator_ops mc13xxx_regulator_ops;
 extern struct regulator_ops mc13xxx_fixed_regulator_ops;
 
-#define MC13xxx_DEFINE(prefix, _name, _reg, _vsel_reg, _voltages, _ops)	\
+#define MC13xxx_DEFINE(prefix, _name, _node, _reg, _vsel_reg, _voltages, _ops)	\
 	[prefix ## _name] = {				\
 		.desc = {						\
-			.name = #_name,					\
+			.name = #_node,					\
 			.n_voltages = ARRAY_SIZE(_voltages),		\
 			.volt_table =  _voltages,			\
 			.ops = &_ops,			\
@@ -74,10 +74,10 @@ extern struct regulator_ops mc13xxx_fixed_regulator_ops;
 		.vsel_mask = prefix ## _vsel_reg ## _ ## _name ## VSEL_M,\
 	}
 
-#define MC13xxx_FIXED_DEFINE(prefix, _name, _reg, _voltages, _ops)	\
+#define MC13xxx_FIXED_DEFINE(prefix, _name, _node, _reg, _voltages, _ops)	\
 	[prefix ## _name] = {				\
 		.desc = {						\
-			.name = #_name,					\
+			.name = #_node,					\
 			.n_voltages = ARRAY_SIZE(_voltages),		\
 			.volt_table =  _voltages,			\
 			.ops = &_ops,		\
@@ -89,10 +89,10 @@ extern struct regulator_ops mc13xxx_fixed_regulator_ops;
 		.enable_bit = prefix ## _reg ## _ ## _name ## EN,	\
 	}
 
-#define MC13xxx_GPO_DEFINE(prefix, _name, _reg,  _voltages, _ops)	\
+#define MC13xxx_GPO_DEFINE(prefix, _name, _node, _reg,  _voltages, _ops)	\
 	[prefix ## _name] = {				\
 		.desc = {						\
-			.name = #_name,					\
+			.name = #_node,					\
 			.n_voltages = ARRAY_SIZE(_voltages),		\
 			.volt_table =  _voltages,			\
 			.ops = &_ops,		\
@@ -104,9 +104,9 @@ extern struct regulator_ops mc13xxx_fixed_regulator_ops;
 		.enable_bit = prefix ## _reg ## _ ## _name ## EN,	\
 	}
 
-#define MC13xxx_DEFINE_SW(_name, _reg, _vsel_reg, _voltages, ops)	\
-	MC13xxx_DEFINE(SW, _name, _reg, _vsel_reg, _voltages, ops)
-#define MC13xxx_DEFINE_REGU(_name, _reg, _vsel_reg, _voltages, ops)	\
-	MC13xxx_DEFINE(REGU, _name, _reg, _vsel_reg, _voltages, ops)
+#define MC13xxx_DEFINE_SW(_name, _node, _reg, _vsel_reg, _voltages, ops) \
+	MC13xxx_DEFINE(SW, _name, _node, _reg, _vsel_reg, _voltages, ops)
+#define MC13xxx_DEFINE_REGU(_name, _node, _reg, _vsel_reg, _voltages, ops) \
+	MC13xxx_DEFINE(REGU, _name, _node, _reg, _vsel_reg, _voltages, ops)
 
 #endif
-- 
2.19.1
