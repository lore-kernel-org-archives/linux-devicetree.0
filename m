From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V3 7/8] clk: vc5: Add bindings for IDT VersaClock 5P49V6901
Date: Sun,  9 Jul 2017 15:28:13 +0200
Message-ID: <20170709132814.2339-7-marek.vasut+renesas@gmail.com>
References: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170709132814.2339-1-marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

IDT VersaClock 6 5P49V6901 has 4 clock outputs, 4 fractional dividers.
Input clock source can be taken from either external crystal or from
external reference clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
V2: Edit the top of the DT binding document to mention VersaClock 6
V3: Reformat the compatible entry to list one per line
---
 .../devicetree/bindings/clock/idt,versaclock5.txt  | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
index 53d7e50ed875..66ef0a009b95 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
@@ -1,24 +1,29 @@
-Binding for IDT VersaClock5 programmable i2c clock generator.
+Binding for IDT VersaClock 5,6 programmable i2c clock generators.
 
-The IDT VersaClock5 are programmable i2c clock generators providing
-from 3 to 12 output clocks.
+The IDT VersaClock 5 and VersaClock 6 are programmable i2c clock
+generators providing from 3 to 12 output clocks.
 
 ==I2C device node==
 
 Required properties:
-- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933" ,
-		"idt,5p49v5935".
+- compatible:	shall be one of
+		"idt,5p49v5923"
+		"idt,5p49v5933"
+		"idt,5p49v5935"
+		"idt,5p49v6901"
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
 
@@ -44,6 +49,13 @@ clock specifier, the following mapping applies:
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
