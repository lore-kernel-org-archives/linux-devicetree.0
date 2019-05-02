Return-Path: <SRS0=iNMp=TC=rockwellcollins.com=adam.michaelis@kernel.org>
From: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Subject: [PATCH v2 2/6] dt-bindings: iio: ad7949: Add adi,reference-select
Date: Thu,  2 May 2019 11:14:28 -0500
Message-Id: <1556813672-49861-2-git-send-email-adam.michaelis@rockwellcollins.com>
In-Reply-To: <1556813672-49861-1-git-send-email-adam.michaelis@rockwellcollins.com>
References: <1556813672-49861-1-git-send-email-adam.michaelis@rockwellcollins.com>
To: linux-iio@vger.kernel.org
Cc: lars@metafoo.de, michael.hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com, Adam Michaelis <adam.michaelis@rockwellcollins.com>
List-ID: <devicetree@vger.kernel.org>

Adding optional parameter to AD7949 to specify the source for the
reference voltage signal. Default value is maintaned with option '6' to
match previous version of driver.

Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
---
	V2: Add some defines to reduce use of magic numbers.
---
 .../devicetree/bindings/iio/adc/ad7949.txt         | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ad7949.txt b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
index c7f5057356b1..14ee9a2cb2a5 100644
--- a/Documentation/devicetree/bindings/iio/adc/ad7949.txt
+++ b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
@@ -6,11 +6,29 @@ Required properties:
 	* "adi,ad7682"
 	* "adi,ad7689"
  - reg: spi chip select number for the device
- - vref-supply: The regulator supply for ADC reference voltage
 
-Example:
+Optional properties:
+ - adi,reference-select: Select the reference voltage source to use
+ when converting the input voltages. Valid values are:
+   0: Internal 2.5V reference; temperature sensor enabled
+   1: Internal 4.096V reference; temperature sensor enabled
+   2: External reference, temperature sensor enabled, no buffer
+   3: External reference, temperature sensor enabled, buffer enabled
+   6: External reference, temperature sensor disabled, no buffer
+   7: External reference, temperature sensor disabled, buffer enabled
+ - vref-supply: The regulator supply for ADC reference voltage. Required
+ if external reference selected by 'adi,reference-select'.
+
+Examples:
 adc@0 {
 	compatible = "adi,ad7949";
 	reg = <0>;
+	adi,reference-select = <2>;
 	vref-supply = <&vdd_supply>;
 };
+
+adc@0 {
+	compatible = "adi,ad7949";
+	reg = <0>;
+	adi,reference-select = <0>;
+};
-- 
1.9.1
