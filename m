From: Toby Smith <toby@tismith.id.au>
Subject: [PATCH 2/2] gpio: pca953x: request a shared interrupt
Date: Wed, 30 Apr 2014 18:01:41 +1000
Message-ID: <8d517ae1adc265643ff9de4b1a2d1b65a4bb6997.1398844809.git.toby@tismith.id.au>
References: <cover.1398844809.git.toby@tismith.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1398844809.git.toby@tismith.id.au>
In-Reply-To: <cover.1398844809.git.toby@tismith.id.au>
References: <cover.1398844809.git.toby@tismith.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Toby Smith <toby@tismith.id.au>
List-Id: devicetree@vger.kernel.org

Request a shared interrupt when requesting a pca953x GPIO interrupt

Signed-off-by: Toby Smith <toby@tismith.id.au>
---
 drivers/gpio/gpio-pca953x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 83cc2c8..6398f8a 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -586,7 +586,8 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 					client->irq,
 					   NULL,
 					   pca953x_irq_handler,
-					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					   IRQF_TRIGGER_LOW | IRQF_ONESHOT |
+						   IRQF_SHARED,
 					   dev_name(&client->dev), chip);
 		if (ret) {
 			dev_err(&client->dev, "failed to request irq %d\n",
-- 
1.8.3.2
