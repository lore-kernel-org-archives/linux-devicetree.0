From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 5/7] rtc: sun6i: Switch to devm_rtc_device_register
Date: Mon, 23 Jan 2017 11:41:50 +0100
Message-ID: <fa6f39ee82429e1851597202b0706a8bd9871bc7.1485168100.git-series.maxime.ripard@free-electrons.com>
References: <cover.6bd4d4760c24d09845ad09c212fcd487d78da5ad.1485168100.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.6bd4d4760c24d09845ad09c212fcd487d78da5ad.1485168100.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.6bd4d4760c24d09845ad09c212fcd487d78da5ad.1485168100.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.6bd4d4760c24d09845ad09c212fcd487d78da5ad.1485168100.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we have a devm variant of rtc_device_register, switch to it.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/rtc/rtc-sun6i.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 37f65c50ab2d..613f42ade533 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -543,8 +543,8 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 
 	clk_prepare_enable(chip->losc);
 
-	chip->rtc = rtc_device_register("rtc-sun6i", &pdev->dev,
-					&sun6i_rtc_ops, THIS_MODULE);
+	chip->rtc = devm_rtc_device_register(&pdev->dev, "rtc-sun6i",
+					     &sun6i_rtc_ops, THIS_MODULE);
 	if (IS_ERR(chip->rtc)) {
 		dev_err(&pdev->dev, "unable to register device\n");
 		return PTR_ERR(chip->rtc);
@@ -555,15 +555,6 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int sun6i_rtc_remove(struct platform_device *pdev)
-{
-	struct sun6i_rtc_dev *chip = platform_get_drvdata(pdev);
-
-	rtc_device_unregister(chip->rtc);
-
-	return 0;
-}
-
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ /* sentinel */ },
@@ -572,7 +563,6 @@ MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
 
 static struct platform_driver sun6i_rtc_driver = {
 	.probe		= sun6i_rtc_probe,
-	.remove		= sun6i_rtc_remove,
 	.driver		= {
 		.name		= "sun6i-rtc",
 		.of_match_table = sun6i_rtc_dt_ids,
-- 
git-series 0.8.11
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
