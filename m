From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 1/5] pinctrl: aspeed: dt: Fix compatibles for the System Control Unit
Date: Tue, 20 Dec 2016 18:05:47 +1030
Message-ID: <20161220073551.28522-2-andrew@aj.id.au>
References: <20161220073551.28522-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161220073551.28522-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Reference the SoC-specific compatible string in the examples as
required.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
index 2ad18c4ea55c..b2efb73337c6 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
@@ -11,9 +11,14 @@ Required properties:
 		"aspeed,ast2500-pinctrl"
 		"aspeed,g5-pinctrl"
 
-The pin controller node should be a child of a syscon node with the required
+The pin controller node should be the child of a syscon node with the required
 property:
-- compatible: "syscon", "simple-mfd"
+
+- compatible : 		Should be one of the following:
+			"aspeed,ast2400-scu", "syscon", "simple-mfd"
+			"aspeed,g4-scu", "syscon", "simple-mfd"
+			"aspeed,ast2500-scu", "syscon", "simple-mfd"
+			"aspeed,g5-scu", "syscon", "simple-mfd"
 
 Refer to the the bindings described in
 Documentation/devicetree/bindings/mfd/syscon.txt
@@ -50,7 +55,7 @@ TIMER7 TIMER8 VGABIOSROM
 Examples:
 
 syscon: scu@1e6e2000 {
-	compatible = "syscon", "simple-mfd";
+	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
 	reg = <0x1e6e2000 0x1a8>;
 
 	pinctrl: pinctrl {
-- 
2.9.3
