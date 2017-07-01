From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH V2 7/8] clk: vc5: Add bindings for IDT VersaClock 5P49V6901
Date: Sat,  1 Jul 2017 22:04:57 +0200
Message-ID: <20170701200459.11505-7-marek.vasut+renesas@gmail.com>
References: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Alexey Firago <alexey_firago@mentor.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

IDT VersaClock 6 5P49V6901 has 4 clock outputs, 4 fractional dividers.
Input clock source can be taken from either external crystal or from
external reference clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
V2: Edit the top of the DT binding document to mention VersaClock 6
---
 .../devicetree/bindings/clock/idt,versaclock5.txt   | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
index 53d7e50ed875..115ab5f75c5d 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
@@ -1,24 +1,26 @@
-Binding for IDT VersaClock5 programmable i2c clock generator.
+Binding for IDT VersaClock 5,6 programmable i2c clock generators.
 
-The IDT VersaClock5 are programmable i2c clock generators providing
-from 3 to 12 output clocks.
+The IDT VersaClock 5 and VersaClock 6 are programmable i2c clock
+generators providing from 3 to 12 output clocks.
 
 ==I2C device node==
 
 Required properties:
 - compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933" ,
-		"idt,5p49v5935".
+		"idt,5p49v5935" , "idt,5p49v6901".
 - reg:		i2c device address, shall be 0x68 or 0x6a.
 - #clock-cells:	from common clock binding; shall be set to 1.
 - clocks:	from common clock binding; list of parent clock handles,
-		- 5p49v5923: (required) either or both of XTAL or CLKIN
+		- 5p49v5923 and
+		  5p49v6901: (required) either or both of XTAL or CLKIN
 					reference clock.
 		- 5p49v5933 and
 		- 5p49v5935: (optional) property not present (internal
 					Xtal used) or CLKIN reference
 					clock.
 - clock-names:	from common clock binding; clock input names, can be
-		- 5p49v5923: (required) either or both of "xin", "clkin".
+		- 5p49v5923 and
+		  5p49v6901: (required) either or both of "xin", "clkin".
 		- 5p49v5933 and
 		- 5p49v5935: (optional) property not present or "clkin".
 
@@ -44,6 +46,13 @@ clock specifier, the following mapping applies:
 	3 -- OUT3
 	4 -- OUT4
 
+5P49V6901:
+	0 -- OUT0_SEL_I2CB
+	1 -- OUT1
+	2 -- OUT2
+	3 -- OUT3
+	4 -- OUT4
+
 ==Example==
 
 /* 25MHz reference crystal */
-- 
2.11.0
