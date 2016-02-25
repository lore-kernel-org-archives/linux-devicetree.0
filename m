From: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [lkp] [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Thu, 25 Feb 2016 14:10:05 +0900
Message-ID: <20160225051005.GA884@swordfish>
References: <87fuwk1c0o.fsf@yhuang-dev.intel.com>
 <20160223131538.GA2048@swordfish>
 <20160223155331.GA448@swordfish>
 <20160224011941.GA7683@swordfish>
 <20160224114614.GY3305@pathway.suse.cz>
 <20160224125022.GA516@swordfish>
 <20160224151242.GA2254@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160224151242.GA2254@swordfish>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel test robot <ying.huang-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, lkp-JC7UmRfGjtg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Calvin Owens <calvinowens-b10kYP2dOMg@public.gmane.org>, Dave Jones <davej-rdkfGonbjUTCLXcRTR1eJlpr/1R2p/CL@public.gmane.org>, Kyle McMartin <kyle-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jan Kara <jack-IBi9RG/b67k@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On (02/25/16 00:12), Sergey Senozhatsky wrote:
[..]
> > > I want to be sure that the patch in printk() did not introduce
> > > a deadlock that is visible only under a high printk load.
> 
> I'll do more tests, certainly.

No behavioral change between linux-next and linux-next modulo printk patches was observed.

next-20160224

git revert 8a30bf8ff5e07a589ad43363b06ea361ad723a0e 2822460a0ea97656ae71b2b4ddac087f79c5876a b6751672d3ac1d3d876fd5ea7ec579956eee4d6b


set PREEMPT_NONE

CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y



add PANIC of softlockup and panic on hung_task

CONFIG_LOCKUP_DETECTOR=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y			<<
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=1
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=11
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y			<<
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=1
CONFIG_WQ_WATCHDOG=y
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=23



modify watchdog timeout (so it detects lockup sooner) and add
printk() flood -- the code does not even disable preemption,
just busy looping, we have PREEMPT_NONE kernel.


git diff

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 46055db..8759dbb 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1410,6 +1410,21 @@ static int __init zram_init(void)
 {
        int ret;
 
+       /*unsigned long flags;*/
+       u64 s, e;
+
+       /*preempt_disable();*/
+       s = local_clock() >> 31UL;
+       while (1) {
+               e = local_clock() >> 31UL;
+               if (e - s > 10)
+                       goto out;
+               pr_err(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n");
+       }
+out:
+       /*preempt_enable();*/
+
+
        ret = class_register(&zram_control_class);
        if (ret) {
                pr_err("Unable to register zram-control class\n");
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index b3ace6e..8655364 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -54,7 +54,7 @@ static unsigned long __read_mostly watchdog_enabled = SOFT_WATCHDOG_ENABLED;
 int __read_mostly nmi_watchdog_enabled;
 int __read_mostly soft_watchdog_enabled;
 int __read_mostly watchdog_user_enabled;
-int __read_mostly watchdog_thresh = 10;
+int __read_mostly watchdog_thresh = 1;
 
 #ifdef CONFIG_SMP
 int __read_mostly sysctl_softlockup_all_cpu_backtrace;


---


The test (unpatched linux-next)


NMI watchdog: BUG: soft lockup - CPU#2 stuck for 3s! [modprobe:418]
Modules linked in: ...
irq event stamp: 40679
hardirqs last  enabled at (40679): [<ffffffff8108b771>] vprintk_emit+0x3f0/0x499
hardirqs last disabled at (40678): [<ffffffff8108b3d4>] vprintk_emit+0x53/0x499
softirqs last  enabled at (35360): [<ffffffff810475e9>] __do_softirq+0x2d8
softirqs last disabled at (35357): [<ffffffff810478ce>] irq_exit+0x41/0x95
CPU: 2 PID: 418 Comm: modprobe Tainted: G           O    4.5.0-rc5-next-20160224-dbg-00012-gfedb791-dirty #187
Hardware name: ...
task: ffff88013290ce00 ti: ffff880131f98000 task.ti: ffff880131f98000
RIP: 0010:[<ffffffff8108b2d8>]  [<ffffffff8108b2d8>] console_unlock+0x3ad/0x456
RSP: 0018:ffff880131f9bbc8  EFLAGS: 00000246
RAX: ffff88013290ce00 RBX: ffffffff82891fdc RCX: 00000000ffffffff
RDX: ffffffff812c99a8 RSI: 0000000000000001 RDI: ffffffff8108b2d5
RBP: ffff880131f9bc08 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffff00ff R11: 000000000000042b R12: 0000000000000000
R13: 0000000000000246 R14: 0000000000000003 R15: 0000000000000001
S:  00007fe6ed4fd700(0000) GS:ffff880137d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe6eb905000 CR3: 00000000bb7fc000 CR4: 00000000000006e0
Stack:
 0000000000000000 0000000000000029 000000000001a128 00000000ffffffff
 0000000000000003 0000000000000028 ffffffff82877602 0000000000000028
 ffff880131f9bc60 ffffffff8108b7cb 0000000000000000 0000000000000000
Call Trace:
 [<ffffffff8108b7cb>] vprintk_emit+0x44a/0x499
 [<ffffffffa01f0000>] ? 0xffffffffa01f0000
 [<ffffffff8108b931>] vprintk_default+0x1d/0x1f
 [<ffffffff810f1b21>] printk+0x48/0x50
 [<ffffffffa01f0032>] zram_init+0x32/0x1000 [zram]
 [<ffffffff81000402>] do_one_initcall+0xe7/0x16
 [<ffffffff810f1d5f>] ? do_init_module+0x27/0x1d9
 [<ffffffff81093619>] ? rcu_read_lock_sched_held+0x61/0x69
 [<ffffffff811330fa>] ? kmem_cache_alloc_trace+0x138/0x1d0
 [<ffffffff810f1d5f>] ? do_init_module+0x27/0x1d9
 [<ffffffff810f1d97>] do_init_module+0x5f/0x1d9
 [<ffffffff810b2b2c>] load_module+0x19da/0x1eb8
 [<ffffffff810830c4>] ? lock_acquire+0x10f/0x1a3
 [<ffffffff810b3109>] SyS_init_module+0xff/0x125
 [<ffffffff810b3109>] ? SyS_init_module+0xff/0x125
 [<ffffffff8150e525>] entry_SYSCALL_64_fastpath+0x18/0xa8
Code: 89 05 11 cc 80 01 4c 89 35 0e cc 80 01 88 d0 83 e2 fe 83 e0 1e 88 53 0f 0f b6 c0 89 05 f2 cb 80 01 eb 9e e8 9e 5a ff ff 41 55 9d <e9> ed fe ff ff 48 83 3d 3b cd 80 01 00 c7 05 3d cd 80 01 00 00

Kernel panic - not syncing: softlockup: hung tasks
CPU: 2 PID: 418 Comm: modprobe Tainted: G           O L  4.5.0-rc5-next-20160224-dbg-00012-gfedb791-dirty #187
Hardware name: ...
 0000000000000000 ffff880137d03d68 ffffffff8123334d ffffffff817ad7c7
 ffff880137d03df8 ffff880137d03de8 ffffffff810f124e ffffffff00000008
 ffff880137d03df8 ffff880137d03d90 0000000000000000 00000000ffffffff
Call Trace:
 <IRQ>  [<ffffffff8123334d>] dump_stack+0x67/0x90
 [<ffffffff810f124e>] panic+0xd1/0x212
 [<ffffffff8107d1c1>] ? down_trylock+0x2d/0x37
 [<ffffffff810c12c5>] watchdog_timer_fn+0x18e/0x1b0
 [<ffffffff8109cee9>] __hrtimer_run_queues+0x1ee/0x418
 [<ffffffff810c1137>] ? __touch_watchdog+0x1c/0x1c
 [<ffffffff8109d2af>] hrtimer_interrupt+0xa8/0x192
 [<ffffffff810354cd>] hpet_interrupt_handler+0x2a/0x31
 [<ffffffff8108ccd8>] handle_irq_event_percpu+0xd2/0x2e4
 [<ffffffff8108cf22>] handle_irq_event+0x38/0x56
 [<ffffffff8108fc63>] handle_edge_irq+0xd9/0xfb
 [<ffffffff810174ad>] handle_irq+0x1c/0x20
 [<ffffffff81510795>] do_IRQ+0x85/0x1
 [<ffffffff8150ee86>] common_interrupt+0x86/0x86
 <EOI>  [<ffffffff812c99a8>] ? vt_console_print+0x2f9/0x308
 [<ffffffff8108b2d5>] ? console_unlock+0x3aa/0x456
 [<ffffffff8108b2d8>] ? console_unlock+0x3ad/0x456
 [<ffffffff8108b7cb>] vprintk_emit+0x44a/0x499
 [<ffffffffa01f0000>] ? 0xffffffffa01f0000
 [<ffffffff8108b931>] vprintk_default+0x1d/0x1f
 [<ffffffff810f1b21>] printk+0x48/0x50
 [<ffffffffa01f0032>] zram_init+0x32/0x1000 [zram]
 [<ffffffff81000402>] do_one_initcall+0xe7/0x16c
 [<ffffffff810f1d5f>] ? do_init_module+0x27/0x1d9
 [<ffffffff81093619>] ? rcu_read_lock_sched_held+0x61/0x69
 [<ffffffff811330fa>] ? kmem_cache_alloc_trace+0x138/0x1d0
 [<ffffffff810f1d5f>] ? do_init_module+0x27/0x1d9
 [<ffffffff810f1d97>] do_init_module+0x5f/0x1d9
 [<ffffffff810b2b2c>] load_module+0x19da/0x1eb8
 [<ffffffff810830c4>] ? lock_acquire+0x10f/0x1a3
 [<ffffffff810b3109>] SyS_init_module+0xff/0x125
 [<ffffffff810b3109>] ? SyS_init_module+0xff/0x125
 [<ffffffff8150e525>] entry_SYSCALL_64_fastpath+0x18/0xa8



so in this test printk()->console_unlock() was performed on the same CPU.
but in general those can be different CPUs. one busy spinning doing printk(),
the other busy spinning doing console_unlock()->call_console_drivers().

	-ss
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
