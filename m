From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/4] arm: zynq: Enable global timer
Date: Wed, 18 Sep 2013 11:48:34 -0700
Message-ID: <1379530118-22813-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Preeti Murthy <preeti.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

here's a v2. I reused the subject from my v1 submission although the focus of
this series moved a bit towards the timer subsystem.
I replaced Stephen's fix to prevent per cpu devices from becoming
the broadcast device with Thomas' proposal, but I kept the original commit
message. I split the whole approach in small chunks that I found reasonable.

In 4/4, I picked up Grant's comment regarding the DT node name.

v2:
 - drop 1/2 of the original series
 - implement preventing per cpu devices from becoming broadcast device according
   to Thomas' proposal
   - introduce new CLOCK_EVT_FEAT_PERCPU flag
   - set the flag for the arm_global_timer
   - filter per cpu devices based on this flag when choosing the broadcast
     device
 - rename DT node to avoid '_'s
 

Soren Brinkmann (4):
  clockchips: Add FEAT_PERCPU clockevent flag
  clocksource/arm_global_timer: Set FEAT_PERCPU flag
  tick: broadcast: Deny per-cpu clockevents from being broadcast sources
  arm: zynq: Enable arm_global_timer

 arch/arm/boot/dts/zynq-7000.dtsi       | 8 ++++++++
 arch/arm/mach-zynq/Kconfig             | 1 +
 drivers/clocksource/arm_global_timer.c | 3 ++-
 include/linux/clockchips.h             | 1 +
 kernel/time/tick-broadcast.c           | 1 +
 5 files changed, 13 insertions(+), 1 deletion(-)

-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
