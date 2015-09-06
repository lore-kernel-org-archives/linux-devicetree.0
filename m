From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Raspberry Pi native clock driver
Date: Sun,  6 Sep 2015 10:57:39 -0700
Message-ID: <1441562263-19888-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

After my last firmware clocks posting, Gordon at Raspberry Pi pointed
that you can, in fact, touch the clocks from the ARM side.  This is
the driver that resulted from that.  With debug printfs at boot the
clock frequencies from .recalc_rate() are looking good, a few are
definitely corrected compared to our previous fixed clock references,
and I've tested that I can now get different frequencies out of the
pixel clock for the KMS driver.

Gordon and Dom took a look at the code, and while I don't have
explicit Acked-Bys, they thought it seemed pretty sound as far as the
hardware goes.  We'll want to sort out eventually who really owns
which clocks between the firmware and Linux, but for now this at least
gets us corrected frequency information on the Linux side.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
