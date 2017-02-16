From: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [of/unittest] 815d74b35e:  BUG: unable to handle kernel NULL
 pointer dereference at 00000012
Date: Thu, 16 Feb 2017 15:05:50 +0800
Message-ID: <20170216070550.jb6dctiz3mshafg7@wfg-t540p.sh.intel.com>
References: <5887386c.KVVQelScITHnzTIS%fengguang.wu@intel.com>
 <20170124142107.GA628@tigerII.localdomain>
 <20170130134211.5c565fb8@gandalf.local.home>
 <20170131104109.GN6515@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170131104109.GN6515-ndre7Fmf5hadTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LKP <lkp-JC7UmRfGjtg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 31, 2017 at 11:41:09AM +0100, Peter Zijlstra wrote:
>On Mon, Jan 30, 2017 at 01:42:11PM -0500, Steven Rostedt wrote:
>
>> I think you wanted to Cc Peter Zijlstra on this. He's the kernel
>> maintainer for perf. I do the more generic tracing.
>
>> > > [   18.811069] CPU: 0 PID: 12140 Comm: trinity-main Not tainted 4.5.0-rc1-00010-g815d74b #1
>
>What does a recent kernel do?

I just checked 4.10-rc8 and don't find that BUG any more.

There are 2 "NULL pointer dereference" bugs, however their call traces
are both related to BPF:

     16 BUG: kernel reboot-without-warning in test stage
      3 Oops: 0000 [#1]
      2 Oops: 0002 [#1]
      2 BUG: unable to handle kernel NULL pointer dereference at 0000001c
      1 INFO: Slab 0xd55cb200 objects=16 used=16 fp=0x  (null) flags=0x15000101
      1 INFO: Slab 0xcfacd560 objects=16 used=4 fp=0xcd82bab0 flags=0xd000101
      1 INFO: Slab 0xcfaa1a40 objects=18 used=18 fp=0x  (null) flags=0xd000100
      1 INFO: Object 0xcd82b008 @offset=8 fp=0x42c9f478
      1 INFO: Object 0xcc2525f0 @offset=1520 fp=0x71a0718e
      1 INFO: Freed in 0x88 age=4294882663 cpu=0 pid=-1861259411
      1 INFO: Freed in 0x6a age=2649007364 cpu=0 pid=139
      1 INFO: Allocated in 0xb00008 age=4294882663 cpu=1658843968 pid=140
      1 INFO: Allocated in 0x8c age=4294881566 cpu=2118475169 pid=56
      1 INFO: 0xcd82b000-0xcd82b007. First byte 0x61 instead of 0xcc
      1 INFO: 0xcc2525e8-0xcc2525ef. First byte 0x5d instead of 0xbb
      1 BUG: unable to handle kernel paging request at fffff024
      1 BUG: unable to handle kernel paging request at 0000e24e
      1 BUG: unable to handle kernel NULL pointer dereference at 00000009
      1 BUG kmalloc-64 (Not tainted): Redzone overwritten
      1 BUG kmalloc-64 (Not tainted): Padding overwritten. 0xd6010f80-0xd6010fff
      1 BUG kmalloc-32 (Not tainted): Redzone overwritten

dmesg-quantal-vp-9:20170216143544:i386-randconfig-b0-01241049:4.10.0-rc8:1

[   14.584469] sock: process `trinity-main' is using obsolete setsockopt SO_BSDCOMPAT
[   15.041479] BUG: unable to handle kernel NULL pointer dereference at 00000009
[   15.043102] IP: __purge_vmap_area_lazy+0x39/0xd8
[   15.044359] *pde = 00000000
[   15.044360]
[   15.045911] Oops: 0000 [#1]
[   15.046782] Modules linked in:
[   15.047700] CPU: 0 PID: 20 Comm: kworker/0:1 Not tainted 4.10.0-rc8 #1
[   15.049592] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
[   15.052005] Workqueue: events bpf_prog_free_deferred
[   15.053211] task: d6eb91c0 task.stack: d6fe0000
[   15.054348] EIP: __purge_vmap_area_lazy+0x39/0xd8
[   15.055602] EFLAGS: 00010206 CPU: 0
[   15.056582] EAX: ffffffe9 EBX: d7c196d0 ECX: 00000001 EDX: 00000001
[   15.057993] ESI: c348376c EDI: d9792000 EBP: d6fe1e90 ESP: d6fe1e84
[   15.059409]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
[   15.060683] CR0: 80050033 CR2: 00000009 CR3: 18538000 CR4: 00000610
[   15.062095] Call Trace:
[   15.062915]  vm_unmap_aliases+0xb7/0xe7
[   15.063956]  change_page_attr_set_clr+0xe6/0x2e5
[   15.065116]  ? __lock_acquire+0x199/0x699
[   15.066277]  set_memory_rw+0x21/0x23
[   15.067270]  bpf_prog_free_deferred+0x16/0x20
[   15.068387]  process_one_work+0x20b/0x3de
[   15.069588]  worker_thread+0x242/0x317
[   15.070818]  kthread+0xf7/0xfc
[   15.071940]  ? rescuer_thread+0x294/0x294
[   15.073214]  ? kthread_worker_fn+0xf5/0xf5
[   15.074491]  ret_from_fork+0x21/0x2c
[   15.075683] Code: cd 49 c3 00 74 11 83 ca ff b8 f8 37 48 c3 e8 34 71 f7 ff 85 c0 74 35 31 db 87 1d 20 17 b8 c3 83 eb 20 31 d2 89 d8 83 f8 e0 74 0a <8b> 40 20 b2 01 83 e8 20 eb f1 31 c0 84 d2 0f 84 86 00 00 00 ff
[   15.080810] EIP: __purge_vmap_area_lazy+0x39/0xd8 SS:ESP: 0068:d6fe1e84
[   15.083222] CR2: 0000000000000009
[   15.084439] ---[ end trace 8bff6d527d7169ed ]---
[   15.085799] Kernel panic - not syncing: Fatal exception
[   15.087250] Kernel Offset: 0x1c00000 from 0xc1000000 (relocation range: 0xc0000000-0xd96d1fff)

dmesg-yocto-vp-82:20170216143302:i386-randconfig-b0-01241049:4.10.0-rc8:1

[   18.090535] sock: process `trinity-main' is using obsolete setsockopt SO_BSDCOMPAT
[   20.255582] BUG: unable to handle kernel NULL pointer dereference at 0000001c
[   20.257320] IP: bpf_prog_free+0x21/0x5e
[   20.258528] *pde = 00000000
[   20.258529]
[   20.260441] Oops: 0002 [#1]
[   20.261554] Modules linked in:
[   20.262655] CPU: 0 PID: 479 Comm: trinity-main Not tainted 4.10.0-rc8 #1
[   20.264261] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
[   20.266974] task: d01825c0 task.stack: d076a000
[   20.268284] EIP: bpf_prog_free+0x21/0x5e
[   20.269514] EFLAGS: 00010286 CPU: 0
[   20.270656] EAX: 0000002c EBX: 00000000 ECX: cb17a8a4 EDX: 9c3ce834
[   20.272210] ESI: 0000001c EDI: 00000001 EBP: d076be90 ESP: d076be88
[   20.273779]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
[   20.275201] CR0: 80050033 CR2: 0000001c CR3: 100a0000 CR4: 00040610
[   20.276766] Call Trace:
[   20.277779]  __bpf_prog_release+0x2f/0x33
[   20.279012]  bpf_prepare_filter+0x3e4/0x4c4
[   20.280270]  ? bpf_prog_store_orig_filter+0x4c/0x6a
[   20.281723]  __get_filter+0xb2/0xb8
[   20.282874]  sk_attach_filter+0x11/0x36
[   20.284069]  sock_setsockopt+0x3db/0x661
[   20.285288]  SyS_setsockopt+0x4c/0x7c
[   20.286527]  SyS_socketcall+0x144/0x1a6
[   20.287745]  do_int80_syscall_32+0x4b/0x90
[   20.288991]  entry_INT80_32+0x2a/0x2a
[   20.290182] EIP: 0x47f47a42
[   20.291237] EFLAGS: 00000282 CPU: 0
[   20.292395] EAX: ffffffda EBX: 0000000e ECX: bfb49110 EDX: bfb49190
[   20.293946] ESI: 00000046 EDI: 00000167 EBP: b76af4cc ESP: bfb4910c
[   20.295507]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
[   20.296935] Code: d8 eb 02 31 c0 5b 5e 5f 5d c3 55 89 e5 56 53 3e 8d 74 26 00 31 d2 8b 58 14 8d 73 1c 89 f0 e8 6b bd f9 ff 8d 43 2c b9 a4 a8 17 cb <c7> 43 1c c0 ff ff ff ba 3f c9 83 ca 6a 00 e8 7b 2b fb ff 8b 15
[   20.318348] EIP: bpf_prog_free+0x21/0x5e SS:ESP: 0068:d076be88
[   20.319845] CR2: 000000000000001c
[   20.321001] ---[ end trace 184b519ed5ab6373 ]---
[   20.322343] Kernel panic - not syncing: Fatal exception
[   20.323757] Kernel Offset: 0x9200000 from 0xc1000000 (relocation range: 0xc0000000-0xd2fd1fff)


Regards,
Fengguang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
