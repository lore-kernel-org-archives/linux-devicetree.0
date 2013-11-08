From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: [PATCH v5 1/7] gpio: davinci: remove unnecessary printk
Date: Fri,  8 Nov 2013 15:41:44 +0530
Message-ID: <1383905510-31760-2-git-send-email-prabhakar.csengg@gmail.com>
References: <1383905510-31760-1-git-send-email-prabhakar.csengg@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1383905510-31760-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Prabhakar Lad <prabhakar.csengg@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

the devm_*() helper prints error messages in case of
errors no need to do the same in the driver.

Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
---
 drivers/gpio/gpio-davinci.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 84be701..7230c43 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -389,11 +389,9 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	}
 
 	clk = devm_clk_get(dev, "gpio");
-	if (IS_ERR(clk)) {
-		printk(KERN_ERR "Error %ld getting gpio clock?\n",
-		       PTR_ERR(clk));
+	if (IS_ERR(clk))
 		return PTR_ERR(clk);
-	}
+
 	clk_prepare_enable(clk);
 
 	/*
-- 
1.7.9.5

