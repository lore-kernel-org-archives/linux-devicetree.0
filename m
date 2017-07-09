From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 2/2] dt: Add bindings for IDT VersaClock 5P49V5925
Date: Sun,  9 Jul 2017 20:40:05 +0300
Message-ID: <1499622005-13003-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499621970-12925-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499621970-12925-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

IDT VersaClock 5 5P49V5925 has 5 clock outputs, 4 fractional dividers.
Input clock source can be taken only from external reference clock.

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
---
Changes in version 2:
- fixed typo in patch header: VC5 has 5 clock outputs
- rebased against patch:
  [V3,7/8] clk: vc5: Add bindings for IDT VersaClock 5P49V6901

 Documentation/devicetree/bindings/clock/idt,versaclock5.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
index 66ef0a0..05a245c 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
@@ -8,6 +8,7 @@ generators providing from 3 to 12 output clocks.
 Required properties:
 - compatible:	shall be one of
 		"idt,5p49v5923"
+		"idt,5p49v5925"
 		"idt,5p49v5933"
 		"idt,5p49v5935"
 		"idt,5p49v6901"
@@ -15,6 +16,7 @@ Required properties:
 - #clock-cells:	from common clock binding; shall be set to 1.
 - clocks:	from common clock binding; list of parent clock handles,
 		- 5p49v5923 and
+		  5p49v5925 and
 		  5p49v6901: (required) either or both of XTAL or CLKIN
 					reference clock.
 		- 5p49v5933 and
@@ -23,6 +25,7 @@ Required properties:
 					clock.
 - clock-names:	from common clock binding; clock input names, can be
 		- 5p49v5923 and
+		  5p49v5925 and
 		  5p49v6901: (required) either or both of "xin", "clkin".
 		- 5p49v5933 and
 		- 5p49v5935: (optional) property not present or "clkin".
@@ -42,6 +45,7 @@ clock specifier, the following mapping applies:
 	1 -- OUT1
 	2 -- OUT4
 
+5P49V5925 and
 5P49V5935:
 	0 -- OUT0_SEL_I2CB
 	1 -- OUT1
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
