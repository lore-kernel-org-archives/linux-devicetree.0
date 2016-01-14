From: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Subject: [PATCH V3 2/6] clk: bcm2835: clamp clock divider to highest integer only
Date: Thu, 14 Jan 2016 13:45:37 +0000
Message-ID: <1452779142-20615-3-git-send-email-kernel@martin.sperl.org>
References: <1452779142-20615-1-git-send-email-kernel@martin.sperl.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452779142-20615-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

The clock divider calculation right now clamps the
divider to the highest possible fractional divider.
So typically (BIT(div_int_bits) - 1) + 4095 / 4096.

As the fractional clock divider is alterating between
(Fosc / div_int) and (Fosc / (div_int + 1))
the divider will overflow for the (div_int + 1) case.
As with the "underflow" case we have seen for (div < 2),
we can assume that the same applies on the upper limit
as well.

So this patch will instead clamp to the divider to
(BIT(div_int_bits) - 1)

Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
---
 drivers/clk/bcm/clk-bcm2835.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 10e97b7..3d6490f 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1182,9 +1182,9 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
 	/* divider must be >= 2 */
 	div = max_t(u32, div, (2 << CM_DIV_FRAC_BITS));

-	/* clamp to max divider allowed */
+	/* clamp to max divider allowed - max is integer divider */
 	div = min_t(u32, div, GENMASK(data->int_bits + CM_DIV_FRAC_BITS - 1,
-				      CM_DIV_FRAC_BITS - data->frac_bits));
+				      CM_DIV_FRAC_BITS));

 	return div;
 }
--
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
