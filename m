From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/5] clk: ux500: fix erroneous bit assignment
Date: Fri, 18 Oct 2013 11:04:57 +0200
Message-ID: <1382087097-31627-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Due to a typo or similar, the peripheral group 2 clock 11
gate was set to bit 1 instead of bit 11. We need to fix this
to be able to set the correct enable bit in the device tree:
when trying to correct the bit assignment in the device tree,
the system would hang.

Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Mike: seeking an ACK for this as it needs to be taken into
ARM SoC with the rest of the fixes so as not to cause
bisection problems between the trees.
---
 drivers/clk/ux500/u8500_of_clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
index b768b50..cdeff29 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -339,7 +339,7 @@ void u8500_of_clk_init(u32 clkrst1_base, u32 clkrst2_base, u32 clkrst3_base,
 
 	clk = clk_reg_prcc_pclk("p2_pclk11", "per2clk", clkrst2_base,
 				BIT(11), 0);
-	PRCC_PCLK_STORE(clk, 2, 1);
+	PRCC_PCLK_STORE(clk, 2, 11);
 
 	clk = clk_reg_prcc_pclk("p2_pclk12", "per2clk", clkrst2_base,
 				BIT(12), 0);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
