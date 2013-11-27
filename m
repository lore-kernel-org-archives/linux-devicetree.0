From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/9] arm: zynq: Add support for cpufreq
Date: Tue, 26 Nov 2013 17:04:47 -0800
Message-ID: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I revised this series and rebased on top of Linus' tree. Patch specific
changes are tracked in the respective email with their patch. On the
level of the whole series, this changed:

v2:
 - added 'clocksource/cadence_ttc: Use enable/disable_irq'. I hope that
   is more appropriate to avoid races of the timer with its interrupt
   handler.
 - added 'arm: zynq: Don't use arm_global_timer with cpufreq'. In the
   3.13 merge window we enabled the arm_global_timer for Zynq. That
   timer is clocked by the CPU clock and hence does not provide a stabl=
e
   clocksource when cpufreq is enabled. That patch makes the selection =
of
   the GT driver depend on !CPU_FREQ for Zynq.

	S=C3=B6ren

Soren Brinkmann (9):
  arm: dt: zynq: Remove 'clock-ranges' from TTC nodes
  arm: dt: zynq: Add 'cpus' node
  clocksource/cadence_ttc: Store timer frequency in driver data
  clocksource/cadence_ttc: Use enable/disable_irq
  clocksource/cadence_ttc: Adjust interval in clock notifier
  clocksource/cadence_ttc: Overhaul clocksource frequency adjustment
  clocksource/cadence_ttc: Use only one counter
  arm: zynq: Don't use arm_global_timer with cpufreq
  arm: zynq: Add support for cpufreq

 arch/arm/boot/dts/zynq-7000.dtsi        |  27 +++-
 arch/arm/mach-zynq/Kconfig              |   4 +-
 arch/arm/mach-zynq/common.c             |   3 +
 drivers/clocksource/cadence_ttc_timer.c | 235 +++++++++++++++++++-----=
--------
 4 files changed, 174 insertions(+), 95 deletions(-)

--=20
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
