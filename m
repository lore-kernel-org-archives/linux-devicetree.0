From: Biwen Li <biwen.li@nxp.com>
Subject: [v2,1/3] soc: fsl: fix that flextimer cannot wakeup system in deep sleep on LS1021A
Date: Tue, 17 Sep 2019 12:41:17 +0800
Message-ID: <20190917044119.21895-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Why:
    - Cannot write register RCPM_IPPDEXPCR1 on LS1021A,
      Register RCPM_IPPDEXPCR1's default value is zero.
      So the register value that reading from register
      RCPM_IPPDEXPCR1 is always zero.

How:
    - Save register RCPM_IPPDEXPCR1's value to
      register SCFG_SPARECR8.(uboot's psci also
      need reading value from the register SCFG_SPARECR8
      to set register RCPM_IPPDEXPCR1)

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- fix stype problems

 drivers/soc/fsl/rcpm.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index 82c0ad5e663e..0b710c24999c 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -13,6 +13,8 @@
 #include <linux/slab.h>
 #include <linux/suspend.h>
 #include <linux/kernel.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #define RCPM_WAKEUP_CELL_MAX_SIZE	7
 
@@ -63,6 +65,31 @@ static int rcpm_pm_prepare(struct device *dev)
 					tmp |= value[i + 1];
 					iowrite32be(tmp, rcpm->ippdexpcr_base + i * 4);
 				}
+				#ifdef CONFIG_SOC_LS1021A
+				/* Workaround: There is a bug of register ippdexpcr1,
+				 * cannot write it but can read it.Tt's default value is zero,
+				 * then read it will always returns zero.
+				 * So save ippdexpcr1's value to register SCFG_SPARECR8.
+				 * And the value of ippdexpcr1 will be read from SCFG_SPARECR8.
+				 */
+				{
+					struct regmap *rcpm_scfg_regmap = NULL;
+					u32 reg_offset[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
+					u32 reg_value = 0;
+
+					rcpm_scfg_regmap = syscon_regmap_lookup_by_phandle(np, "fsl,rcpm-scfg");
+					if (rcpm_scfg_regmap) {
+						if (of_property_read_u32_array(dev->of_node,
+						    "fsl,rcpm-scfg", reg_offset, rcpm->wakeup_cells + 1)) {
+							rcpm_scfg_regmap = NULL;
+							continue;
+						}
+						regmap_read(rcpm_scfg_regmap, reg_offset[i + 1], &reg_value);
+						/* Write value to register SCFG_SPARECR8 */
+						regmap_write(rcpm_scfg_regmap, reg_offset[i + 1], tmp | reg_value);
+					}
+				}
+				#endif //CONFIG_SOC_LS1021A
 			}
 		}
 	} while (ws = wakeup_source_get_next(ws));
-- 
2.17.1
