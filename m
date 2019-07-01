From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 07/11] dt-bindings: media: meson-ao-cec: add SM1 compatible
Date: Mon,  1 Jul 2019 12:47:01 +0200
Message-ID: <20190701104705.18271-8-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, khilman@baylibre.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add AO-CEC compatible string for the Amlogic SM1 SoC family,
a derivate of the G12A AO-CECB controller.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/media/meson-ao-cec.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
index c67fc41d4aa2..ad92ee41c0dd 100644
--- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
+++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
@@ -5,10 +5,12 @@ to handle communication between HDMI connected devices over the CEC bus.
 
 Required properties:
   - compatible : value should be following depending on the SoC :
-	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+	For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
 	"amlogic,meson-gx-ao-cec"
 	For G12A (AO_CEC_B module) :
 	"amlogic,meson-g12a-ao-cec"
+	For SM1 (AO_CEC_B module) :
+	"amlogic,meson-sm1-ao-cec"
 
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
@@ -16,9 +18,9 @@ Required properties:
   - interrupts : AO-CEC interrupt number to the CPU.
   - clocks : from common clock binding: handle to AO-CEC clock.
   - clock-names : from common clock binding, must contain :
-		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+		For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
 		- "core"
-		For G12A (AO_CEC_B module) :
+		For G12A, SM1 (AO_CEC_B module) :
 		- "oscin"
 		corresponding to entry in the clocks property.
   - hdmi-phandle: phandle to the HDMI controller
-- 
2.21.0
