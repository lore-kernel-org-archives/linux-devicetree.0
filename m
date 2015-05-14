From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] ARM: ux500: add SCU and WD to device tree
Date: Thu, 14 May 2015 18:11:06 +0200
Message-ID: <1431619867-14700-4-git-send-email-linus.walleij@linaro.org>
References: <1431619867-14700-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431619867-14700-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Ux500 like other Cortex-A9 SoC's has a Snoop Control
Unit (SCU) and a Watchdog in the same address range as
the local timers. Add these to the SoC device tree.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index 5b876f263af4..f024a1c0de8b 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -185,6 +185,11 @@
 			      <0xa0410100 0x100>;
 		};
 
+		scu@a04100000 {
+			compatible = "arm,cortex-a9-scu";
+			reg = <0xa0410000 0x100>;
+		};
+
 		L2: l2-cache {
 			compatible = "arm,pl310-cache";
 			reg = <0xa0412000 0x1000>;
@@ -245,6 +250,13 @@
 			clocks = <&smp_twd_clk>;
 		};
 
+		watchdog@a0410620 {
+			compatible = "arm,cortex-a9-twd-wdt";
+			reg = <0xa0410620 0x20>;
+			interrupts = <1 14 0x304>;
+			clocks = <&smp_twd_clk>;
+		};
+
 		rtc@80154000 {
 			compatible = "arm,rtc-pl031", "arm,primecell";
 			reg = <0x80154000 0x1000>;
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
