From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/1] dt-binding: iio: remove rst node from NPCM ADC document
Date: Sun, 10 Feb 2019 22:47:49 +0200
Message-ID: <20190210204749.381445-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

Remove NPCM7xx rst node for preparing the NPCM ADC
document to describe ADC reset binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt          | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
index 1b8132cd9060..eb939fe77836 100644
--- a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
@@ -14,11 +14,6 @@ Optional properties:
 			   vref-supply is not added the ADC will use internal voltage
 			   reference.
 
-Required Node in the NPCM7xx BMC:
-An additional register is present in the NPCM7xx SOC which is
-assumed to be in the same device tree, with and marked as
-compatible with "nuvoton,npcm750-rst".
-
 Example:
 
 adc: adc@f000c000 {
@@ -27,9 +22,3 @@ adc: adc@f000c000 {
 	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 	clocks = <&clk NPCM7XX_CLK_ADC>;
 };
-
-rst: rst@f0801000 {
-	compatible = "nuvoton,npcm750-rst", "syscon",
-	"simple-mfd";
-	reg = <0xf0801000 0x6C>;
-};
-- 
2.14.1
