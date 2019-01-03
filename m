Return-Path: <SRS0=5pMM=PL=bootlin.com=thomas.petazzoni@kernel.org>
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 2/2] gpio: pca953x: add support for pcal6416 type
Date: Thu,  3 Jan 2019 17:13:29 +0100
Message-Id: <20190103161329.15235-2-thomas.petazzoni@bootlin.com>
In-Reply-To: <20190103161329.15235-1-thomas.petazzoni@bootlin.com>
References: <20190103161329.15235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The NXP PCAL6416, documented at [1], is a variant of the PCA GPIO
expander with 16 GPIOs, and supporting an interrupt and the "extended"
features for interrupt, pull-up/pull-down configuration, etc.

[1] https://www.nxp.com/docs/en/data-sheet/PCAL6416A.pdf

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 83617fdc661d..82d69ab51976 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -88,6 +88,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pca9575", 16 | PCA957X_TYPE | PCA_INT, },
 	{ "pca9698", 40 | PCA953X_TYPE, },
 
+	{ "pcal6416", 16 | PCA953X_TYPE | PCA_INT | PCA_PCAL, },
 	{ "pcal6524", 24 | PCA953X_TYPE | PCA_INT | PCA_PCAL, },
 	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_INT | PCA_PCAL, },
 
-- 
2.20.1
