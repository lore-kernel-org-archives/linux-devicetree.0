From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] gpio: Add driver for Zynq GPIO controller
Date: Wed, 18 Jun 2014 08:36:52 -0700
Message-ID: <5cc8b89b-20ff-4fa9-92dd-bb2f6d3512d8@BY2FFO11FD030.protection.gbl>
References: <1403091577-10232-1-git-send-email-harinik@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403091577-10232-1-git-send-email-harinik-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harini Katakam <harini.katakam-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, harinikatakamlinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Harini Katakam <harinik-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

I did some of the changes for this v2 and a few things are not clear to
me.

The first is, how is userspace supposed to find the correct offset for =
a
GPIO pin. E.g. let's say GPIO 10 of this SOC-internal GPIO controller i=
s
something I want to control. So, I'd export GPIO (chip-base + 10). But
this chip-base seems pretty variable. v1 of this patch had it hardcoded
to 0, which resulted in a predictable offset, but apparently was utterl=
y
wrong. Now I see an offset of 138 for this chip when using my config.
And when I use multi_v7_defconfig the offset is somewhere in the 800s,
IIRC. The best I found was the 'label' in the gpiochip's sysfs entry,
but documentation says that is not necessarily unique, and parsing labe=
s
seems sub-optimal too.

The second issue is a stack trace (below) I see when triggering
interrupts (e.g. echo rising > edge; and then pushing the connected
button). Looking at the stack trace, I don't see an obvious error (I
think I pretty much copied the IRQ registration from the gpio-pl061.c
driver you mentioned). Is this an issue in this driver or the core code=
?
This happens on Linus' latest tip. Despite all this chatter the system
still works and doesn't not seem to lock up.

Here the stack trace:
# echo rising > edge
  BUG: sleeping function called from invalid context at kernel/locking/=
mutex.c:586
  in_atomic(): 1, irqs_disabled(): 128, pid: 0, name: swapper/0
  no locks held by swapper/0/0.
  irq event stamp: 55488
  hardirqs last  enabled at (55485): [<c03bf10c>] cpuidle_enter_state+0=
x60/0xec
  hardirqs last disabled at (55486): [<c0014374>] __irq_svc+0x34/0x78
  softirqs last  enabled at (55488): [<c002fc40>] _local_bh_enable+0x58=
/0x64
  softirqs last disabled at (55487): [<c0030534>] irq_enter+0x48/0x88
  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.16.0-rc1-xilinx-00021-gf5=
ddad957172 #88
  [<c0017840>] (unwind_backtrace) from [<c0013770>] (show_stack+0x20/0x=
24)
  [<c0013770>] (show_stack) from [<c04d94a0>] (dump_stack+0x8c/0xd0)
  [<c04d94a0>] (dump_stack) from [<c005d5e4>] (__might_sleep+0x1ac/0x1e=
4)
  [<c005d5e4>] (__might_sleep) from [<c04dc19c>] (mutex_lock_nested+0x4=
0/0x46c)
  [<c04dc19c>] (mutex_lock_nested) from [<c019df34>] (kernfs_notify+0xa=
c/0x148)
  [<c019df34>] (kernfs_notify) from [<c02d89e0>] (gpio_sysfs_irq+0x1c/0=
x24)
  [<c02d89e0>] (gpio_sysfs_irq) from [<c008588c>] (handle_irq_event_per=
cpu+0xa8/0x3c0)
  [<c008588c>] (handle_irq_event_percpu) from [<c0085bf0>] (handle_irq_=
event+0x4c/0x6c)
  [<c0085bf0>] (handle_irq_event) from [<c0088a28>] (handle_simple_irq+=
0xac/0xbc)
  [<c0088a28>] (handle_simple_irq) from [<c0084fec>] (generic_handle_ir=
q+0x30/0x40)
  [<c0084fec>] (generic_handle_irq) from [<c02de3fc>] (zynq_gpio_irqhan=
dler+0xe8/0x130)
  [<c02de3fc>] (zynq_gpio_irqhandler) from [<c0084fec>] (generic_handle=
_irq+0x30/0x40)
  [<c0084fec>] (generic_handle_irq) from [<c000fd24>] (handle_IRQ+0x78/=
0xa0)
  [<c000fd24>] (handle_IRQ) from [<c000868c>] (gic_handle_irq+0x4c/0x70=
)
  [<c000868c>] (gic_handle_irq) from [<c0014384>] (__irq_svc+0x44/0x78)
  Exception stack(0xc0755ec8 to 0xc0755f10)
  5ec0:                   00000001 00000004 00000000 c075fb70 00000001 =
edfc9310
  5ee0: 8ed05707 0000001d 9e7f7ffa 0000001d c0752308 c0755f44 c0755ee0 =
c0755f10
  5f00: c0077340 c03bf110 200d0013 ffffffff
  [<c0014384>] (__irq_svc) from [<c03bf110>] (cpuidle_enter_state+0x64/=
0xec)
  [<c03bf110>] (cpuidle_enter_state) from [<c03bf2a0>] (cpuidle_enter+0=
x24/0x28)
  [<c03bf2a0>] (cpuidle_enter) from [<c0071d94>] (cpu_idle_loop+0x2e0/0=
x6fc)
  [<c0071d94>] (cpu_idle_loop) from [<c00721cc>] (cpupri_find+0x0/0x108=
)
 =20
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [ INFO: inconsistent lock state ]
  3.16.0-rc1-xilinx-00021-gf5ddad957172 #88 Not tainted
  ---------------------------------
  inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
  swapper/0/0 [HC1[1]:SC0[0]:HE0:SE1] takes:
   (kernfs_mutex){?.+.+.}, at: [<c019df34>] kernfs_notify+0xac/0x148
  {HARDIRQ-ON-W} state was registered at:
    [<c0079a08>] lock_acquire+0xfc/0x21c
    [<c04dc1e0>] mutex_lock_nested+0x84/0x46c
    [<c019d668>] kernfs_activate+0x2c/0xf8
    [<c019d9b8>] kernfs_create_root+0xbc/0xe0
    [<c070edac>] sysfs_init+0x20/0x5c
    [<c070cef4>] mnt_init+0x108/0x258
    [<c070caa8>] vfs_caches_init+0x9c/0x110
    [<c06f5c3c>] start_kernel+0x364/0x3fc
    [<00008074>] 0x8074
  irq event stamp: 55488
  hardirqs last  enabled at (55485): [<c03bf10c>] cpuidle_enter_state+0=
x60/0xec
  hardirqs last disabled at (55486): [<c0014374>] __irq_svc+0x34/0x78
  softirqs last  enabled at (55488): [<c002fc40>] _local_bh_enable+0x58=
/0x64
  softirqs last disabled at (55487): [<c0030534>] irq_enter+0x48/0x88
 =20
  other info that might help us debug this:
   Possible unsafe locking scenario:
 =20
         CPU0
         ----
    lock(kernfs_mutex);
    <Interrupt>
      lock(kernfs_mutex);
 =20
   *** DEADLOCK ***
 =20
  no locks held by swapper/0/0.
 =20
  stack backtrace:
  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.16.0-rc1-xilinx-00021-gf5=
ddad957172 #88
  [<c0017840>] (unwind_backtrace) from [<c0013770>] (show_stack+0x20/0x=
24)
  [<c0013770>] (show_stack) from [<c04d94a0>] (dump_stack+0x8c/0xd0)
  [<c04d94a0>] (dump_stack) from [<c0076a50>] (print_usage_bug+0x254/0x=
2c4)
  [<c0076a50>] (print_usage_bug) from [<c0076e6c>] (mark_lock+0x3ac/0x6=
74)
  [<c0076e6c>] (mark_lock) from [<c0078024>] (__lock_acquire+0x934/0x1b=
58)
  [<c0078024>] (__lock_acquire) from [<c0079a08>] (lock_acquire+0xfc/0x=
21c)
  [<c0079a08>] (lock_acquire) from [<c04dc1e0>] (mutex_lock_nested+0x84=
/0x46c)
  [<c04dc1e0>] (mutex_lock_nested) from [<c019df34>] (kernfs_notify+0xa=
c/0x148)
  [<c019df34>] (kernfs_notify) from [<c02d89e0>] (gpio_sysfs_irq+0x1c/0=
x24)
  [<c02d89e0>] (gpio_sysfs_irq) from [<c008588c>] (handle_irq_event_per=
cpu+0xa8/0x3c0)
  [<c008588c>] (handle_irq_event_percpu) from [<c0085bf0>] (handle_irq_=
event+0x4c/0x6c)
  [<c0085bf0>] (handle_irq_event) from [<c0088a28>] (handle_simple_irq+=
0xac/0xbc)
  [<c0088a28>] (handle_simple_irq) from [<c0084fec>] (generic_handle_ir=
q+0x30/0x40)
  [<c0084fec>] (generic_handle_irq) from [<c02de3fc>] (zynq_gpio_irqhan=
dler+0xe8/0x130)
  [<c02de3fc>] (zynq_gpio_irqhandler) from [<c0084fec>] (generic_handle=
_irq+0x30/0x40)
  [<c0084fec>] (generic_handle_irq) from [<c000fd24>] (handle_IRQ+0x78/=
0xa0)
  [<c000fd24>] (handle_IRQ) from [<c000868c>] (gic_handle_irq+0x4c/0x70=
)
  [<c000868c>] (gic_handle_irq) from [<c0014384>] (__irq_svc+0x44/0x78)
  Exception stack(0xc0755ec8 to 0xc0755f10)
  5ec0:                   00000001 00000004 00000000 c075fb70 00000001 =
edfc9310
  5ee0: 8ed05707 0000001d 9e7f7ffa 0000001d c0752308 c0755f44 c0755ee0 =
c0755f10
  5f00: c0077340 c03bf110 200d0013 ffffffff
  [<c0014384>] (__irq_svc) from [<c03bf110>] (cpuidle_enter_state+0x64/=
0xec)
  [<c03bf110>] (cpuidle_enter_state) from [<c03bf2a0>] (cpuidle_enter+0=
x24/0x28)
  [<c03bf2a0>] (cpuidle_enter) from [<c0071d94>] (cpu_idle_loop+0x2e0/0=
x6fc)
  [<c0071d94>] (cpu_idle_loop) from [<c00721cc>] (cpupri_find+0x0/0x108=
)

	Thanks,
	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
