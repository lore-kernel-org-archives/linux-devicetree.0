From: slemieux.tyco@gmail.com
Subject: [PATCH v2] clk: lpc32xx: add HCLK PLL output configuration
Date: Wed, 10 Feb 2016 13:52:32 -0500
Message-ID: <1455130352-25860-1-git-send-email-slemieux.tyco@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com
Cc: stigge@antcom.de, vz@mleia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux@tycoint.com>

This patch add the support to setup the HCLK PLL output
using the "assigned-clock-rates" parameter in the device tree.

If the option is not use, the clock setup by the kickstart
and/or bootloader remain unchanged.

The previous kernel version did not change the clock frequency
output setup by the kickstart and/or bootloader;
this version always setup the clock frequency output to 208MHz.

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
Changes from v1 to v2:
- Rename patch title;
  was "clk: lpc32xx: add clock frequency output configuration"
- Update the patch as per the feedback received from:
  Stephen: http://permalink.gmane.org/gmane.linux.kernel.clk/3913
  Vladimir: http://permalink.gmane.org/gmane.linux.kernel.clk/3921 

Note:
- There is currently an issue in the current driver;
  if the HCLK PLL output, configured by the kickstart and/or
  bootloader, is change by the kernel (ex. 266.5MHz to 208MHz),
  the serial console is no longer outputing properly.

 drivers/clk/nxp/clk-lpc32xx.c             | 6 +-----
 include/dt-bindings/clock/lpc32xx-clock.h | 1 +
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 981ff0d..48b3a11 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -87,7 +87,7 @@ enum {
 
 enum {
 	/* Start from the last defined clock in dt bindings */
-	LPC32XX_CLK_ADC_DIV = LPC32XX_CLK_ADC + 1,
+	LPC32XX_CLK_ADC_DIV = LPC32XX_CLK_HCLK_PLL + 1,
 	LPC32XX_CLK_ADC_RTC,
 	LPC32XX_CLK_TEST1,
 	LPC32XX_CLK_TEST2,
@@ -96,7 +96,6 @@ enum {
 	LPC32XX_CLK_OSC,
 	LPC32XX_CLK_SYS,
 	LPC32XX_CLK_PLL397X,
-	LPC32XX_CLK_HCLK_PLL,
 	LPC32XX_CLK_HCLK_DIV_PERIPH,
 	LPC32XX_CLK_HCLK_DIV,
 	LPC32XX_CLK_HCLK,
@@ -1526,9 +1525,6 @@ static void __init lpc32xx_clk_init(struct device_node *np)
 
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 
-	/* For 13MHz osc valid output range of PLL is from 156MHz to 266.5MHz */
-	clk_set_rate(clk[LPC32XX_CLK_HCLK_PLL], 208000000);
-
 	/* Set 48MHz rate of USB PLL clock */
 	clk_set_rate(clk[LPC32XX_CLK_USB_PLL], 48000000);
 
diff --git a/include/dt-bindings/clock/lpc32xx-clock.h b/include/dt-bindings/clock/lpc32xx-clock.h
index bcb1c9a..d41b6fe 100644
--- a/include/dt-bindings/clock/lpc32xx-clock.h
+++ b/include/dt-bindings/clock/lpc32xx-clock.h
@@ -47,6 +47,7 @@
 #define LPC32XX_CLK_PWM1	32
 #define LPC32XX_CLK_PWM2	33
 #define LPC32XX_CLK_ADC		34
+#define LPC32XX_CLK_HCLK_PLL	35
 
 /* LPC32XX USB clocks */
 #define LPC32XX_USB_CLK_I2C	1
-- 
1.8.3.1

