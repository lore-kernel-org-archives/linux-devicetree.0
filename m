From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: Add Libre Computer Board
Date: Fri, 16 Jun 2017 14:06:47 +0200
Message-ID: <20170616120648.23320-3-jbrunet@baylibre.com>
References: <20170616120648.23320-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170616120648.23320-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add bindings documentation for the Libre Computer Board from Imprecision
Systems

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 5c01e65951fa..d1c77d7ae11d 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -51,6 +51,7 @@ Board compatible values (alphabetically, grouped by SoC):
 
   - "amlogic,p212" (Meson gxl s905x)
   - "hwacom,amazetv" (Meson gxl s905x)
+  - "imprecision,librecomputer" (Meson gxl s905x)
   - "khadas,vim" (Meson gxl s905x)
 
   - "amlogic,p230" (Meson gxl s905d)
-- 
2.9.4
