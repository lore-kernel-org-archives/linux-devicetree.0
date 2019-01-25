Return-Path: <SRS0=UxJn=QB=linaro.org=vincent.guittot@kernel.org>
Date: Fri, 25 Jan 2019 15:06:06 +0100
From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Message-ID: <20190125140606.GA17196@linaro.org>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW-qt+3iNit1wVxN2JyRwCArJzBNvvjDZJyxYRjvDkLuA@mail.gmail.com>
 <OSBPR01MB21034B1D07C9BA05859AEA73B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSBPR01MB210397F6201DBAC36BFB0CB2B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB210397F6201DBAC36BFB0CB2B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Samuel Holland <samuel@sholland.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

It seems that the call of mark_last_busy in rpm_resume raises this problem. We have the sequence:
change_clocksource

� � write_seqcount_begin
� � ...
� � timekeeping_update
� � � � ...
� � � � sh_cmt_clocksource_enable
� � � � � � ...
� � � � � � rpm_resume
� � � � � � � � pm_runtime_mark_last_busy
� � � � � � � � � � ktime_get
� � � � � � � � � � � � do
� � � � � � � � � � � � � � read_seqcount_begin
� � � � � � � � � � � � while read_seqcount_retry
� � ....
� � write_seqcount_end

In fact, we should be safe because we haven't yet changed the clocksource as
we are enabling the clocksource that will be used for the switch.

Can you try the patch below ?
It uses ktime_get_mono_fast_ns instead which is lock safe for such case

---
 drivers/base/power/runtime.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 457be03..708a13f 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -130,7 +130,7 @@ u64 pm_runtime_autosuspend_expiration(struct device *dev)
 {
 	int autosuspend_delay;
 	u64 last_busy, expires = 0;
-	u64 now = ktime_to_ns(ktime_get());
+	u64 now = ktime_get_mono_fast_ns();
 
 	if (!dev->power.use_autosuspend)
 		goto out;
@@ -909,7 +909,7 @@ static enum hrtimer_restart  pm_suspend_timer_fn(struct hrtimer *timer)
 	 * If 'expires' is after the current time, we've been called
 	 * too early.
 	 */
-	if (expires > 0 && expires < ktime_to_ns(ktime_get())) {
+	if (expires > 0 && expires < ktime_get_mono_fast_ns()) {
 		dev->power.timer_expires = 0;
 		rpm_suspend(dev, dev->power.timer_autosuspends ?
 		    (RPM_ASYNC | RPM_AUTO) : RPM_ASYNC);
@@ -928,7 +928,7 @@ static enum hrtimer_restart  pm_suspend_timer_fn(struct hrtimer *timer)
 int pm_schedule_suspend(struct device *dev, unsigned int delay)
 {
 	unsigned long flags;
-	ktime_t expires;
+	u64 expires;
 	int retval;
 
 	spin_lock_irqsave(&dev->power.lock, flags);
@@ -945,8 +945,8 @@ int pm_schedule_suspend(struct device *dev, unsigned int delay)
 	/* Other scheduled or pending requests need to be canceled. */
 	pm_runtime_cancel_pending(dev);
 
-	expires = ktime_add(ktime_get(), ms_to_ktime(delay));
-	dev->power.timer_expires = ktime_to_ns(expires);
+	expires = ktime_get_mono_fast_ns() + (u64)delay * NSEC_PER_MSEC);
+	dev->power.timer_expires = expires;
 	dev->power.timer_autosuspends = 0;
 	hrtimer_start(&dev->power.suspend_timer, expires, HRTIMER_MODE_ABS);
 
-- 
2.7.4

Le Friday 25 Jan 2019 � 12:26:54 (+0000), Biju Das a �crit :
> Hi All,
> 
> I have enabled lock debugging  and it is showing "possible recursive locking detected "with the patch ("8234f6734c5d74ac794e5517437f51c57d65f865"   PM-runtime: Switch autosuspend over to using hrtimers)
> 
> root@salvator-x:~# echo  e60f0000.timer > /sys/devices/system/clocksource/clocksource0/current_clocksource
> [   67.995854]
> [   67.997354] ============================================
> [   68.002663] WARNING: possible recursive locking detected
> [   68.007974] 5.0.0-rc3-next-20190125-00005-g382822b #31 Not tainted
> [   68.014150] --------------------------------------------
> [   68.019459] migration/0/11 is trying to acquire lock:
> [   68.024509] 0000000065de5fdf (tk_core.seq){----}, at: rpm_resume+0x5f0/0x7a8
> [   68.031570]
> [   68.031570] but task is already holding lock:
> [   68.037399] 0000000065de5fdf (tk_core.seq){----}, at: multi_cpu_stop+0x8c/0x140
> [   68.044714]
> [   68.044714] other info that might help us debug this:
> [   68.051237]  Possible unsafe locking scenario:
> [   68.051237]
> [   68.057153]        CPU0
> [   68.059594]        ----
> [   68.062034]   lock(tk_core.seq);
> [   68.065258]   lock(tk_core.seq);
> [   68.068482]
> [   68.068482]  *** DEADLOCK ***
> [   68.068482]
> [   68.074402]  May be due to missing lock nesting notation
> [   68.074402]
> [   68.081188] 4 locks held by migration/0/11:
> [   68.085366]  #0: 00000000463b6446 (timekeeper_lock){-.-.}, at: change_clocksource+0x2c/0x118
> [   68.093812]  #1: 0000000065de5fdf (tk_core.seq){----}, at: multi_cpu_stop+0x8c/0x140
> [   68.101558]  #2: 0000000098b45550 (&ch->lock){....}, at: sh_cmt_start+0x28/0x200
> [   68.108961]  #3: 00000000da0f4e80 (&(&dev->power.lock)->rlock){-...}, at: __rpm_callback+0xbc/0x1e8
> [   68.118011]
> [   68.118011] stack backtrace:
> [   68.122368] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.0.0-rc3-next-20190125-00005-g382822b #31
> [   68.131412] Hardware name: Renesas Salvator-X 2nd version board based on r8a7796 (DT)
> [   68.139240] Call trace:
> [   68.141687]  dump_backtrace+0x0/0x178
> [   68.145346]  show_stack+0x14/0x20
> [   68.148661]  dump_stack+0xb0/0xec
> [   68.151975]  __lock_acquire+0xfb4/0x1c08
> [   68.155894]  lock_acquire+0xd0/0x268
> [   68.159467]  ktime_get+0x5c/0x108
> [   68.162779]  rpm_resume+0x5f0/0x7a8
> [   68.166265]  __pm_runtime_resume+0x50/0x98
> [   68.170358]  sh_cmt_start+0x84/0x200
> [   68.173931]  sh_cmt_clocksource_enable+0x28/0x48
> [   68.178546]  change_clocksource+0x84/0x118
> [   68.182639]  multi_cpu_stop+0x8c/0x140
> [   68.186385]  cpu_stopper_thread+0xac/0x120
> [   68.190481]  smpboot_thread_fn+0x1ac/0x2c8
> [   68.194574]  kthread+0x12c/0x130
> [   68.197800]  ret_from_fork+0x10/0x18
> 
> Regards,
> Biju
> 
> > -----Original Message-----
> > From: Biju Das
> > Sent: 25 January 2019 11:27
> > To: 'Geert Uytterhoeven' <geert@linux-m68k.org>; Vincent Guittot
> > <vincent.guittot@linaro.org>; Sergei Shtylyov
> > <sergei.shtylyov@cogentembedded.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>; Simon Horman <horms@verge.net.au>; Magnus
> > Damm <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-
> > soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE
> > TREE BINDINGS <devicetree@vger.kernel.org>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Chris Paterson
> > <Chris.Paterson2@renesas.com>; Daniel Lezcano
> > <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>; John
> > Stultz <john.stultz@linaro.org>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>; Samuel Holland <samuel@sholland.org>
> > Subject: RE: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
> >
> > Hi Geert,
> >
> > Thanks for the feedback. I started testing CMT on latest kernel(Linux-next-
> > 20190125 and also renesas-dev) and found that it is broken on R-Car M3-W
> > device.
> >
> > On further investigation the patch ("
> > 8234f6734c5d74ac794e5517437f51c57d65f865"   PM-runtime: Switch
> > autosuspend over to using hrtimers)  is causing the issue.
> >
> > During clock source switching, It calls the function "sh_cmt_enable"  which
> > calls " pm_runtime_get_sync(&ch->cmt->pdev->dev);"  and after that
> > console freezes.
> >
> > Sergei: Have you noticed this issue  on R-Car V3M and V3H boards with latest
> > kernel?
> >
> > Regards,
> > Biju
> >
> > > -----Original Message-----
> > > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> > > owner@vger.kernel.org> On Behalf Of Geert Uytterhoeven
> > > Sent: 24 January 2019 10:16
> > > To: Biju Das <biju.das@bp.renesas.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > > <mark.rutland@arm.com>; Simon Horman <horms@verge.net.au>;
> > Magnus Damm
> > > <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-
> > > soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE
> > > TREE BINDINGS <devicetree@vger.kernel.org>; Geert Uytterhoeven
> > > <geert+renesas@glider.be>; Chris Paterson
> > > <Chris.Paterson2@renesas.com>; Daniel Lezcano
> > > <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>;
> > > John Stultz <john.stultz@linaro.org>; Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com>; Samuel Holland
> > <samuel@sholland.org>
> > > Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device
> > > nodes
> > >
> > > Hi Biju,
> > >
> > > On Fri, Oct 26, 2018 at 10:32 AM Biju Das <biju.das@bp.renesas.com>
> > wrote:
> > > > This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > ---
> > > > This patch is tested against renesas-dev
> > > >
> > > > I have executed on inconsistency-check, nanosleep and
> > > > clocksource_switch selftests on this arm64 SoC. The
> > > > inconsistency-check and nanosleep tests are working fine.The
> > > > clocksource_switch asynchronous test is failing due to
> > > > inconsistency-check
> > > failure on "arch_sys_counter".
> > > >
> > > > But if i skip the clocksource_switching of "arch_sys_counter", the
> > > > asynchronous test is passing for CMT0/1/2/3 timer.
> > > >
> > > > Has any one noticed this issue?
> > >
> > > clockevents/next now has commit 7cd6dca3600d8d71
> > > ("clocksource/drivers/arch_timer: Workaround for Allwinner A64 timer
> > > instability").  Perhaps this is related, and the same test program may
> > > indicate similar issues?
> > >
> > > See also https://lore.kernel.org/lkml/20190113021719.46457-2-
> > > samuel@sholland.org/
> > >
> > > Gr{oetje,eeting}s,
> > >
> > >                         Geert
> > >
> > > --
> > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> > > geert@linux- m68k.org
> > >
> > > In personal conversations with technical people, I call myself a
> > > hacker. But when I'm talking to journalists I just say "programmer" or
> > something like that.
> > >                                 -- Linus Torvalds
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
