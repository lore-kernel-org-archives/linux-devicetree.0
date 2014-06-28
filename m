From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] pinctrl: pinctrl-imx27.c:  Cleaning up remove a struct that is unused
Date: Sat, 28 Jun 2014 23:48:40 +0200
Message-ID: <1403992120-8160-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Removal of a struct that is never used

This was found using a static code analysis program called cppcheck

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/pinctrl/pinctrl-imx27.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-imx27.c b/drivers/pinctrl/pinctrl-imx27.c
index 417c992..27ae7ce 100644
--- a/drivers/pinctrl/pinctrl-imx27.c
+++ b/drivers/pinctrl/pinctrl-imx27.c
@@ -440,12 +440,6 @@ static struct of_device_id imx27_pinctrl_of_match[] = {
 	{ /* sentinel */ }
 };
 
-struct imx27_pinctrl_private {
-	int num_gpio_childs;
-	struct platform_device **gpio_dev;
-	struct mxc_gpio_platform_data *gpio_pdata;
-};
-
 static int imx27_pinctrl_probe(struct platform_device *pdev)
 {
 	return imx1_pinctrl_core_probe(pdev, &imx27_pinctrl_info);
-- 
1.7.10.4
