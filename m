From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: meson: Add drive-strength property
Date: Thu, 14 Mar 2019 17:37:24 +0100
Message-ID: <20190314163725.7918-2-jbrunet@baylibre.com>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314163725.7918-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Guillaume La Roque <glaroque@baylibre.com>

Add optional drive-strength property

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a47dd990a8d3..4e3d5a27c91c 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
 "bias-pull-up" and "bias-pull-down", described in file
 pinctrl-bindings.txt
 
+Optional properties :
+ - drive-strength: Drive strength for the specified pins in uA.
+
 === Example ===
 
 	pinctrl: pinctrl@c1109880 {
-- 
2.20.1
