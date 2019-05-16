From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: meson: add output support in pinconf
Date: Thu, 16 May 2019 17:13:38 +0200
Message-ID: <20190516151339.25846-2-jbrunet@baylibre.com>
References: <20190516151339.25846-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516151339.25846-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

add support for the pinconf DT property output-enable, output-disable,
output-low and output-high in the meson pinctrl driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a7618605bf1e..10dc4f7176ca 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -47,9 +47,15 @@ Required properties for pinmux nodes are:
 Required properties for configuration nodes:
  - pins: a list of pin names
 
-Configuration nodes support the generic properties "bias-disable",
-"bias-pull-up" and "bias-pull-down", described in file
-pinctrl-bindings.txt
+Configuration nodes support the following generic properties, as
+described in file pinctrl-bindings.txt:
+ - "bias-disable"
+ - "bias-pull-up"
+ - "bias-pull-down"
+ - "output-enable"
+ - "output-disable"
+ - "output-low"
+ - "output-high"
 
 Optional properties :
  - drive-strength-microamp: Drive strength for the specified pins in uA.
-- 
2.20.1
