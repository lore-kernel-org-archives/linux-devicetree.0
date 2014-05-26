From: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] regulator: pfuze100: Support SWB enable/disable
Date: Mon, 26 May 2014 16:45:40 +0800
Message-ID: <1401093941-12386-2-git-send-email-xobs@kosagi.com>
References: <1401093941-12386-1-git-send-email-xobs@kosagi.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401093941-12386-1-git-send-email-xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The SWB regulators have the ability to be turned on and off.  Add
enable/disable support for these regulators.

Signed-off-by: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/pfuze100-regulator.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 67e678c..b20304b 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -137,6 +137,8 @@ static struct regulator_ops pfuze100_sw_regulator_ops = {
 };
 
 static struct regulator_ops pfuze100_swb_regulator_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
 	.list_voltage = regulator_list_voltage_table,
 	.map_voltage = regulator_map_voltage_ascend,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
@@ -189,6 +191,8 @@ static struct regulator_ops pfuze100_swb_regulator_ops = {
 			.volt_table = voltages,	\
 			.vsel_reg = (base),	\
 			.vsel_mask = (mask),	\
+			.enable_reg = (base),	\
+			.enable_mask = 0x48,	\
 		},	\
 	}
 
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
