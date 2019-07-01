From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 05/11] dt-bindings: soc: amlogic: clk-measure: Add SM1 compatible
Date: Mon,  1 Jul 2019 12:46:59 +0200
Message-ID: <20190701104705.18271-6-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, khilman@baylibre.com, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the Amlogic SM1 Compatible for the clk-measurer IP.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
index 6bf6b43f8dd8..3dd563cec794 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
+++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
@@ -11,6 +11,7 @@ Required properties:
 			"amlogic,meson8b-clk-measure" for Meson8b SoCs
 			"amlogic,meson-axg-clk-measure" for AXG SoCs
 			"amlogic,meson-g12a-clk-measure" for G12a SoCs
+			"amlogic,meson-sm1-clk-measure" for SM1 SoCs
 - reg: base address and size of the Clock Measurer register space.
 
 Example:
-- 
2.21.0
