From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/7] clocksource/cadence_ttc: Overhaul clocksource
 frequency adjustment
Date: Tue, 12 Nov 2013 13:13:39 -0800
Message-ID: <49c3ad81-1370-4c56-b369-90b9d8cfe3d5@AM1EHSMHS004.ehs.local>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com>
 <1383945677-29674-6-git-send-email-soren.brinkmann@xilinx.com>
 <52827B11.5040308@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52827B11.5040308-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 08:01:37PM +0100, Daniel Lezcano wrote:
> On 11/08/2013 10:21 PM, Soren Brinkmann wrote:
> >The currently used method adjusting the clocksource to a changing in=
put
> >frequency does not work on kernels from 3.11 on.
> >The new approach is to keep the timer frequency as constant as possi=
ble.
> >I.e.
> >  - due to the TTC's prescaler limitations, allow frequency changes
> >    only if the frequency scales by a power of 2
> >  - adjust the counter's divider on the fly when a frequency change
> >    occurs
> >
> >When suspending though, the driver should not prevent rate changes i=
n
> >order to allow the system to enter its low power state. For that
> >reason a PM notifier is added so rate changes can be ignored during
> >suspend/resume.
>=20
> It sounds very weird you have to add a PM notifier in this driver.
>=20
> Have you been facing an issue or do you assume it could happen ?
Yes, I have problems without it, which are probably Zynq specific
though.
When we suspend on Zynq, we bypass and power down PLLs, which is a
re-parent operation in the clock framework. This happens in early suspe=
nd
and triggers the clock notifiers. Due to the restrictions the TTC's
clock notifier applies to frequency changes, it would prevent the
re-parent operation even though we do not have to care about it in
suspend. The timer's own suspend/resume callbacks are called to
late/early and the PM notifier seemed to be the solution. But I'm open
to alternative approaches.

>=20
> >This limits cpufreq to scale by certain factors only.
> >But we may keep the time base somewhat constant, so that sleep() & c=
o
> >keep working as expected, while supporting cpufreq and suspend.
> >
> >Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >---
> >  drivers/clocksource/cadence_ttc_timer.c | 142 ++++++++++++++++++++=
+++++++-----
> >  1 file changed, 122 insertions(+), 20 deletions(-)
> >
> >diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clock=
source/cadence_ttc_timer.c
> >index 68a336038d8f..421b942dd707 100644
> >--- a/drivers/clocksource/cadence_ttc_timer.c
> >+++ b/drivers/clocksource/cadence_ttc_timer.c
> >@@ -16,12 +16,14 @@
> >   */
> >
> >  #include <linux/clk.h>
> >+#include <linux/clk-provider.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/slab.h>
> >  #include <linux/sched_clock.h>
> >+#include <linux/suspend.h>
> >
> >  /*
> >   * This driver configures the 2 16-bit count-up timers as follows:
> >@@ -52,6 +54,8 @@
> >  #define TTC_CNT_CNTRL_DISABLE_MASK	0x1
> >
> >  #define TTC_CLK_CNTRL_CSRC_MASK		(1 << 5)	/* clock source */
> >+#define TTC_CLK_CNTRL_PSV_MASK		0x1e
> >+#define TTC_CLK_CNTRL_PSV_SHIFT		1
> >
> >  /*
> >   * Setup the timers to use pre-scaling, using a fixed value for no=
w that will
> >@@ -63,6 +67,8 @@
> >  #define CLK_CNTRL_PRESCALE_EN	1
> >  #define CNT_CNTRL_RESET		(1 << 4)
> >
> >+#define MAX_F_ERR 50
> >+
> >  /**
> >   * struct ttc_timer - This definition defines local timer structur=
e
> >   *
> >@@ -82,8 +88,13 @@ struct ttc_timer {
> >  		container_of(x, struct ttc_timer, clk_rate_change_nb)
> >
> >  struct ttc_timer_clocksource {
> >+	int			scale_dir;
> >+	u32			scale_clk_ctrl_reg_old;
> >+	u32			scale_clk_ctrl_reg_new;
> >+	int			suspending;
> >  	struct ttc_timer	ttc;
> >  	struct clocksource	cs;
> >+	struct notifier_block	suspend_nb;
> >  };
> >
> >  #define to_ttc_timer_clksrc(x) \
> >@@ -228,33 +239,120 @@ static int ttc_rate_change_clocksource_cb(str=
uct notifier_block *nb,
> >  	struct ttc_timer_clocksource *ttccs =3D container_of(ttc,
> >  			struct ttc_timer_clocksource, ttc);
> >
> >+	if (ttccs->suspending)
> >+		return NOTIFY_OK;
>=20
> I don't see how it couldn't be racy. What prevents suspend to occur
> right after this check ?
Well, in our case there are two situations which could trigger this
notifier.
1. cpufreq
2. suspend
As long as cpufreq is doing its stuff things should be okay and fine.
And suspend triggers the PM and clock notifier in the correct order,
which solves the issue I described above. So, it is not really pretty,
but works for me.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
