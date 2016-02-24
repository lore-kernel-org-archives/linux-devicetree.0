From: Petr Mladek <pmladek@suse.com>
Subject: Re: [lkp] [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 24 Feb 2016 12:46:14 +0100
Message-ID: <20160224114614.GY3305@pathway.suse.cz>
References: <87fuwk1c0o.fsf@yhuang-dev.intel.com>
 <20160223131538.GA2048@swordfish>
 <20160223155331.GA448@swordfish>
 <20160224011941.GA7683@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160224011941.GA7683@swordfish>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: kernel test robot <ying.huang@linux.intel.com>, lkp@01.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Calvin Owens <calvinowens@fb.com>, Dave Jones <davej@codemonkey.org.uk>, Kyle McMartin <kyle@kernel.org>, Tejun Heo <tj@kernel.org>, Jan Kara <jack@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed 2016-02-24 10:19:41, Sergey Senozhatsky wrote:
> 
> Hello,
> 
> Cc Rob, Frank, Grant
> 
> On (02/24/16 00:53), Sergey Senozhatsky wrote:
> [..]
> >  284 [    0.000000]  per task-struct memory footprint: 2112 bytes
> >  285 [    0.000000]  per task-struct memory footprint: 2112 bytes
> >  286 [    0.000000] ------------------------
> >  287 [    0.000000] ------------------------
> >  288 [    0.000000] | Locking API testsuite:
> >  289 [    0.000000] | Locking API testsuite:
> >  290 [    0.000000] ----------------------------------------------------------------------------
> >  291 [    0.000000] ----------------------------------------------------------------------------
> >  292 [    0.000000]                                  | spin |wlock |rlock |mutex | wsem | rsem |
> >  293 [    0.000000]                                  | spin |wlock |rlock |mutex | wsem | rsem |
> >  294 [    0.000000]   --------------------------------------------------------------------------
> >  295 [    0.000000]   --------------------------------------------------------------------------
> > 
> > 
> > looking at your Kernel command line
> > 
> > [    0.000000] Kernel command line: root=/dev/ram0 user=lkp job=/lkp/scheduled/vm-kbuild-yocto-i386-53/bisect_boot-1-yocto-minimal-i386.cgz-i386-randconfig-h1-02192137-34578dc67f38c02ccbe696e4099967884caa8e15-20160220-72722-vao2m5-0.yaml ARCH=i386 kconfig=i386-randconfig-h1-02192137 branch=linux-next/master commi     t=34578dc67f38c02ccbe696e4099967884caa8e15 BOOT_IMAGE=/pkg/linux/i386-randconfig-h1-02192137/gcc-5/34578dc67f38c02ccbe696e4099967884caa8e15/vmlinuz-4.5.0-rc4-00295-g34578dc max_uptime=600 RESULT_ROOT=/result/boot/1/vm-kbuild-yocto-i386/yocto-minimal-i386.cgz/i386-randconfig-h1-02192137/gcc-5/34578dc67f38c02ccbe69     6e4099967884caa8e15/9 LKP_SERVER=inn earlyprintk=ttyS0,115200 systemd.log_level=err debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 p
 anic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 console=ttyS0,115200 console=tty0 vga=normal rw ip=::::vm-kbuild-yo     cto-i386-53::dhcp drbd.minor_count=8
> > 
> > 
> > - earlyprintk=ttyS0,115200
> > - console=ttyS0,115200
> > - console=tty0
> > 
> > and I see "bootconsole [earlyser0] enabled" but no "bootconsole [earlyser0] disabled" message, which
> > I'd expect to see...
> > 
> 
> 
> and you get the NMI watchdog softlockup because you have a whole bunch of
> 
>    "of_overlay_destroy: Could not find overlay #6"
>    "### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6"
> 
> messages to print. seems that somehitng just pushes them in a loop.
> there are too many of them:

This sounds like a reasonable explanation. It seems that
of_unittest_destroy_tracked_overlays() really ended in an infinite
loop.

But I am still curious why the softlookup points to

[   33.497718] EIP is at vprintk_emit+0x1ea/0x600

Also there is on the stack

[   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
[   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
[   33.497744]  [<c06fdf6e>] printk+0x11/0x13
[   33.497744]  [<c06fdf6e>] printk+0x11/0x13
[   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
[   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
[   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d
[   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d

I would expect that the soft lookup happens in console_unlock()
called with IRQs disabled. It seems to me that of_unittest_overlay()
is called with IRQs enabled.

I want to be sure that the patch in printk() did not introduce
a deadlock that is visible only under a high printk load.

I guess that the softlookup was not visible before the
printk patch was applied. I wonder if the patch made something
worse. It was supposed to improve things but...

Do I miss something, please?

Best Regards,
Petr
