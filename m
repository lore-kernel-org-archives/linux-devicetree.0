From: Chandrabhanu Mahapatra <cmahapatra@ti.com>
Subject: [PATCH 4/4] gpio/pca953x: register the device irq using appropriate api's
Date: Tue, 10 Jul 2012 19:06:19 +0530
Message-ID: <d0bd829760aba6c8e686f3b864b3831aa6bdcaa1.1341925681.git.cmahapatra@ti.com>
References: <cover.1341925681.git.cmahapatra@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1341925681.git.cmahapatra@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, linus.walleij@stericsson.com, rob.herring@calxeda.com
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, leed.aguilar@ti.com, Chandrabhanu Mahapatra <cmahapatra@ti.com>
List-Id: devicetree@vger.kernel.org

From: Leed Aguilar <leed.aguilar@ti.com>

Here, the implementation of registration of requested IRQs has been corrected
with appropiate api's. The gpio number is requested through gpio_request_one()
API and conversion of the gpio to irq is done using the gpio_to_irq() API.

Change-Id: I964145e2a280d6553ea2c05ea8049810a1983930
Signed-off-by: Leed Aguilar <leed.aguilar@ti.com>
Signed-off-by: Chandrabhanu Mahapatra <cmahapatra@ti.com>
---
 drivers/gpio/gpio-pca953x.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index c3ca7d8..27486da 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -509,7 +509,13 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 #endif
 		}
 
-		ret = request_threaded_irq(client->irq,
+		ret = gpio_request_one(client->irq, GPIOF_IN, "pca953x");
+		if (ret) {
+			dev_err(&client->dev, "gpio request failure\n");
+			goto out_failed;
+		}
+
+		ret = request_threaded_irq(gpio_to_irq(client->irq),
 					   NULL,
 					   pca953x_irq_handler,
 					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-- 
1.7.10
