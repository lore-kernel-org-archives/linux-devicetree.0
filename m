From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: meson: update register descriptions
Date: Thu, 17 Jan 2019 11:23:13 +0100
Message-ID: <20190117102315.1833-2-jbrunet@baylibre.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117102315.1833-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

like pull-enable, pull should be optional has this region is available on
every controllers. Also, the g12a feature a new region "ds" for the
drive-strength

All this region thing is one big mess. I suspect that there is only one
big GPIO region with holes in it. All registers between the current
regions reads '0' so it is probably just spare space to handle more pins.

Since we need to continue to handle the existing controllers, switching to
one single region now would not simplify things. However, if more
organisation layouts and features keep on being added, we may have to look
at this again

Fixes: 3cd3c83f6752 ("pinctrl: Add compatibles for Amlogic Meson G12A pin controllers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 82ead40311f6..a47dd990a8d3 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -23,11 +23,11 @@ The GPIO bank for the controller is represented as a sub-node and it acts as a
 GPIO controller.
 
 Required properties for sub-nodes are:
- - reg: should contain address and size for mux, pull-enable, pull and
-   gpio register sets
- - reg-names: an array of strings describing the "reg" entries. Must
-   contain "mux", "pull" and "gpio". "pull-enable" is optional and
-   when it is missing the "pull" registers are used instead
+ - reg: should contain a list of address and size, one tuple for each entry
+   in reg-names.
+ - reg-names: an array of strings describing the "reg" entries.
+   Must contain "mux" and "gpio".
+   May contain "pull", "pull-enable" and "ds" when appropriate.
  - gpio-controller: identifies the node as a gpio controller
  - #gpio-cells: must be 2
 
-- 
2.20.1
