From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] dt-bindings: arm: amlogic: fix x96-max/sei510 section in amlogic.yaml
Date: Tue,  6 Aug 2019 09:55:20 +0200
Message-ID: <20190806075520.14652-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Christian Hewitt <christianshewitt@gmail.com>

Move amediatech,x96-max and seirobotics,sei510 to the S905D2 section and
update the S905D2 description to S905D2/X2/Y2.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 325c6fd3566d..4668064dd7e5 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -91,13 +91,11 @@ properties:
       - description: Boards with the Amlogic Meson GXL S905X SoC
         items:
           - enum:
-              - amediatech,x96-max
               - amlogic,p212
               - hwacom,amazetv
               - khadas,vim
               - libretech,cc
               - nexbox,a95x
-              - seirobotics,sei510
           - const: amlogic,s905x
           - const: amlogic,meson-gxl
 
@@ -129,10 +127,12 @@ properties:
           - const: amlogic,a113d
           - const: amlogic,meson-axg
 
-      - description: Boards with the Amlogic Meson G12A S905D2 SoC
+      - description: Boards with the Amlogic Meson G12A S905D2/X2/Y2 SoC
         items:
           - enum:
+              - amediatech,x96-max
               - amlogic,u200
+              - seirobotics,sei510
           - const: amlogic,g12a
 
       - description: Boards with the Amlogic Meson G12B S922X SoC
-- 
2.22.0
