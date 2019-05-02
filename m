Return-Path: <SRS0=iNMp=TC=rockwellcollins.com=adam.michaelis@kernel.org>
From: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Subject: [PATCH v2 4/6] dt-bindings: iio: ad7949: Add cfg-readback option
Date: Thu,  2 May 2019 11:14:30 -0500
Message-Id: <1556813672-49861-4-git-send-email-adam.michaelis@rockwellcollins.com>
In-Reply-To: <1556813672-49861-1-git-send-email-adam.michaelis@rockwellcollins.com>
References: <1556813672-49861-1-git-send-email-adam.michaelis@rockwellcollins.com>
To: linux-iio@vger.kernel.org
Cc: lars@metafoo.de, michael.hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com, Adam Michaelis <adam.michaelis@rockwellcollins.com>
List-ID: <devicetree@vger.kernel.org>

Adding optional parameter to the ad7949 to indicate that the part should
be configured to include the configuration register value used when
acquiring the current sample value.

Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
---
	V2: Add some defines to reduce use of magic numbers.
---
 Documentation/devicetree/bindings/iio/adc/ad7949.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ad7949.txt b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
index 14ee9a2cb2a5..cd3572828243 100644
--- a/Documentation/devicetree/bindings/iio/adc/ad7949.txt
+++ b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
@@ -18,6 +18,8 @@ Optional properties:
    7: External reference, temperature sensor disabled, buffer enabled
  - vref-supply: The regulator supply for ADC reference voltage. Required
  if external reference selected by 'adi,reference-select'.
+ - adi,cfg-readback: If defined, set bit in configuration register to
+ read-back the configuration used for the current sample value.
 
 Examples:
 adc@0 {
@@ -32,3 +34,10 @@ adc@0 {
 	reg = <0>;
 	adi,reference-select = <0>;
 };
+
+adc@0 {
+	compatible = "adi,ad7949";
+	reg = <0>;
+	adi,reference-select = <1>;
+	adi,cfg-readback;
+};
-- 
1.9.1
