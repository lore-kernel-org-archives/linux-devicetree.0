From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 2/2] dt: Add bindings for IDT VersaClock 5P49V5925
Date: Fri,  7 Jul 2017 04:57:57 +0300
Message-ID: <1499392677-9100-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499392623-9011-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499392623-9011-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

IDT VersaClock 5 5P49V5925 has 4 clock outputs, 4 fractional dividers.
Input clock source can be taken only from external reference clock.

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 Documentation/devicetree/bindings/clock/idt,versaclock5.txt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
index 53d7e50..a1ad9e0 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
@@ -6,19 +6,21 @@ from 3 to 12 output clocks.
 ==I2C device node==
 
 Required properties:
-- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933" ,
-		"idt,5p49v5935".
+- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5925" ,
+		"idt,5p49v5933", "idt,5p49v5935".
 - reg:		i2c device address, shall be 0x68 or 0x6a.
 - #clock-cells:	from common clock binding; shall be set to 1.
 - clocks:	from common clock binding; list of parent clock handles,
-		- 5p49v5923: (required) either or both of XTAL or CLKIN
+		- 5p49v5923 and
+		- 5p49v5925: (required) either or both of XTAL or CLKIN
 					reference clock.
 		- 5p49v5933 and
 		- 5p49v5935: (optional) property not present (internal
 					Xtal used) or CLKIN reference
 					clock.
 - clock-names:	from common clock binding; clock input names, can be
-		- 5p49v5923: (required) either or both of "xin", "clkin".
+		- 5p49v5923 and
+		- 5p49v5925: (required) either or both of "xin", "clkin".
 		- 5p49v5933 and
 		- 5p49v5935: (optional) property not present or "clkin".
 
@@ -37,6 +39,7 @@ clock specifier, the following mapping applies:
 	1 -- OUT1
 	2 -- OUT4
 
+5P49V5925 and
 5P49V5935:
 	0 -- OUT0_SEL_I2CB
 	1 -- OUT1
-- 
1.9.1
