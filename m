From: Biwen Li <biwen.li@nxp.com>
Subject: [v4,1/3] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Date: Thu, 26 Sep 2019 10:41:16 +0800
Message-ID: <20190926024118.15931-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, ran.wang_1@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Description:
	- Reading configuration register RCPM_IPPDEXPCR1
	  always return zero

Workaround:
	- Save register RCPM_IPPDEXPCR1's value to
	  register SCFG_SPARECR8.(uboot's psci also
	  need reading value from the register SCFG_SPARECR8
	  to set register RCPM_IPPDEXPCR1)

Impact:
	- FlexTimer module will cannot wakeup system in
	  deep sleep on SoC LS1021A

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v4:
	- rename property name
	  fsl,ippdexpcr-alt-addr -> fsl,ippdexpcr1-alt-addr

Change in v3:
	- update commit message
	- rename property name
	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr

Change in v2:
	- fix stype problems

 drivers/soc/fsl/rcpm.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index 82c0ad5e663e..9a29c482fc2e 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -13,6 +13,8 @@
 #include <linux/slab.h>
 #include <linux/suspend.h>
 #include <linux/kernel.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #define RCPM_WAKEUP_CELL_MAX_SIZE	7
 
@@ -29,6 +31,9 @@ static int rcpm_pm_prepare(struct device *dev)
 	struct rcpm		*rcpm;
 	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
 	int i, ret, idx;
+	struct regmap *scfg_addr_regmap = NULL;
+	u32 reg_offset[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
+	u32 reg_value = 0;
 
 	rcpm = dev_get_drvdata(dev);
 	if (!rcpm)
@@ -63,6 +68,34 @@ static int rcpm_pm_prepare(struct device *dev)
 					tmp |= value[i + 1];
 					iowrite32be(tmp, rcpm->ippdexpcr_base + i * 4);
 				}
+				/* Workaround of errata A-008646 on SoC LS1021A:
+				 * There is a bug of register ippdexpcr1.
+				 * Reading configuration register RCPM_IPPDEXPCR1
+				 * always return zero. So save ippdexpcr1's value
+				 * to register SCFG_SPARECR8.And the value of
+				 * ippdexpcr1 will be read from SCFG_SPARECR8.
+				 */
+				scfg_addr_regmap = syscon_regmap_lookup_by_phandle(np,
+										   "fsl,ippdexpcr1-alt-addr");
+				if (scfg_addr_regmap && (1 == i)) {
+					if (of_property_read_u32_array(dev->of_node,
+					    "fsl,ippdexpcr1-alt-addr",
+					    reg_offset,
+					    1 + sizeof(u64)/sizeof(u32))) {
+						scfg_addr_regmap = NULL;
+						continue;
+					}
+					/* Read value from register SCFG_SPARECR8 */
+					regmap_read(scfg_addr_regmap,
+						    (u32)(((u64)(reg_offset[1] << (sizeof(u32) * 8) |
+						    reg_offset[2])) & 0xffffffff),
+						    &reg_value);
+					/* Write value to register SCFG_SPARECR8 */
+					regmap_write(scfg_addr_regmap,
+						     (u32)(((u64)(reg_offset[1] << (sizeof(u32) * 8) |
+						     reg_offset[2])) & 0xffffffff),
+						     tmp | reg_value);
+				}
 			}
 		}
 	} while (ws = wakeup_source_get_next(ws));
-- 
2.17.1
