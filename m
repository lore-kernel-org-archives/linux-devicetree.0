From: Brad Mouring <brad.mouring-acOepvfBmUk@public.gmane.org>
Subject: [PATCH 0/2] Control PL310 pwr_ctrl register through DT
Date: Tue, 23 Feb 2016 16:03:37 -0600
Message-ID: <1456265019-23900-1-git-send-email-brad.mouring@ni.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


During some performance-oriented benchmarking on a Cortex A9
platform, a slight performance degradation was noted on datasets
that spanned into the L2 cache (<10%). This performance hit was
minor, but it prompted investigation into the cause.

One difference in the actual PL310 configuration that was concerning
was the enabling of two PM-related changes: Dynamic Clock Gating
and Standby Mode Enabling. As the kernel being tested was patched
and configured to use the PREEMPT_RT patchset, it was desired to
disable these settings for our use-case since anything PM can
(and usually does) impact determinism.

Making these changes resulted in a modest performance improvement
and those wonderful warm-n-fuzzies regarding determinism and enabling
system control without needing to change the kernel.

In the following set, there's the actual change to control these
features given DT presence of a couple of new bindings and the
documenation to accompany those changes. Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
