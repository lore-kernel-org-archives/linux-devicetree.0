From: Anson.Huang@nxp.com
Subject: [PATCH V3 2/5] thermal: qoriq: Fix error path of calling qoriq_tmu_register_tmu_zone fail
Date: Tue, 30 Jul 2019 10:21:23 +0800
Message-ID: <20190730022126.17883-2-Anson.Huang@nxp.com>
References: <20190730022126.17883-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730022126.17883-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

When registering tmu zone failed, the error path should be err_tmu
instead of err_iomap, as iounmap() needs to be called.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
New patch.
---
 drivers/thermal/qoriq_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
index 2893947..5755a11 100644
--- a/drivers/thermal/qoriq_thermal.c
+++ b/drivers/thermal/qoriq_thermal.c
@@ -231,7 +231,7 @@ static int qoriq_tmu_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register sensors\n");
 		ret = -ENODEV;
-		goto err_iomap;
+		goto err_tmu;
 	}
 
 	return 0;
-- 
2.7.4
