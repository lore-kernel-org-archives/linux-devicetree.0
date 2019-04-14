From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: iio: imx7d-adc: Add #io-channel-cells to required
Date: Sun, 14 Apr 2019 11:34:00 -0700
Message-ID: <20190414183403.21538-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add #io-channel-cells to list of required properties. Needed to be
able to reference that node by phandle.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
index 5c184b940669..f1f3a552459b 100644
--- a/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
@@ -10,6 +10,7 @@ Required properties:
 - clocks: The root clock of the ADC controller
 - clock-names: Must contain "adc", matching entry in the clocks property
 - vref-supply: The regulator supply ADC reference voltage
+- #io-channel-cells: Must be 1 as per ../iio-bindings.txt
 
 Example:
 adc1: adc@30610000 {
@@ -19,4 +20,5 @@ adc1: adc@30610000 {
 	clocks = <&clks IMX7D_ADC_ROOT_CLK>;
 	clock-names = "adc";
 	vref-supply = <&reg_vcc_3v3_mcu>;
+	#io-channel-cells = <1>;
 };
-- 
2.20.1
