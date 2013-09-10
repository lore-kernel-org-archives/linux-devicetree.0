From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] regulator: palmas: configure enable time for LDOs
Date: Tue, 10 Sep 2013 16:48:07 +0530
Message-ID: <1378811888-2268-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@kernel.org
Cc: rob.herring@calxeda.com, mark.rutland@arm.com, swarren@wwwdotorg.org, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

As per datasheet (Referred TPS65913), the on-time for LDO is
500micro second. If LDO6 is in vibrator mode then the on-time
is 2000us.

Set the enable_time on regulator descriptor accordingly.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/regulator/palmas-regulator.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
index cb65c6f..fba4faa 100644
--- a/drivers/regulator/palmas-regulator.c
+++ b/drivers/regulator/palmas-regulator.c
@@ -979,6 +979,7 @@ static int palmas_regulators_probe(struct platform_device *pdev)
 			pmic->desc[id].min_uV = 900000;
 			pmic->desc[id].uV_step = 50000;
 			pmic->desc[id].linear_min_sel = 1;
+			pmic->desc[id].enable_time = 500;
 			pmic->desc[id].vsel_reg =
 					PALMAS_BASE_TO_REG(PALMAS_LDO_BASE,
 						palmas_regs_info[id].vsel_addr);
@@ -997,6 +998,11 @@ static int palmas_regulators_probe(struct platform_device *pdev)
 				pmic->desc[id].min_uV = 450000;
 				pmic->desc[id].uV_step = 25000;
 			}
+
+			/* LOD6 in vibrator mode will have enable time 2000us */
+			if (pdata && pdata->ldo6_vibrator &&
+				(id == PALMAS_REG_LDO6))
+				pmic->desc[id].enable_time = 2000;
 		} else {
 			pmic->desc[id].n_voltages = 1;
 			pmic->desc[id].ops = &palmas_ops_extreg;
-- 
1.7.1.1

