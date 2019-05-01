From: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Subject: [PATCH 2/6] dt-bindings: iio: ad7949: Add adi,reference-select
Date: Wed, 1 May 2019 14:30:16 -0500
Message-ID: <CALMrGWUsr4+E3bYSj8hGvxDhZRZ1xiwVtd-x4RnOf3En6xMq5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, michael.hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>, Brandon Maier <brandon.maier@rockwellcollins.com>
List-Id: devicetree@vger.kernel.org

>From d228a1a119e33aff91f481fb8ab301a027b5a4ac Mon Sep 17 00:00:00 2001
From: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Date: Thu, 25 Apr 2019 15:22:00 -0500
Subject: [PATCH 2/6] dt-bindings: iio: ad7949: Add adi,reference-select

Adding optional parameter to AD7949 to specify the source for the
reference voltage signal. Default value is maintaned with option '6' to
match previous version of driver.

Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
---
Sorry about the re-sends - GMail inserted HTML on me and it bounced from vger.
---
 .../devicetree/bindings/iio/adc/ad7949.txt         | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ad7949.txt
b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
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
+ adi,reference-select = <2>;
  vref-supply = <&vdd_supply>;
 };
+
+adc@0 {
+ compatible = "adi,ad7949";
+ reg = <0>;
+ adi,reference-select = <0>;
+};
-- 
1.9.1
