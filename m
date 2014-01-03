From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 1/1] clk: arm64: Fix the clock-names property for pcppll, socpll, and socplldiv2
Date: Fri,  3 Jan 2014 14:23:20 -0700
Message-ID: <1388784200-8498-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fixes the clock-names property for pcppll, socpll, and socplldiv2
as found by Arnd B. The clock-name property for qmlclk, ethclk, and eth8clk 
will be fixed as part of the Ethernet/QM driver submission.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm-storm.dtsi |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index cd1e012..52ce601 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -118,7 +118,7 @@
 				compatible = "apm,xgene-pcppll-clock";
 				#clock-cells = <1>;
 				clocks = <&refclk 0>;
-				clock-names = "pcppll";
+				clock-names = "refclk";
 				reg = <0x0 0x17000100 0x0 0x1000>;
 				clock-output-names = "pcppll";
 				type = <0>;
@@ -128,7 +128,7 @@
 				compatible = "apm,xgene-socpll-clock";
 				#clock-cells = <1>;
 				clocks = <&refclk 0>;
-				clock-names = "socpll";
+				clock-names = "refclk";
 				reg = <0x0 0x17000120 0x0 0x1000>;
 				clock-output-names = "socpll";
 				type = <1>;
@@ -138,7 +138,7 @@
 				compatible = "fixed-factor-clock";
 				#clock-cells = <1>;
 				clocks = <&socpll 0>;
-				clock-names = "socplldiv2";
+				clock-names = "socpll";
 				clock-mult = <1>;
 				clock-div = <2>;
 				clock-output-names = "socplldiv2";
-- 
1.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
