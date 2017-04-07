From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/4] pinctrl: aspeed: Document pinconf in devicetree bindings
Date: Fri,  7 Apr 2017 22:27:10 +0930
Message-ID: <20170407125713.15678-2-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170407125713.15678-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 40 +++++++++++++++++-----
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
index b98e6f030da8..ca01710ee29a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
@@ -34,13 +34,28 @@ Documentation/devicetree/bindings/mfd/syscon.txt
 Subnode Format
 ==============
 
-The required properties of child nodes are (as defined in pinctrl-bindings):
-- function
-- groups
+The required properties of pinmux child nodes are:
+- function: the mux function to select
+- groups  : the list of groups to select with this function
 
-Each function has only one associated pin group. Each group is named by its
-function. The following values for the function and groups properties are
-supported:
+Required properties of pinconf child nodes are:
+- groups: A list of groups to select (either this or "pins" must be
+          specified)
+- pins  : A list of ball names as strings, eg "D14" (either this or "groups"
+          must be specified)
+
+Optional properties of pinconf child nodes are:
+- bias-disable  : disable any pin bias
+- bias-pull-down: pull down the pin
+- drive-strength: sink or source at most X mA
+
+Definitions are as specified in
+Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt, with any
+further limitations as described above.
+
+For pinmux, each mux function has only one associated pin group. Each group is
+named by its function. The following values for the function and groups
+properties are supported:
 
 aspeed,ast2400-pinctrl, aspeed,g4-pinctrl:
 
@@ -90,6 +105,11 @@ syscon: scu@1e6e2000 {
 			function = "I2C3";
 			groups = "I2C3";
 		};
+
+		pinctrl_gpioh0_unbiased_default: gpioh0 {
+			pins = "A8";
+			bias-disable;
+		};
 	};
 };
 
@@ -110,6 +130,11 @@ ahb {
 					function = "I2C3";
 					groups = "I2C3";
 				};
+
+				pinctrl_gpioh0_unbiased_default: gpioh0 {
+					pins = "A18";
+					bias-disable;
+				};
 			};
 		};
 
@@ -143,6 +168,3 @@ ahb {
 		};
 	};
 };
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices.
-- 
2.9.3

