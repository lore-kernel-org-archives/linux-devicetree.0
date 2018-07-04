From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 1/3] documentation: Add compatibles for Amlogic Meson G12A pin controllers
Date: Wed, 4 Jul 2018 22:45:09 +0000
Message-ID: <20180704224511.29350-2-yixun.lan@amlogic.com>
References: <20180704224511.29350-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704224511.29350-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add new compatible name for Amlogic Meson G12A pin controllers

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 54ecb8ab7788..82ead40311f6 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -13,6 +13,8 @@ Required properties for the root node:
 		      "amlogic,meson-gxl-aobus-pinctrl"
 		      "amlogic,meson-axg-periphs-pinctrl"
 		      "amlogic,meson-axg-aobus-pinctrl"
+		      "amlogic,meson-g12a-periphs-pinctrl"
+		      "amlogic,meson-g12a-aobus-pinctrl"
  - reg: address and size of registers controlling irq functionality
 
 === GPIO sub-nodes ===
-- 
2.18.0
