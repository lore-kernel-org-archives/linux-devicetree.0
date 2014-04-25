From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RFC 2/5] clk: berlin: add berlin clock groups DT bindings documentation
Date: Fri, 25 Apr 2014 22:00:21 +0200
Message-ID: <1398456024-27876-4-git-send-email-alexandre.belloni@free-electrons.com>
References: <1398456024-27876-1-git-send-email-alexandre.belloni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398456024-27876-1-git-send-email-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the device tree for the clocks sharing a common set of registers

Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 .../devicetree/bindings/clock/berlin-clock.txt     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/berlin-clock.txt b/Documentation/devicetree/bindings/clock/berlin-clock.txt
index 49bc229827a0..6d374066d6b9 100644
--- a/Documentation/devicetree/bindings/clock/berlin-clock.txt
+++ b/Documentation/devicetree/bindings/clock/berlin-clock.txt
@@ -11,10 +11,18 @@ Required properties:
 		CPU PLL and System PLL
 	"marvell,berlin2-clk":
 		simple clocks
+	"marvell,berlin2-clkgrp":
+		clocks sharing a common set of registers
 - reg: Address and length of the clock register set.
 - #clock-cells: from common clock binding; shall be set to 0.
 - clocks: from common clock binding
 
+For the clock groups:
+- marvell,clk-switch-offset: offset in bits to the first bit related to the
+  clock in the switch registers
+- marvell,clk-select-offset: offset in bits to the first bit related to the
+  clock in the selection registers.
+
 smclk: sysmgr-clock {
 	compatible = "fixed-clock";
 	#clock-cells = <0>;
@@ -34,3 +42,24 @@ sdio0xinclk: sdio0xinclk@ea023c {
 	#clock-cells = <0>;
 	reg = <0xea023c 0x4>;
 };
+
+
+grpclk: grpclk@ea00ec {
+	compatible = "marvell,berlin-clkgrp";
+	clocks = <&syspll>;
+	reg = <0xea00f8 0x4>, <0xea00ec 0xc>;
+
+	cfgclk: cfgclk {
+		#clock-cells = <0>;
+		marvell,clk-switch-offset = <9>;
+		marvell,clk-select-offset = <12>;
+	};
+
+	nfcecccclk: nfcecccclk {
+		#clock-cells = <0>;
+		marvell,clk-switch-offset = <27>;
+		marvell,clk-select-offset = <50>;
+	};
+};
+
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
