From: Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v2 1/3] dt-bindings: iio/adc: Add a compatible string for JZ4770 SoC ADC
Date: Sat, 27 Jul 2019 21:59:38 +0200
Message-ID: <20190727195940.14010-1-contact@artur-rojek.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Cercueil <paul@crapouillou.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add a compatible string for the ADC controller present on
Ingenic JZ4770 SoC.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes:

v2: no change

 Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
index f01159f20d87..cd9048cf9dcf 100644
--- a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
@@ -5,6 +5,7 @@ Required properties:
 - compatible: Should be one of:
   * ingenic,jz4725b-adc
   * ingenic,jz4740-adc
+  * ingenic,jz4770-adc
 - reg: ADC controller registers location and length.
 - clocks: phandle to the SoC's ADC clock.
 - clock-names: Must be set to "adc".
-- 
2.22.0
