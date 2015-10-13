From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/10] clk: iproc: add support for BCM NS, NSP, and NS2
Date: Tue, 13 Oct 2015 17:07:58 -0400
Message-ID: <1444770485-11210-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org


v2 - Added a patch to change the Cygnus clk macros to uppercase,
removed the device tree changes from the series (will send out those as
an RFC), and other minor changes that Stephen Boyd requested.

This patch series adds support for the Broadcom Northstar, Northstar
Plus, and Northstar 2 clocks.  Some slight modifications were necessary
to clk-iproc-pll to get Northstar and Northstar Plus working, due to
differences in register layout.  This is the reason why the first patch
is necessary.  Some more modifications were necessary to clk-iproc-pll
to get Northstar 2 working, due to differences in register layout (and
resulting fallout in Cygnus and NSP).  This is the reason why the sixth
and seventh patches are necessary.  The fifth patch is clean-up to
prevent accidentally forgetting to adjust for the base write errata
(which happened a few times, but was caught in internal review).

Thanks,
Jon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
