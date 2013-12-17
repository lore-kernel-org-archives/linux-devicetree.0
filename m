From: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/2] clk: add clk accuracy support
Date: Tue, 17 Dec 2013 15:36:21 +0100
Message-ID: <1387290983-6236-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds support for clock accuracy retrieval in the common clk
framework.

Best Regards,

Boris

Changes since v2:
 - fix __clk_recalc_accuracies function comment
 - modify __clk_get_accuracy to return the current clock accuracy even when the
   clock is orphan
 - only recalculate clock accuracy when reparent succeed

Changes since v1:
 - remove HAVE_CLK_GET_ACCURACY option and enable clk accuracy support only
   when using the CCF
 - export __clk_get_accuracy (might be used by clk-providers)
 - fix documentation (s/recalc_rate/recalc_accuracy/)
 - move fixed_accuracy field addition (struct clk_fixed_rate) from the 1st
   patch to the 2nd patch of this series

Boris BREZILLON (2):
  clk: add clk accuracy retrieval support
  clk: add accuracy support for fixed clock

 Documentation/clk.txt                              |    4 +
 .../devicetree/bindings/clock/fixed-clock.txt      |    3 +
 drivers/clk/clk-fixed-rate.c                       |   43 ++++++--
 drivers/clk/clk.c                                  |  103 ++++++++++++++++++--
 include/linux/clk-private.h                        |    1 +
 include/linux/clk-provider.h                       |   15 +++
 include/linux/clk.h                                |   17 ++++
 7 files changed, 173 insertions(+), 13 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
