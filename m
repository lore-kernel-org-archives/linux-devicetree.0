Return-Path: <SRS0=5pMM=PL=bootlin.com=thomas.petazzoni@kernel.org>
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: gpio: pca953x: document the nxp,pcal6416
Date: Thu,  3 Jan 2019 17:13:28 +0100
Message-Id: <20190103161329.15235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The NXP PCAL6416 is a variant of the PCA GPIO expander, with 16 GPIOs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index a3f95d7b6c55..2fb1bfec4f13 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -16,6 +16,7 @@ Required properties:
 	nxp,pca9574
 	nxp,pca9575
 	nxp,pca9698
+	nxp,pcal6416
 	nxp,pcal6524
 	nxp,pcal9555a
 	maxim,max7310
-- 
2.20.1
