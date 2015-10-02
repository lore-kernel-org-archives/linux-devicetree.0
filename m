From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3] Add driver for the si514 clock generator chip
Date: Fri, 2 Oct 2015 12:18:04 -0700
Message-ID: <20151002191804.GS12338@codeaurora.org>
References: <1442487891-20477-1-git-send-email-mike.looijmans@topic.nl>
 <1443770129-7757-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443770129-7757-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/02, Mike Looijmans wrote:
> This patch adds the driver and devicetree documentation for the
> Silicon Labs SI514 clock generator chip. This is an I2C controlled
> oscillator capable of generating clock signals ranging from 100kHz
> to 250MHz.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---

Applied to clk-next. We can handle any stuff about assigned rates
in a follow up patch.

Also, I squashed in this for some cleanup.

diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index 779aebcd884b..6af7dce54241 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -16,7 +16,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -87,14 +86,11 @@ static int si514_get_muldiv(struct clk_si514 *data,
 	if (err)
 		return err;
 
-	settings->m_frac =
-		reg[0] |
-		((u32)reg[1] << 8) |
-		((u32)reg[2] << 16) |
-		((u32)(reg[3] & 0x1F) << 24);
-	settings->m_int = ((reg[4] & 0x3f) << 3) | (reg[3] >> 5);
+	settings->m_frac = reg[0] | reg[1] << 8 | reg[2] << 16 |
+			   (reg[3] & 0x1F) << 24;
+	settings->m_int = (reg[4] & 0x3f) << 3 | reg[3] >> 5;
 	settings->ls_div_bits = (reg[6] >> 4) & 0x07;
-	settings->hs_div = ((u16)(reg[6] & 0x03) << 8) | reg[5];
+	settings->hs_div = (reg[6] & 0x03) << 8 | reg[5];
 	return 0;
 }
 
@@ -132,7 +128,7 @@ static int si514_set_muldiv(struct clk_si514 *data,
 	reg[0] = settings->m_frac;
 	reg[1] = settings->m_frac >> 8;
 	reg[2] = settings->m_frac >> 16;
-	reg[3] = (settings->m_frac >> 24) | (settings->m_int << 5);
+	reg[3] = settings->m_frac >> 24 | settings->m_int << 5;
 	reg[4] = settings->m_int >> 3;
 	reg[5] = settings->hs_div;
 	reg[6] = (settings->hs_div >> 8) | (settings->ls_div_bits << 4);
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
