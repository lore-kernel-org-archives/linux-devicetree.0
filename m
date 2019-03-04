From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: iio: adc: document the Meson G12A support
Date: Mon,  4 Mar 2019 12:12:16 +0100
Message-ID: <20190304111217.882-2-narmstrong@baylibre.com>
References: <20190304111217.882-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304111217.882-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the documentation to expicitly support the Meson-G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/iio/adc/amlogic,meson-saradc.txt         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
index 325090e43ce6..0d134e0ac600 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
@@ -9,6 +9,7 @@ Required properties:
 			- "amlogic,meson-gxl-saradc" for GXL
 			- "amlogic,meson-gxm-saradc" for GXM
 			- "amlogic,meson-axg-saradc" for AXG
+			- "amlogic,meson-g12a-saradc" for AXG
 		along with the generic "amlogic,meson-saradc"
 - reg:		the physical base address and length of the registers
 - interrupts:	the interrupt indicating end of sampling
-- 
2.20.1
