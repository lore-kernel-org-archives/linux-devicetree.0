From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 1/2] regulator: tps51632: add register property for regmap
Date: Tue, 25 Dec 2012 20:35:59 +0530
Message-ID: <1356447960-6084-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, lrg@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

All TPS51632 registers are not readable/writable and
non-volatiles.

Add property of the registers whether it is readable/writable
or volatile for regmap framework.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Changes from V1:
- No code change.
- Rebase in linux-next 20121224

 drivers/regulator/tps51632-regulator.c |   41 ++++++++++++++++++++++++++++----
 1 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/tps51632-regulator.c b/drivers/regulator/tps51632-regulator.c
index ab21133..b96fb0e 100644
--- a/drivers/regulator/tps51632-regulator.c
+++ b/drivers/regulator/tps51632-regulator.c
@@ -205,18 +205,49 @@ skip_pwm_config:
 	return ret;
 }
 
-static bool rd_wr_reg(struct device *dev, unsigned int reg)
+static bool is_volatile_reg(struct device *dev, unsigned int reg)
 {
-	if ((reg >= 0x8) && (reg <= 0x10))
+	switch (reg) {
+	case TPS51632_OFFSET_REG:
+	case TPS51632_FAULT_REG:
+	case TPS51632_IMON_REG:
+		return true;
+	default:
 		return false;
-	return true;
+	}
+}
+
+static bool is_read_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x08 ... 0x0F:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static bool is_write_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TPS51632_VOLTAGE_SELECT_REG:
+	case TPS51632_VOLTAGE_BASE_REG:
+	case TPS51632_VMAX_REG:
+	case TPS51632_DVFS_CONTROL_REG:
+	case TPS51632_POWER_STATE_REG:
+	case TPS51632_SLEW_REGS:
+		return true;
+	default:
+		return false;
+	}
 }
 
 static const struct regmap_config tps51632_regmap_config = {
 	.reg_bits		= 8,
 	.val_bits		= 8,
-	.writeable_reg		= rd_wr_reg,
-	.readable_reg		= rd_wr_reg,
+	.writeable_reg		= is_write_reg,
+	.readable_reg		= is_read_reg,
+	.volatile_reg		= is_volatile_reg,
 	.max_register		= TPS51632_MAX_REG - 1,
 	.cache_type		= REGCACHE_RBTREE,
 };
-- 
1.7.1.1

