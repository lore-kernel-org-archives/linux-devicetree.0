From: "Kumar, Anil" <anilkumar.v@ti.com>
Subject: [PATCH] pinctrl: pinctrl-single: fix the binding documentation
Date: Mon, 11 Feb 2013 08:16:03 +0530
Message-ID: <1360550763-5404-1-git-send-email-anilkumar.v@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, tony@atomide.com, linus.walleij@linaro.org, b-cousson@ti.com, anilkumar.v@ti.com
List-Id: devicetree@vger.kernel.org

As there are no use of #address-cells and #size-cells properties
in pinctrl-single driver DT node. Fix pinctrl-single binding documentation
to remove these properties.

Signed-off-by: Kumar, Anil <anilkumar.v@ti.com>
---
Tested on da850 EVM.

:100644 100644 2c81e45... c6384e2... M	Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
 .../devicetree/bindings/pinctrl/pinctrl-single.txt |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
index 2c81e45..c6384e2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
@@ -50,8 +50,6 @@ Example:
 pmx_core: pinmux@4a100040 {
 	compatible = "pinctrl-single";
 	reg = <0x4a100040 0x0196>;
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-single,register-width = <16>;
 	pinctrl-single,function-mask = <0xffff>;
 };
@@ -60,8 +58,6 @@ pmx_core: pinmux@4a100040 {
 pmx_wkup: pinmux@4a31e040 {
 	compatible = "pinctrl-single;
 	reg = <0x4a31e040 0x0038>;
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-single,register-width = <16>;
 	pinctrl-single,function-mask = <0xffff>;
 };
@@ -69,8 +65,6 @@ pmx_wkup: pinmux@4a31e040 {
 control_devconf0: pinmux@48002274 {
 	compatible = "pinctrl-single";
 	reg = <0x48002274 4>;	/* Single register */
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-single,bit-per-mux;
 	pinctrl-single,register-width = <32>;
 	pinctrl-single,function-mask = <0x5F>;
-- 
1.7.4.1

