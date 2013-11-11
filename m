From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] usb: chipidea: msm: Add device tree support
Date: Mon, 11 Nov 2013 15:35:35 +0200
Message-ID: <1384176937-1658-3-git-send-email-iivanov@mm-sol.com>
References: <1384176937-1658-1-git-send-email-iivanov@mm-sol.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384176937-1658-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>

Allows controller to be specified via device tree.
Pass PHY phandle specified in DT to core driver.

Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/usb/chipidea/ci_hdrc_msm.c |   23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 2d51d85..747d6c1 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -57,9 +57,21 @@ static struct ci_hdrc_platform_data ci_hdrc_msm_platdata = {
 static int ci_hdrc_msm_probe(struct platform_device *pdev)
 {
 	struct platform_device *plat_ci;
+	struct usb_phy *phy;
 
 	dev_dbg(&pdev->dev, "ci_hdrc_msm_probe\n");
 
+	/*
+	 * OTG(PHY) driver takes care of PHY initialization, clock management,
+	 * powering up VBUS, mapping of registers address space and power
+	 * management.
+	 */
+	phy = devm_usb_get_phy_by_phandle(&pdev->dev, "usb-phy", 0);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+	else
+		ci_hdrc_msm_platdata.phy = phy;
+
 	plat_ci = ci_hdrc_add_device(&pdev->dev,
 				pdev->resource, pdev->num_resources,
 				&ci_hdrc_msm_platdata);
@@ -86,10 +98,19 @@ static int ci_hdrc_msm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id msm_ci_dt_match[] = {
+	{ .compatible = "qcom,ci-hdrc", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, msm_ci_dt_match);
+
 static struct platform_driver ci_hdrc_msm_driver = {
 	.probe = ci_hdrc_msm_probe,
 	.remove = ci_hdrc_msm_remove,
-	.driver = { .name = "msm_hsusb", },
+	.driver = {
+		.name = "msm_hsusb",
+		.of_match_table = msm_ci_dt_match,
+	},
 };
 
 module_platform_driver(ci_hdrc_msm_driver);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
