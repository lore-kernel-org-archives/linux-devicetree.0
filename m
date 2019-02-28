From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC 4/4] [WIP] ARM: shmobile: Enable ARM_GLOBAL_TIMER on
 Cortex-A9 MPCore SoCs
Date: Thu, 28 Feb 2019 11:34:36 +0100
Message-ID: <CAMuHMdW2U_UmMNXdmG27FBmY7PYtQ=Pju6ZhDtxVSTQFzh+j6w@mail.gmail.com>
References: <20180731160855.6758-1-geert+renesas@glider.be>
 <20180731160855.6758-5-geert+renesas@glider.be>
 <CAMuHMdWSsjO731VwMeLXqDjCboH=7k546PjovN5yPEHwn8zu9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdWSsjO731VwMeLXqDjCboH=7k546PjovN5yPEHwn8zu9g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 21, 2018 at 9:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Jul 31, 2018 at 6:08 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > SH-Mobile AG5 and R-Car H1 SoCs are based on the Cortex-A9 MPCore, which
> > includes a global timer.
> >
> > Enable the ARM global timer on these SoCs, which will be used for:
> >   - the scheduler clock, improving scheduler accuracy from 10 ms to 3 or
> >     4 ns,
> >   - delay loops, allowing removal of calls to shmobile_init_delay() from
> >     the corresponding machine vectors.
> >
> > Note that when using an old DTB lacking the global timer, the kernel
> > will still work.  However, loops-per-jiffies will no longer be preset,
> > and the delay loop will need to be calibrated during boot.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This seems to cause random system resume issues on the venerable SH-Mobile
> AG5, ranging from plain lockups to RCU warnings:
>
> WARNING: suspicious RCU usage
> 4.18.0-kzm9g-00218-gaf4425056bd09e9e #38 Not tainted
> -----------------------------
> kernel/sched/fair.c:6231 suspicious rcu_dereference_check() usage!
>
> other info that might help us debug this:
>
>
> RCU used illegally from offline CPU!
> rcu_scheduler_active = 2, debug_locks = 1
> 3 locks held by swapper/1/0:
>  #0: 6d7f5781 ((cpu_died).wait.lock){....}, at: complete+0x14/0x48
>  #1: 84ce6f8e (&p->pi_lock){-.-.}, at: try_to_wake_up+0x30/0x3cc
>  #2: 93591133 (rcu_read_lock){....}, at: select_task_rq_fair+0x5c/0xe8c
>
> stack backtrace:
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> 4.18.0-kzm9g-00218-gaf4425056bd09e9e #38
> Hardware name: Generic SH73A0 (Flattened Device Tree)
> [<c010f22c>] (unwind_backtrace) from [<c010bab0>] (show_stack+0x10/0x14)
> [<c010bab0>] (show_stack) from [<c0599750>] (dump_stack+0x9c/0xd4)
> [<c0599750>] (dump_stack) from [<c01542c8>] (select_task_rq_fair+0x140/0xe8c)
> [<c01542c8>] (select_task_rq_fair) from [<c0149494>]
> (try_to_wake_up+0x210/0x3cc)
> [<c0149494>] (try_to_wake_up) from [<c016355c>] (__wake_up_common+0xcc/0x140)
> [<c016355c>] (__wake_up_common) from [<c01636a8>] (__wake_up_locked+0x14/0x1c)
> [<c01636a8>] (__wake_up_locked) from [<c016450c>] (complete+0x38/0x48)
> [<c016450c>] (complete) from [<c010d66c>] (arch_cpu_idle_dead+0x2c/0x8c)
> [<c010d66c>] (arch_cpu_idle_dead) from [<c014edec>] (do_idle+0x98/0x148)
> [<c014edec>] (do_idle) from [<c014f1fc>] (cpu_startup_entry+0x18/0x1c)
> [<c014f1fc>] (cpu_startup_entry) from [<4010246c>] (0x4010246c)
>
> Given secondary CPU startup is already quite flaky on this SoC, perhaps
> it's best to leave it alone?

Last time I saw that was on v4.19-rc7 in October.
Presumably that was fixed in the big RCU update in v4.20-rc1, so I think
it's safe to use the Global Timer on SH Mobile AG5 now.

Thoughts?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
