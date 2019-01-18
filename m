From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: amlogic: add new compatible devices to clk_measure
Date: Fri, 18 Jan 2019 11:34:20 +0100
Message-ID: <20190118103423.15075-2-jbrunet@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118103423.15075-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Add the axg and g12a SoC family compatible to the clock measure bindings

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
index 205a54bcd7c7..6bf6b43f8dd8 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
+++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
@@ -9,6 +9,8 @@ Required properties:
 			"amlogic,meson-gx-clk-measure" for GX SoCs
 			"amlogic,meson8-clk-measure" for Meson8 SoCs
 			"amlogic,meson8b-clk-measure" for Meson8b SoCs
+			"amlogic,meson-axg-clk-measure" for AXG SoCs
+			"amlogic,meson-g12a-clk-measure" for G12a SoCs
 - reg: base address and size of the Clock Measurer register space.
 
 Example:
-- 
2.20.1
