From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 09/15] drivers: clk: st: Add polarity bit indication
Date: Tue, 15 Jul 2014 17:20:25 +0200
Message-ID: <1405437631-23623-10-git-send-email-gabriel.fernandez@linaro.org>
References: <1405437631-23623-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405437631-23623-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch introduces polarity indication for pll power up bit
and for standby bit in order to have same code between stih416
and stih407 boards.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/st/clkgen-fsyn.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index e8d599d..b925580 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -67,6 +67,8 @@ struct clkgen_quadfs_data {
 	bool reset_present;
 	bool bwfilter_present;
 	bool lockstatus_present;
+	bool powerup_polarity;
+	bool standby_polarity;
 	bool nsdiv_present;
 	struct clkgen_field ndiv;
 	struct clkgen_field ref_bw;
@@ -308,7 +310,7 @@ static int quadfs_pll_enable(struct clk_hw *hw)
 	/*
 	 * Power up the PLL
 	 */
-	CLKGEN_WRITE(pll, npda, 1);
+	CLKGEN_WRITE(pll, npda, !pll->data->powerup_polarity);
 
 	if (pll->lock)
 		spin_unlock_irqrestore(pll->lock, flags);
@@ -335,7 +337,7 @@ static void quadfs_pll_disable(struct clk_hw *hw)
 	 * Powerdown the PLL and then put block into soft reset if we have
 	 * reset control.
 	 */
-	CLKGEN_WRITE(pll, npda, 0);
+	CLKGEN_WRITE(pll, npda, pll->data->powerup_polarity);
 
 	if (pll->data->reset_present)
 		CLKGEN_WRITE(pll, nreset, 0);
@@ -611,7 +613,7 @@ static int quadfs_fsynth_enable(struct clk_hw *hw)
 	if (fs->lock)
 		spin_lock_irqsave(fs->lock, flags);
 
-	CLKGEN_WRITE(fs, nsb[fs->chan], 1);
+	CLKGEN_WRITE(fs, nsb[fs->chan], !fs->data->standby_polarity);
 
 	if (fs->lock)
 		spin_unlock_irqrestore(fs->lock, flags);
@@ -631,7 +633,7 @@ static void quadfs_fsynth_disable(struct clk_hw *hw)
 	if (fs->lock)
 		spin_lock_irqsave(fs->lock, flags);
 
-	CLKGEN_WRITE(fs, nsb[fs->chan], 0);
+	CLKGEN_WRITE(fs, nsb[fs->chan], !fs->data->standby_polarity);
 
 	if (fs->lock)
 		spin_unlock_irqrestore(fs->lock, flags);
@@ -645,7 +647,7 @@ static int quadfs_fsynth_is_enabled(struct clk_hw *hw)
 	pr_debug("%s: %s enable bit = 0x%x\n",
 		 __func__, __clk_get_name(hw->clk), nsb);
 
-	return !!nsb;
+	return fs->data->standby_polarity ? !nsb : !!nsb;
 }
 
 #define P15			(uint64_t)(1 << 15)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
