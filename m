From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [of/unittest] 815d74b35e:  BUG: unable to handle kernel NULL
 pointer dereference at 00000012
Date: Mon, 30 Jan 2017 13:42:11 -0500
Message-ID: <20170130134211.5c565fb8@gandalf.local.home>
References: <5887386c.KVVQelScITHnzTIS%fengguang.wu@intel.com>
        <20170124142107.GA628@tigerII.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170124142107.GA628@tigerII.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: kernel test robot <fengguang.wu@intel.com>, LKP <lkp@01.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh@kernel.org>, wfg@linux.intel.com, Peter Zijlstra <peterz@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 24 Jan 2017 23:21:07 +0900
Sergey Senozhatsky <sergey.senozhatsky@gmail.com> wrote:

> Hello,
> 
> Cc Steven

I think you wanted to Cc Peter Zijlstra on this. He's the kernel
maintainer for perf. I do the more generic tracing.

-- Steve

> 
> On (01/24/17 19:20), kernel test robot wrote:
> >     of/unittest: fix infinite loop in of_unittest_destroy_tracked_overlays()
> >
> >     of_overlay_destroy() can return `-ENODEV' error code once it
> >     failed to find the requested overlay in `ov_idr'. However,
> >     of_unittest_destroy_tracked_overlays() does not handle this
> >     error code correctly and continues to call of_overlay_destroy()
> >     on the 'missing' overlay over and over again. This results in
> >     a printk flood
> >
> >     [..]
> >     [   33.497583] of_overlay_destroy: Could not find overlay #6
> >     [   33.497583] of_overlay_destroy: Could not find overlay #6
> >     [   33.497584] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
> >     [   33.497584] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
> >     [   33.497586] of_overlay_destroy: Could not find overlay #6
> >     [   33.497586] of_overlay_destroy: Could not find overlay #6
> >     [   33.497587] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
> >     [   33.497587] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
> >     [..]  
> 
> hm, frankly... I see no connection.
> // I even checked the date of the mail, because the commit is from March 2016.
> 
> > [   14.130887] sock: process `trinity-main' is using obsolete setsockopt SO_BSDCOMPAT
> > [   18.803451] BUG: unable to handle kernel NULL pointer dereference at 00000012
> > [   18.805819] IP: [<c9aa6893>] perf_prepare_sample+0x82/0x2a7
> > [   18.807694] *pde = 00000000 
> > [   18.809017] Oops: 0000 [#1] DEBUG_PAGEALLOC 
> > [   18.810162] Modules linked in:
> > [   18.811069] CPU: 0 PID: 12140 Comm: trinity-main Not tainted 4.5.0-rc1-00010-g815d74b #1
> > [   18.812906] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
> > [   18.815004] task: d013ca00 ti: d0614000 task.ti: d0614000
> > [   18.816107] EIP: 0060:[<c9aa6893>] EFLAGS: 00010206 CPU: 0
> > [   18.817247] EIP is at perf_prepare_sample+0x82/0x2a7
> > [   18.818305] EAX: 00000012 EBX: d0615d24 ECX: 00000008 EDX: 00000001
> > [   18.819499] ESI: d0615e00 EDI: d06184b0 EBP: d0615d08 ESP: d0615ce4
> > [   18.820713]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
> > [   18.821827] CR0: 80050033 CR2: 00000012 CR3: 1068d000 CR4: 00040610
> > [   18.823044] DR0: c0100220 DR1: 080ce000 DR2: 00000000 DR3: 00000000
> > [   18.824240] DR6: ffff0ff0 DR7: 00010602
> > [   18.825162] Stack:
> > [   18.825885]  00000000 00000000 c9aa6ab8 00000000 00000000 000021ea d06184b0 d0615e00
> > [   18.828238]  d0615fb4 d0615d50 c9aa6af3 d0615fb4 00000002 00000000 00000000 c9aa6ab8
> > [   18.830578]  00000009 00300002 d013ce78 d0615d3c c9a2888f d013ce78 d0615d48 c9a07cf5
> > [   18.832911] Call Trace:
> > [   18.833732]  [<c9aa6ab8>] ? perf_prepare_sample+0x2a7/0x2a7
> > [   18.834865]  [<c9aa6af3>] perf_event_output+0x3b/0x89
> > [   18.835929]  [<c9aa6ab8>] ? perf_prepare_sample+0x2a7/0x2a7
> > [   18.837114]  [<c9a2888f>] ? kvm_sched_clock_read+0x9/0x18
> > [   18.838211]  [<c9a07cf5>] ? sched_clock+0x9/0xd
> > [   18.839217]  [<c9aa6ca6>] __perf_event_overflow+0x165/0x1d2
> > [   18.840381]  [<c9aa742f>] perf_swevent_overflow+0x46/0x60
> > [   18.841481]  [<c9aa750b>] perf_swevent_event+0xc2/0xcc
> > [   18.842554]  [<c9aa7ab1>] ___perf_sw_event+0x24b/0x25b
> > [   18.843678]  [<c9a07cf5>] ? sched_clock+0x9/0xd
> > [   18.844687]  [<c9a28871>] ? kvm_clock_read+0x14/0x1d
> > [   18.845744]  [<c9a2888f>] ? kvm_sched_clock_read+0x9/0x18  
> 
> 
> this doesn't look like 'of/unittest' related problem to me.
> a NULL deref in perf_prepare_sample(). hm.
> 
> 	-ss
