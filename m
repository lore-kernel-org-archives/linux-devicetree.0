Return-Path: <SRS0=UYaU=L3=linutronix.de=bigeasy@kernel.org>
Date: Thu, 13 Sep 2018 10:51:04 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH] of: allocate / free phandle cache outside of the
 devtree_lock
Message-ID: <20180913085104.ued4ry2ombz56kqm@linutronix.de>
References: <20180910154227.xsbbqvw3cayro4gg@linutronix.de>
 <bf025894-beab-1cae-f87b-105fa341c0e0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bf025894-beab-1cae-f87b-105fa341c0e0@gmail.com>
To: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de
List-ID: <devicetree@vger.kernel.org>

On 2018-09-12 18:01:49 [-0700], Frank Rowand wrote:
> Hi Sebastion,
Hi Frank,

> On 09/10/18 08:42, Sebastian Andrzej Siewior wrote:
> > The phandle cache code allocates memory while holding devtree_lock which
> > is a raw_spinlock_t. Memory allocation (and free()) is not possible on
> > RT while a raw_spinlock_t is held.
> 
> I am assuming that by "RT" you mean "PREEMPT_RT".
correct.

> Can you point me to the
> current documentation about memory allocation and freeing with PREEMPT_RT
> enabled so that I can update my understanding?  Especially why GFP_ATOMIC
> is not sufficient for allocation.

I don't think that there is any documentation. The raw_* spinlock
actually do disable interrupts and preemption and the memory allocation
"might" require the use of sleeping locks which does not work.
And yes, GFP_ATOMIC makes no difference (there are no memory allocations
with disabled interrupts on RT, spin_lock_irqsave() is a sleeping lock
which does not disable interrupts).

> > Invoke the kfree() and kcalloc() while the lock is dropped.
> > 
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> > 
> > The devtree_lock lock is raw_spin_lock_t and as of today there are a few
> > users which invoke a DT call via a smp_function_call and need it that
> > way.
> 
> Can you please point me to these smp_call_function instances?

sure, that one pops up on a arm64 box:

| BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:974
| in_atomic(): 1, irqs_disabled(): 128, pid: 18, name: cpuhp/0
| Preemption disabled at:
| [<ffff000008163580>] smp_call_function_single+0x58/0x1e0
| CPU: 0 PID: 18 Comm: cpuhp/0 Not tainted 4.18.7-rt5+ #8
| Hardware name: AMD Seattle/Seattle, BIOS 10:18:39 Dec  8 2016
| Call trace:
|  dump_backtrace+0x0/0x188
|  show_stack+0x14/0x20
|  dump_stack+0x8c/0xac
|  ___might_sleep+0x128/0x158
|  rt_spin_lock+0x38/0x78

That spin_lock() is sleeping and used in irq-off section.

|  of_find_property+0x2c/0x60
|  of_phandle_iterator_init+0x58/0xb8
|  __of_parse_phandle_with_args+0x48/0x108
|  of_find_next_cache_node+0x40/0xc8
|  of_find_last_cache_level+0x58/0xb0
|  _init_cache_level+0x84/0xc8
|  generic_exec_single+0xec/0x138
|  smp_call_function_single+0xa4/0x1e0

The smp call I was talking about.

|  init_cache_level+0x34/0x58
|  cacheinfo_cpu_online+0x18/0x6a0
|  cpuhp_invoke_callback+0xa0/0x810
|  cpuhp_thread_fun+0x108/0x190
|  smpboot_thread_fn+0x1b4/0x2e8
|  kthread+0x134/0x138
|  ret_from_fork+0x10/0x18
| cacheinfo: Unable to detect cache hierarchy for CPU 0

I *think* powerpc (32 and/or 64) has more of devtree_lock usage in
irq-off sections on RT during setup/boot and that is why the lock has
been made raw in the first place. I don't know if this is still the
case.

> > If this is not acceptable, is there a reason not to use RCU lookups?
> > Since every lookup requires to hold devtree_lock it makes parallel
> > lookups not possible (not sure if it needed / happens, maybe only during
> > boot).
> 
> Using locks on phandle lookup should not be a performance issue.  If someone
> finds it to be an issue they should report it.

Don't get me wrong. Two lookups of an OF node would require to have
devtree_lock held during that time so both lookups can't happen in
parallel. This has nothing to do with phandle hunk here; I am just
pointing it out.
I dropped the lock here during the memory allocation because it doesn't
work on RT. If that is acceptable upstream then I would consider this
closed.
If not then I would suggest to use RCU on the reader side for lookups
and the writer side could use devtree_lock as a simple spin_lock.
Besides working on RT it would allow parallel lookups which might in
turn improve performance. So better performance (if at all) would be a
side effect :)

> -Frank

Sebastian
