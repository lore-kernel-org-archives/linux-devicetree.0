From: slemieux.tyco@gmail.com
Subject: [PATCH 1/2] clk: lpc32xx: add clock frequency output configuration
Date: Tue,  9 Feb 2016 13:47:49 -0500
Message-ID: <1455043670-19025-1-git-send-email-slemieux.tyco@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com
Cc: stigge@antcom.de, vz@mleia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux@tycoint.com>

This patch add the support to setup the clock frequency output
using an optional parameter from the device tree.

The previous kernel version did not change the clock frequency
output setup by the kickstart and/or bootloader;
this version always setup the clock frequency output to 208MHz.

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 981ff0d..3ab4481 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -1525,9 +1525,12 @@ static void __init lpc32xx_clk_init(struct device_node *np)
 	}
 
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+	if (of_property_read_u32(np, "xtal,clock-output-frequency", &i))
+		/* use default value (208MHz) */
+		i = 208000000;
 
 	/* For 13MHz osc valid output range of PLL is from 156MHz to 266.5MHz */
-	clk_set_rate(clk[LPC32XX_CLK_HCLK_PLL], 208000000);
+	clk_set_rate(clk[LPC32XX_CLK_HCLK_PLL], i);
 
 	/* Set 48MHz rate of USB PLL clock */
 	clk_set_rate(clk[LPC32XX_CLK_USB_PLL], 48000000);
-- 
1.8.3.1

