From: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Subject: [PATCH V3 1/6] clk: bcm2835: the minimum clock divider is 2
Date: Thu, 14 Jan 2016 13:45:36 +0000
Message-ID: <1452779142-20615-2-git-send-email-kernel@martin.sperl.org>
References: <1452779142-20615-1-git-send-email-kernel@martin.sperl.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452779142-20615-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

Testing with different clock divider values has shown
that (at least for the PCM clock) the clock divider
has to be at least 2, otherwise the clock will not
output a signal.

So the clamping has changed from 1 to 2 and comments
about the kind of clamping applied have been added.

Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
---
 drivers/clk/bcm/clk-bcm2835.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 015e687..10e97b7 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1178,7 +1178,11 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
 	div &= ~unused_frac_mask;
 
 	/* Clamp to the limits. */
-	div = max(div, unused_frac_mask + 1);
+
+	/* divider must be >= 2 */
+	div = max_t(u32, div, (2 << CM_DIV_FRAC_BITS));
+
+	/* clamp to max divider allowed */
 	div = min_t(u32, div, GENMASK(data->int_bits + CM_DIV_FRAC_BITS - 1,
 				      CM_DIV_FRAC_BITS - data->frac_bits));
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
