From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/3] dt-bindings: clk: meson: add main controller clock input
Date: Thu, 29 Nov 2018 17:45:23 +0100
Message-ID: <20181129164524.18670-3-jbrunet@baylibre.com>
References: <20181129164524.18670-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129164524.18670-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the clock input of the main clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index e950599566a9..79454869f96d 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -9,6 +9,8 @@ Required Properties:
 		"amlogic,gxbb-clkc" for GXBB SoC,
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
+- clocks: phandle to the input clock of the controller, presumably the
+	  platform xtal.
 
 - #clock-cells: should be 1.
 
@@ -31,6 +33,7 @@ sysctrl: system-controller@0 {
 	clkc: clock-controller {
 		#clock-cells = <1>;
 		compatible = "amlogic,gxbb-clkc";
+		clocks = <&xtal>
 	};
 };
 
-- 
2.19.1
