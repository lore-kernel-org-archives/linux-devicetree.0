From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 2/3] firmware: qcom_scm: drop redandant of_platform_populate
Date: Fri, 11 Aug 2017 14:30:36 +0100
Message-ID: <1502458237-1683-3-git-send-email-sudeep.holla@arm.com>
References: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <andy.gross@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, David Brown <david.brown@linaro.org>
List-Id: devicetree@vger.kernel.org

Now that firmware_of_init takes care of populating all the devices
under the /firmware/ node, this patch removes the redandant call to
of_platform_populate here.

Cc: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/qcom_scm.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index bb16510d75ba..a11e06e5cdb0 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -440,30 +440,6 @@ static struct platform_driver qcom_scm_driver = {
 
 static int __init qcom_scm_init(void)
 {
-	struct device_node *np, *fw_np;
-	int ret;
-
-	fw_np = of_find_node_by_name(NULL, "firmware");
-
-	if (!fw_np)
-		return -ENODEV;
-
-	np = of_find_matching_node(fw_np, qcom_scm_dt_match);
-
-	if (!np) {
-		of_node_put(fw_np);
-		return -ENODEV;
-	}
-
-	of_node_put(np);
-
-	ret = of_platform_populate(fw_np, qcom_scm_dt_match, NULL, NULL);
-
-	of_node_put(fw_np);
-
-	if (ret)
-		return ret;
-
 	return platform_driver_register(&qcom_scm_driver);
 }
 subsys_initcall(qcom_scm_init);
-- 
2.7.4
