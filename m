From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [RFC v4 04/15] MIPS: dts: qca: ar9132: use dt-bindings/clock/ath79-clk.h macros
Date: Mon,  1 Feb 2016 03:10:29 +0300
Message-ID: <1454285440-18916-5-git-send-email-antonynpavlov@gmail.com>
References: <1454285440-18916-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1454285440-18916-1-git-send-email-antonynpavlov@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Antony Pavlov <antonynpavlov@gmail.com>, Alban Bedel <albeu@free.fr>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The old ar9132 clk implementation (see arch/mips/ath79/clock.c)
have had only 3 devicetree clks (cpu, ddr, ahb). Two additional
clocks (wdt and uart) have realized as aliases for ahb clock.
In the old ar9132 clk implementation the wdt and uart clocks
were inaccessible via devicetree so index "2" used for reference
to ahb clock instead, e.g.

    clocks = <&pll 2>;

In the new ar9132 clk implementation (see drivers/clk/clk-ath79.c)
the wdt and uart clks are accessible via devicetree
so appropriate ATH79_CLK_WDT and ATH79_CLK_UART are used in ar9132.dtsi.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Alban Bedel <albeu@free.fr>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 arch/mips/boot/dts/qca/ar9132.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 3ad4ba9..a1b4fa1 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -1,3 +1,5 @@
+#include <dt-bindings/clock/ath79-clk.h>
+
 / {
 	compatible = "qca,ar9132";
 
@@ -57,7 +59,7 @@
 				reg = <0x18020000 0x20>;
 				interrupts = <3>;
 
-				clocks = <&pll 2>;
+				clocks = <&pll ATH79_CLK_UART>;
 				clock-names = "uart";
 
 				reg-io-width = <4>;
@@ -100,7 +102,7 @@
 
 				interrupts = <4>;
 
-				clocks = <&pll 2>;
+				clocks = <&pll ATH79_CLK_WDT>;
 				clock-names = "wdt";
 			};
 
@@ -144,7 +146,7 @@
 			compatible = "qca,ar9132-spi", "qca,ar7100-spi";
 			reg = <0x1f000000 0x10>;
 
-			clocks = <&pll 2>;
+			clocks = <&pll ATH79_CLK_AHB>;
 			clock-names = "ahb";
 
 			status = "disabled";
-- 
2.7.0

