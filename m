From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/6] dt-bindings: arm: amlogic: add support for the Khadas VIM3
Date: Wed, 31 Jul 2019 14:39:58 +0200
Message-ID: <20190731124000.22072-5-narmstrong@baylibre.com>
References: <20190731124000.22072-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731124000.22072-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, devicetree@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Christian Hewitt <christianshewitt@gmail.com>

The Khadas VIM3 uses the Amlogic S922X or A311S SoC, both based on the
Amlogic G12B SoC family, on a board with the same form factor as the
VIM/VIM2 models. It ships in two variants; basic and
pro which differ in RAM and eMMC size:

- 2GB (basic) or 4GB (pro) LPDDR4 RAM
- 16GB (basic) or 32GB (pro) eMMC 5.1 storage
- 16MB SPI flash
- 10/100/1000 Base-T Ethernet
- AP6398S Wireless (802.11 a/b/g/n/ac, BT5.0)
- HDMI 2.1 video
- 1x USB 2.0 + 1x USB 3.0 ports
- 1x USB-C (power) with USB 2.0 OTG
- 3x LED's (1x red, 1x blue, 1x white)
- 3x buttons (power, function, reset)
- IR receiver
- M2 socket with PCIe, USB, ADC & I2C
- 40pin GPIO Header
- 1x micro SD card slot

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index efa032d12402..04a2b0ef34c6 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -137,6 +137,8 @@ properties:
 
       - description: Boards with the Amlogic Meson G12B A311D SoC
         items:
+          - enum:
+              - khadas,vim3
           - const: amlogic,a311d
           - const: amlogic,g12b
 
@@ -144,6 +146,7 @@ properties:
         items:
           - enum:
               - hardkernel,odroid-n2
+              - khadas,vim3
           - const: amlogic,s922x
           - const: amlogic,g12b
 
-- 
2.22.0
