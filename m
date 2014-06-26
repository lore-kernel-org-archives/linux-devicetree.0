From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] gpio: gpio-twl4030.c:  Cleaning up null pointer checks that could never happen
Date: Thu, 26 Jun 2014 18:17:21 +0200
Message-ID: <1403799441-20362-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Removal of null pointer checks that could never happen

This was found using a static code analysis program called cppcheck

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/gpio/gpio-twl4030.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 3ebb1a5..826da37 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -554,7 +554,7 @@ no_irqs:
 
 	platform_set_drvdata(pdev, priv);
 
-	if (pdata && pdata->setup) {
+	if (pdata->setup) {
 		int status;
 
 		status = pdata->setup(&pdev->dev, priv->gpio_chip.base,
-- 
1.7.10.4
