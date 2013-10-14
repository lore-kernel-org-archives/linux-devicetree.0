From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 05/13] usb: phy: msm: Fix WARNING: quoted string split across lines
Date: Mon, 14 Oct 2013 18:24:32 +0300
Message-ID: <1381764280-28420-6-git-send-email-iivanov@mm-sol.com>
References: <1381764280-28420-1-git-send-email-iivanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381764280-28420-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org, bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jackp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dsegal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>

This fixes checkpatch.pl warnings.

Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-msm-usb.c |   33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index b77441b..28cab03 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -67,8 +67,7 @@ static int msm_hsusb_init_vddcx(struct msm_otg *motg, int init)
 				USB_PHY_VDD_DIG_VOL_MIN,
 				USB_PHY_VDD_DIG_VOL_MAX);
 		if (ret) {
-			dev_err(motg->phy.dev, "unable to set the voltage "
-					"for hsusb vddcx\n");
+			dev_err(motg->phy.dev, "Cannot set vddcx voltage\n");
 			return ret;
 		}
 
@@ -79,8 +78,7 @@ static int msm_hsusb_init_vddcx(struct msm_otg *motg, int init)
 		ret = regulator_set_voltage(motg->vddcx, 0,
 			USB_PHY_VDD_DIG_VOL_MAX);
 		if (ret)
-			dev_err(motg->phy.dev, "unable to set the voltage "
-					"for hsusb vddcx\n");
+			dev_err(motg->phy.dev, "Cannot set vddcx voltage\n");
 		ret = regulator_disable(motg->vddcx);
 		if (ret)
 			dev_err(motg->phy.dev, "unable to disable hsusb vddcx\n");
@@ -97,8 +95,7 @@ static int msm_hsusb_ldo_init(struct msm_otg *motg, int init)
 		rc = regulator_set_voltage(motg->v3p3, USB_PHY_3P3_VOL_MIN,
 				USB_PHY_3P3_VOL_MAX);
 		if (rc) {
-			dev_err(motg->phy.dev, "unable to set voltage level "
-					"for hsusb 3p3\n");
+			dev_err(motg->phy.dev, "Cannot set v3p3 voltage\n");
 			goto exit;
 		}
 		rc = regulator_enable(motg->v3p3);
@@ -109,8 +106,7 @@ static int msm_hsusb_ldo_init(struct msm_otg *motg, int init)
 		rc = regulator_set_voltage(motg->v1p8, USB_PHY_1P8_VOL_MIN,
 				USB_PHY_1P8_VOL_MAX);
 		if (rc) {
-			dev_err(motg->phy.dev, "unable to set voltage level "
-					"for hsusb 1p8\n");
+			dev_err(motg->phy.dev, "Cannot set v1p8 voltage\n");
 			goto disable_3p3;
 		}
 		rc = regulator_enable(motg->v1p8);
@@ -144,8 +140,7 @@ static int msm_hsusb_config_vddcx(struct msm_otg *motg, int high)
 
 	ret = regulator_set_voltage(motg->vddcx, min_vol, max_vol);
 	if (ret) {
-		pr_err("%s: unable to set the voltage for regulator "
-			"HSUSB_VDDCX\n", __func__);
+		dev_err(motg->phy.dev, "Cannot set vddcx voltage\n");
 		return ret;
 	}
 
@@ -163,15 +158,13 @@ static int msm_hsusb_ldo_set_mode(struct msm_otg *motg, int on)
 		ret = regulator_set_optimum_mode(motg->v1p8,
 				USB_PHY_1P8_HPM_LOAD);
 		if (ret < 0) {
-			pr_err("%s: Unable to set HPM of the regulator "
-				"HSUSB_1p8\n", __func__);
+			pr_err("Could not set HPM for v1p8\n");
 			return ret;
 		}
 		ret = regulator_set_optimum_mode(motg->v3p3,
 				USB_PHY_3P3_HPM_LOAD);
 		if (ret < 0) {
-			pr_err("%s: Unable to set HPM of the regulator "
-				"HSUSB_3p3\n", __func__);
+			pr_err("Could not set HPM for v3p3\n");
 			regulator_set_optimum_mode(motg->v1p8,
 				USB_PHY_1P8_LPM_LOAD);
 			return ret;
@@ -180,13 +173,11 @@ static int msm_hsusb_ldo_set_mode(struct msm_otg *motg, int on)
 		ret = regulator_set_optimum_mode(motg->v1p8,
 				USB_PHY_1P8_LPM_LOAD);
 		if (ret < 0)
-			pr_err("%s: Unable to set LPM of the regulator "
-				"HSUSB_1p8\n", __func__);
+			pr_err("Could not set LPM for v1p8\n");
 		ret = regulator_set_optimum_mode(motg->v3p3,
 				USB_PHY_3P3_LPM_LOAD);
 		if (ret < 0)
-			pr_err("%s: Unable to set LPM of the regulator "
-				"HSUSB_3p3\n", __func__);
+			pr_err("Could not set LPM for v3p3\n");
 	}
 
 	pr_debug("reg (%s)\n", on ? "HPM" : "LPM");
@@ -546,8 +537,7 @@ static int msm_otg_resume(struct msm_otg *motg)
 		 * PHY. USB state can not be restored. Re-insertion
 		 * of USB cable is the only way to get USB working.
 		 */
-		dev_err(phy->dev, "Unable to resume USB."
-				"Re-plugin the cable\n");
+		dev_err(phy->dev, "Unable to resume USB. Re-plugin the cable\n");
 		msm_otg_reset(phy);
 	}
 
@@ -1529,8 +1519,7 @@ static int __init msm_otg_probe(struct platform_device *pdev)
 			motg->pdata->otg_control == OTG_USER_CONTROL) {
 		ret = msm_otg_debugfs_init(motg);
 		if (ret)
-			dev_dbg(&pdev->dev, "mode debugfs file is"
-					"not available\n");
+			dev_dbg(&pdev->dev, "Can not create mode change file\n");
 	}
 
 	pm_runtime_set_active(&pdev->dev);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
