From: Mesih Kilinc <mesihkilinc@gmail.com>
Subject: [RFC PATCH v2 09/14] dt-bindings: pinctrl: Add Allwinner suniv F1C100s pinctrl
Date: Sun, 18 Nov 2018 17:17:08 +0300
Message-ID: <d54a4f7e2f33742145394bc2d8c3afb4013b860d.1542546735.git.mesihkilinc@gmail.com>
References: <cover.1542546735.git.mesihkilinc@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1542546735.git.mesihkilinc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Julian Calaby <julian.calaby@gmail.com>
List-Id: devicetree@vger.kernel.org

Add compatible string for Allwinner suniv F1C100s SoC's pinctrl.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index 258a464..5086734 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -7,6 +7,7 @@ the pins includes drive strength and pull-up.
 
 Required properties:
 - compatible: Should be one of the following (depending on your SoC):
+  "allwinner,suniv-f1c100s-pinctrl"
   "allwinner,sun4i-a10-pinctrl"
   "allwinner,sun5i-a10s-pinctrl"
   "allwinner,sun5i-a13-pinctrl"
-- 
2.7.4
