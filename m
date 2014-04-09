From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH 02/15] ARM: sunxi: dt: document pinctrl clock related properties
Date: Wed,  9 Apr 2014 15:51:05 +0200
Message-ID: <1397051478-4113-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1397051478-4113-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397051478-4113-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Document clocks and clock-names properties for the pinctrl driver.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index 0e7e9a1..b3e5c30 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -15,6 +15,10 @@ Required properties:
   "allwinner,sun7i-a20-pinctrl"
 - reg: Should contain the register physical address and length for the
   pin controller.
+- clocks: Should contain a list of gate clk needed by the pin controller
+- clock-names: Should at least contain "pio_clk" which is used by the
+  base pin controller. In case of sun6i-a31 SoC, this property should
+  also contain the "pioL_clk" string.
 
 Please refer to pinctrl-bindings.txt in this directory for details of the
 common pinctrl bindings used by client devices.
-- 
1.8.3.2
