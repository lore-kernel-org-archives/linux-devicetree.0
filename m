From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 09/13] usb: phy: msm: Remove unused pclk_src_name
Date: Mon, 14 Oct 2013 18:24:36 +0300
Message-ID: <1381764280-28420-10-git-send-email-iivanov@mm-sol.com>
References: <1381764280-28420-1-git-send-email-iivanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381764280-28420-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org, bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jackp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dsegal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>

There are no references to 'pclk_src_name' in plaform code,
so it is unused.

Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-msm-usb.c |   26 +-------------------------
 include/linux/usb/msm_hsusb.h |    5 -----
 2 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index 4a23cfa..c1020d9 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -464,9 +464,6 @@ static int msm_otg_suspend(struct msm_otg *motg)
 	if (!IS_ERR(motg->core_clk))
 		clk_disable_unprepare(motg->core_clk);
 
-	if (!IS_ERR(motg->pclk_src))
-		clk_disable_unprepare(motg->pclk_src);
-
 	if (motg->pdata->phy_type == SNPS_28NM_INTEGRATED_PHY &&
 			motg->pdata->otg_control == OTG_PMIC_CONTROL) {
 		msm_hsusb_ldo_set_mode(motg, 0);
@@ -496,9 +493,6 @@ static int msm_otg_resume(struct msm_otg *motg)
 	if (!atomic_read(&motg->in_lpm))
 		return 0;
 
-	if (!IS_ERR(motg->pclk_src))
-		clk_prepare_enable(motg->pclk_src);
-
 	clk_prepare_enable(motg->pclk);
 	clk_prepare_enable(motg->clk);
 	if (!IS_ERR(motg->core_clk))
@@ -1394,17 +1388,8 @@ static int __init msm_otg_probe(struct platform_device *pdev)
 	 * If USB Core is running its protocol engine based on CORE CLK,
 	 * CORE CLK  must be running at >55Mhz for correct HSUSB
 	 * operation and USB core cannot tolerate frequency changes on
-	 * CORE CLK. For such USB cores, vote for maximum clk frequency
-	 * on pclk source
+	 * CORE CLK.
 	 */
-	 motg->pclk_src = ERR_PTR(-ENOENT);
-	 if (motg->pdata->pclk_src_name) {
-		motg->pclk_src = devm_clk_get(&pdev->dev,
-					motg->pdata->pclk_src_name);
-		if (IS_ERR(motg->pclk_src))
-			return PTR_ERR(motg->pclk_src);
-	}
-
 	motg->pclk = devm_clk_get(&pdev->dev, "usb_hs_pclk");
 	if (IS_ERR(motg->pclk)) {
 		dev_err(&pdev->dev, "failed to get usb_hs_pclk\n");
@@ -1450,10 +1435,6 @@ static int __init msm_otg_probe(struct platform_device *pdev)
 	}
 
 	clk_set_rate(motg->clk, 60000000);
-	if (!IS_ERR(motg->pclk_src)) {
-		clk_set_rate(motg->pclk_src, INT_MAX);
-		clk_prepare_enable(motg->pclk_src);
-	}
 
 	clk_prepare_enable(motg->clk);
 	clk_prepare_enable(motg->pclk);
@@ -1529,8 +1510,6 @@ disable_clks:
 	clk_disable_unprepare(motg->clk);
 	if (!IS_ERR(motg->core_clk))
 		clk_disable_unprepare(motg->core_clk);
-	if (!IS_ERR(motg->pclk_src))
-		clk_disable_unprepare(motg->pclk_src);
 	return ret;
 }
 
@@ -1575,9 +1554,6 @@ static int msm_otg_remove(struct platform_device *pdev)
 	clk_disable_unprepare(motg->clk);
 	if (!IS_ERR(motg->core_clk))
 		clk_disable_unprepare(motg->core_clk);
-	if (!IS_ERR(motg->pclk_src))
-		clk_disable_unprepare(motg->pclk_src);
-
 	msm_hsusb_ldo_init(motg, 0);
 
 	pm_runtime_set_suspended(&pdev->dev);
diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_hsusb.h
index 72c5830..262ed80 100644
--- a/include/linux/usb/msm_hsusb.h
+++ b/include/linux/usb/msm_hsusb.h
@@ -106,8 +106,6 @@ enum usb_chg_type {
  * @power_budget: VBUS power budget in mA (0 will be treated as 500mA).
  * @mode: Supported mode (OTG/peripheral/host).
  * @otg_control: OTG switch controlled by user/Id pin
- * @pclk_src_name: pclk is derived from ebi1_usb_clk in case of 7x27 and 8k
- *              dfab_usb_hs_clk in case of 8660 and 8960.
  */
 struct msm_otg_platform_data {
 	int *phy_init_seq;
@@ -117,7 +115,6 @@ struct msm_otg_platform_data {
 	enum otg_control_type otg_control;
 	enum msm_usb_phy_type phy_type;
 	void (*setup_gpio)(enum usb_otg_state state);
-	char *pclk_src_name;
 	int (*link_clk_reset)(struct clk *link_clk, bool assert);
 	int (*phy_clk_reset)(struct clk *phy_clk);
 };
@@ -129,7 +126,6 @@ struct msm_otg_platform_data {
  * @irq: IRQ number assigned for HSUSB controller.
  * @clk: clock struct of usb_hs_clk.
  * @pclk: clock struct of usb_hs_pclk.
- * @pclk_src: pclk source for voting.
  * @phy_reset_clk: clock struct of usb_phy_clk.
  * @core_clk: clock struct of usb_hs_core_clk.
  * @regs: ioremapped register base address.
@@ -150,7 +146,6 @@ struct msm_otg {
 	int irq;
 	struct clk *clk;
 	struct clk *pclk;
-	struct clk *pclk_src;
 	struct clk *phy_reset_clk;
 	struct clk *core_clk;
 	void __iomem *regs;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
