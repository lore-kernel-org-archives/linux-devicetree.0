From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V12 2/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Fri, 14 Jun 2019 11:23:02 +0100
Message-ID: <20190614102302.GD10659@fuggles.cambridge.arm.com>
References: <1556736193-29411-1-git-send-email-Frank.Li@nxp.com>
 <1556736193-29411-2-git-send-email-Frank.Li@nxp.com>
 <20190613112320.GA18966@fuggles.cambridge.arm.com>
 <CAHrpEqRZ0YL9SFk6o7iebJ+diJVMTtyba_9GtujL7H7e4G8qQA@mail.gmail.com>
 <20190613174436.GG18966@fuggles.cambridge.arm.com>
 <CAHrpEqS9GEC9Shf-6xLL0_+WJNuwYOdKe=5jtUogLajfcWYMew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqS9GEC9Shf-6xLL0_+WJNuwYOdKe=5jtUogLajfcWYMew@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhi Li <lznuaa@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 02:13:20PM -0500, Zhi Li wrote:
> On Thu, Jun 13, 2019 at 12:44 PM Will Deacon <will.deacon@arm.com> wrote:
> >
> > On Thu, Jun 13, 2019 at 12:04:37PM -0500, Zhi Li wrote:
> > > On Thu, Jun 13, 2019 at 6:23 AM Will Deacon <will.deacon@arm.com> wrote:
> > > >
> > > > On Wed, May 01, 2019 at 06:43:29PM +0000, Frank Li wrote:
> > > > > Add ddr performance monitor support for iMX8QXP
> > > > >
> > > > > There are 4 counters for ddr perfomance events.
> > > > > counter 0 is dedicated for cycles.
> > > > > you choose any up to 3 no cycles events.
> > > > >
> > > > > for example:
> > > > >
> > > > > perf stat -a -e imx8_ddr0/read-cycles/,imx8_ddr0/write-cycles/,imx8_ddr0/precharge/ ls
> > > > > perf stat -a -e imx8_ddr0/cycles/,imx8_ddr0/read-access/,imx8_ddr0/write-access/ ls
> > > >
> > > > I've pushed patches 1, 2 and 4 out with some minor tweaks to:
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-next/perf
> > > >
> > > > I'll leave the actual .dts change to go via the soc tree, since last time
> > > > I took one of those it just resulted in conflicts.
> > > >
> > > > Frank, Andrey: Please could you try to run the perf fuzzer on this before
> > > > it lands in mainline? It has a good track record of finding nasty PMU driver
> > > > bugs, but it obviously requires access to hardware which implements the PMU:
> > > >
> > > > http://web.eece.maine.edu/~vweaver/projects/perf_events/fuzzer/
> > >
> > > Okay, how long should be run generally?
> > > I need make sure it can pass without my patches at our platform.
> >
> > As you long as you can really, but if it survives a few hours that's usually
> > a good sign. Overnight is even better.
> 
> Base on commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jun 2 13:55:33 2019 -0700
> 
>     Linux 5.2-rc3
> 
> RCU report problem:
> 
> [ 6048.741784] rcu: INFO: rcu_preempt self-detected stall on CPU
> [ 6048.747550] rcu:     1-....: (5249 ticks this GP)
> idle=c5a/1/0x4000000000000004 softirq=503121/503121 fqs=2425
> [ 6048.757384]  (t=5253 jiffies g=1416105 q=117)
> [ 6048.761745] Task dump for CPU 1:
> [ 6048.764977] perf_fuzzer     R  running task        0 32520    426 0x00000202
> [ 6048.772030] Call trace:
> [ 6048.774493]  dump_backtrace+0x0/0x130
> [ 6048.778159]  show_stack+0x14/0x20
> [ 6048.781477]  sched_show_task+0x108/0x138
> [ 6048.785401]  dump_cpu_task+0x40/0x4c
> [ 6048.788983]  rcu_dump_cpu_stacks+0x94/0xd0
> [ 6048.793082]  rcu_sched_clock_irq+0x5e0/0x918
> [ 6048.797357]  update_process_times+0x2c/0x70
> [ 6048.801545]  tick_sched_handle.isra.6+0x3c/0x50
> [ 6048.806076]  tick_sched_timer+0x48/0x98
> [ 6048.809918]  __hrtimer_run_queues+0x118/0x1a8
> [ 6048.814277]  hrtimer_interrupt+0xe4/0x238
> [ 6048.818296]  arch_timer_handler_phys+0x2c/0x38
> [ 6048.822743]  handle_percpu_devid_irq+0x80/0x140
> [ 6048.827277]  generic_handle_irq+0x24/0x38

This is the timer interrupt which prompts the RCU splat. Do you have
information about where the CPU was when the interrupt occurred?

In the meantime, it's still worth leaving the fuzzer running to see what
else it finds.

Will
