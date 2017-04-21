From: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 2/2] gpio: DT bindings, move tca9554 from pcf857x to pca953x
Date: Fri, 21 Apr 2017 14:46:31 +0200
Message-ID: <20170421124631.19269-2-anders@chargestorm.se>
References: <20170421124631.19269-1-anders@chargestorm.se>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170421124631.19269-1-anders@chargestorm.se>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com
Cc: Anders Darander <anders@chargestorm.se>
List-Id: devicetree@vger.kernel.org

The TCA9554 is similar to the PCA9554. Update the DT binding docs.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index e63935710011..7f57271df2bc 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -26,6 +26,7 @@ Required properties:
 	ti,tca6416
 	ti,tca6424
 	ti,tca9539
+	ti,tca9554
 	onsemi,pca9654
 	exar,xra1202
 
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt b/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
index ada4e2973323..7d3bd631d011 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
@@ -25,7 +25,6 @@ Required Properties:
     - "nxp,pcf8574": For the NXP PCF8574
     - "nxp,pcf8574a": For the NXP PCF8574A
     - "nxp,pcf8575": For the NXP PCF8575
-    - "ti,tca9554": For the TI TCA9554
 
   - reg: I2C slave address.
 
-- 
2.11.0

