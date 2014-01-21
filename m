From: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] clk: corenet: Update the clock bindings
Date: Tue, 21 Jan 2014 10:02:12 +0800
Message-ID: <1390269732-22798-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: b07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b32579-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Tang Yuantian <yuantian.tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tang Yuantian <yuantian.tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Main changs include:
	- Clarified the clock nodes' version number
	- Fixed a issue in example

Singed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/corenet-clock.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/corenet-clock.txt b/Documentation/devicetree/bindings/clock/corenet-clock.txt
index 24711af..d6cadef 100644
--- a/Documentation/devicetree/bindings/clock/corenet-clock.txt
+++ b/Documentation/devicetree/bindings/clock/corenet-clock.txt
@@ -54,6 +54,8 @@ Required properties:
 		It takes parent's clock-frequency as its clock.
 	* "fsl,qoriq-sysclk-2.0": for input system clock (v2.0).
 		It takes parent's clock-frequency as its clock.
+	Note: v1.0 and v2.0 are clock version which should align to
+	clockgen node's they belong to which is chassis version.
 - #clock-cells: From common clock binding. The number of cells in a
 	clock-specifier. Should be <0> for "fsl,qoriq-sysclk-[1,2].0"
 	clocks, or <1> for "fsl,qoriq-core-pll-[1,2].0" clocks.
@@ -85,7 +87,7 @@ Example for clock block and clock provider:
 			#clock-cells = <0>;
 			compatible = "fsl,qoriq-sysclk-1.0";
 			clock-output-names = "sysclk";
-		}
+		};
 
 		pll0: pll0@800 {
 			#clock-cells = <1>;
-- 
1.8.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
