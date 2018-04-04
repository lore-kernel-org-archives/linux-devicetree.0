From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 1/5] gpio: pca953x: set the PCA_PCAL flag also when matching by DT
Date: Wed,  4 Apr 2018 21:00:20 +0200
Message-ID: <077c220b9ce1853ed725d85244165d05bff75b36.1522868422.git.hns@goldelico.com>
References: <cover.1522868422.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1522868422.git.hns@goldelico.com>
In-Reply-To: <cover.1522868422.git.hns@goldelico.com>
References: <cover.1522868422.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: galak@codeaurora.org, andy.shevchenko@gmail.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com, "H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

The of_device_table is missing the PCA_PCAL flag so the
pcal6524 would be operated in tca6424 compatibility mode which
does not handle the new interrupt mask registers.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpio/gpio-pca953x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d2ead4b1cf61..4a075619b93e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -936,8 +936,10 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca9575", .data = OF_957X(16, PCA_INT), },
 	{ .compatible = "nxp,pca9698", .data = OF_953X(40, 0), },
 
-	{ .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_INT), },
-	{ .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_INT |
+							    PCA_PCAL), },
+	{ .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_INT |
+							     PCA_PCAL), },
 
 	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
 	{ .compatible = "maxim,max7312", .data = OF_953X(16, PCA_INT), },
-- 
2.12.2
