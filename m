From: Mesih Kilinc <mesihkilinc@gmail.com>
Subject: [RFC PATCH v3 02/17] dt-bindings: arm: Add new Allwinner ARMv5 F1C100s SoC
Date: Wed, 21 Nov 2018 21:30:35 +0300
Message-ID: <4c5ee3bf877ba0de233ec400ca27f3a91014a737.1542824904.git.mesihkilinc@gmail.com>
References: <cover.1542824904.git.mesihkilinc@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1542824904.git.mesihkilinc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Julian Calaby <julian.calaby@gmail.com>
List-Id: devicetree@vger.kernel.org

Add new Allwinner ARMv5 F1C100s SoC's compatible string

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
index e4beec3..f9ddc05 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi.txt
@@ -18,4 +18,5 @@ using one of the following compatible strings:
   allwinner,sun8i-v3s
   allwinner,sun9i-a80
   allwinner,sun50i-a64
+  allwinner,suniv-f1c100s
   nextthing,gr8
-- 
2.7.4
