From: kernel@martin.sperl.org
Subject: [RFC 8/9] dt-bindings: bcm2835: document optional per clock dt-nodes
Date: Tue, 19 Jan 2016 14:51:39 +0000
Message-ID: <1453215100-2382-9-git-send-email-kernel@martin.sperl.org>
References: <1453215100-2382-1-git-send-email-kernel@martin.sperl.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1453215100-2382-1-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Remi Pommarel <repk@triplefau.lt>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel@martin.sperl.org>

Document how to modify per clock default behaviour
via the device-tree.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 .../bindings/clock/brcm,bcm2835-cprman.txt         |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
index e56a1df..794c4ac 100644
--- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
@@ -17,6 +17,26 @@ Required properties:
 		  found in include/dt-bindings/clock/bcm2835.h
 - reg:		Specifies base physical address and size of the registers
 - clocks:	The external oscillator clock phandle
+- #address-cells number of cells required to define a clock
+- #size-cells    Should be 0
+
+Subnodes:
+
+It is possible to apply optional settings per clock to modify clock
+selection behaviour.
+For each clock there may be a subnode that may contain the following:
+
+Required properties:
+- reg                 -  clock id
+
+Optional properties:
+- parent-clock-names  - list of parrent-clock names
+  		        this list is validated againt the default list
+		        of parent clocks and is used in this order.
+- brcm,clock-selector - the clock selector to use
+- brcm,mash-max-order - the maximum order of the fractional divider
+- brcm,min-fract-div  - the minimum divider required when using
+  		      	the fractional divider
 
 Example:
 
@@ -33,6 +53,19 @@ Example:
 		#clock-cells = <1>;
 		reg = <0x7e101000 0x2000>;
 		clocks = <&clk_osc>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* custom settings for the PCM clock */
+		clock@BCM2835_CLOCK_PCM {
+			 reg = <BCM2835_CLOCK_PCM>;
+			 parent-clock-names = "xosc", "plld_per";
+			 brcm,clock-selector =
+				  <BCM2835_CHOOSE_CLOCK_INTEGER_THEN_FRAC>;
+			 brcm,mash-max-order = <BCM2835_MASH_ORDER_3>;
+			 brcm,min-fract-div = <20>;
+		};
 	};
 
 	i2c0: i2c@7e205000 {
-- 
1.7.10.4

