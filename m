From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/2] regulator: s5m8767: Modify parse_dt function to parse data
 related to ramp
Date: Thu, 10 Oct 2013 10:41:35 +0900
Message-ID: <1381369296-17101-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch parse 'buck[2-4]_ramp_enable and buck_ramp_delay' platform data
from dts file.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/regulator/s5m8767.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index c24448b..cb6cdb3 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -640,6 +640,22 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	if (of_get_property(pmic_np, "s5m8767,pmic-buck2-ramp-enable", NULL))
+		pdata->buck2_ramp_enable = true;
+
+	if (of_get_property(pmic_np, "s5m8767,pmic-buck3-ramp-enable", NULL))
+		pdata->buck3_ramp_enable = true;
+
+	if (of_get_property(pmic_np, "s5m8767,pmic-buck4-ramp-enable", NULL))
+		pdata->buck4_ramp_enable = true;
+
+	if (pdata->buck2_ramp_enable || pdata->buck3_ramp_enable
+			|| pdata->buck4_ramp_enable) {
+		if (of_property_read_u32(pmic_np, "s5m8767,pmic-buck-ramp-delay",
+				&pdata->buck_ramp_delay))
+			pdata->buck_ramp_delay = 0;
+	}
+
 	return 0;
 }
 #else
-- 
1.8.0
