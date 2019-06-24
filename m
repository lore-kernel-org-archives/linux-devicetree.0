From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH V3 5/5] dt-bindings: iio: adc: Add buffered input property
Date: Mon, 24 Jun 2019 11:08:45 +0300
Message-ID: <20190624080845.18537-5-mircea.caprioru@analog.com>
References: <20190624080845.18537-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624080845.18537-1-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

This patch adds the buffered mode device tree property for positive and
negative inputs. Each option can be enabled independently.

In buffered mode, the input channel feeds into a high impedance input stage
of the buffer amplifier. Therefore, the input can tolerate significant
source impedances and is tailored for direct connection to external
resistive type sensors such as strain gages or RTDs.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---

Changelog v3:
- added this separate commit for adi,buffered-positive and negative
  properties

 .../devicetree/bindings/iio/adc/adi,ad7124.yaml       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
index 1b3d84d08609..cf494a08b837 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
@@ -100,6 +100,14 @@ patternProperties:
         description: see Documentation/devicetree/bindings/iio/adc/adc.txt
         type: boolean
 
+      adi,buffered-positive:
+        description: Enable buffered mode for positive input.
+        type: boolean
+
+      adi,buffered-negative:
+        description: Enable buffered mode for negative input.
+        type: boolean
+
     required:
       - reg
       - diff-channels
@@ -123,6 +131,7 @@ examples:
         reg = <0>;
         diff-channels = <0 1>;
         adi,reference-select = <0>;
+        adi,buffered-positive;
       };
 
       channel@1 {
@@ -130,6 +139,8 @@ examples:
         bipolar;
         diff-channels = <2 3>;
         adi,reference-select = <0>;
+        adi,buffered-positive;
+        adi,buffered-negative;
       };
 
       channel@2 {
-- 
2.17.1
