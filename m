From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 2/3] dt-bindings: iio: adc: document the Meson AXG support
Date: Mon, 26 Mar 2018 16:46:28 +0800
Message-ID: <20180326084629.100070-3-yixun.lan@amlogic.com>
References: <20180326084629.100070-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180326084629.100070-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: Xingyu Chen <xingyu.chen@amlogic.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Xingyu Chen <xingyu.chen@amlogic.com>

Update the documentation to expicitly support the Meson-AXG SoC.

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
---
 Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
index 1e6ee3deb4fa..d1acd5ea2737 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
@@ -7,6 +7,7 @@ Required properties:
 			- "amlogic,meson-gxbb-saradc" for GXBB
 			- "amlogic,meson-gxl-saradc" for GXL
 			- "amlogic,meson-gxm-saradc" for GXM
+			- "amlogic,meson-axg-saradc" for AXG
 		along with the generic "amlogic,meson-saradc"
 - reg:		the physical base address and length of the registers
 - interrupts:	the interrupt indicating end of sampling
-- 
2.15.1
