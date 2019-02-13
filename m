From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v3] of: fix kmemleak crash caused by imbalance in early
 memory reservation
Date: Wed, 13 Feb 2019 23:13:29 +0200
Message-ID: <20190213211329.GD15270@rapoport-lnx>
References: <20190213181921.GB15270@rapoport-lnx>
 <20190213121237.b6df41e4fb6317e58c0716a3@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213121237.b6df41e4fb6317e58c0716a3@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Frank Rowand <frowand.list@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Prateek Patel <prpatel@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 12:12:37PM -0800, Andrew Morton wrote:
> On Wed, 13 Feb 2019 20:19:22 +0200 Mike Rapoport <rppt@linux.ibm.com> wrote:
> 
> > 
> > Marc Gonzalez reported the following kmemleak crash:
> > 
> > Unable to handle kernel paging request at virtual address ffffffc021e00000
> > Mem abort info:
> >   ESR = 0x96000006
> >   Exception class = DABT (current EL), IL = 32 bits
> >   SET = 0, FnV = 0
> >   EA = 0, S1PTW = 0
> > Data abort info:
> >   ISV = 0, ISS = 0x00000006
> >   CM = 0, WnR = 0
> > swapper pgtable: 4k pages, 39-bit VAs, pgdp = (____ptrval____)
> > [ffffffc021e00000] pgd=000000017e3ba803, pud=000000017e3ba803,
> > pmd=0000000000000000
> > Internal error: Oops: 96000006 [#1] PREEMPT SMP
> > Modules linked in:
> > CPU: 6 PID: 523 Comm: kmemleak Tainted: G S      W         5.0.0-rc1 #13
> > Hardware name: Qualcomm Technologies, Inc. MSM8998 v1 MTP (DT)
> > pstate: 80000085 (Nzcv daIf -PAN -UAO)
> > pc : scan_block+0x70/0x190
> > lr : scan_block+0x6c/0x190
> > sp : ffffff8012e8bd20
> > x29: ffffff8012e8bd20 x28: ffffffc0fdbaf018
> > x27: ffffffc022000000 x26: 0000000000000080
> > x25: ffffff8011aadf70 x24: ffffffc0f8cc8000
> > x23: ffffff8010dc8000 x22: ffffff8010dc8830
> > x21: ffffffc021e00ff9 x20: ffffffc0f8cc8050
> > x19: ffffffc021e00000 x18: 0000000000002409
> > x17: 0000000000000200 x16: 0000000000000000
> > x15: ffffff8010e14dd8 x14: 0000000000002406
> > x13: 000000004c4dd0c6 x12: ffffffc0f77dad58
> > x11: 0000000000000001 x10: ffffff8010d9e688
> > x9 : ffffff8010d9f000 x8 : ffffff8010d9e688
> > x7 : 0000000000000002 x6 : 0000000000000000
> > x5 : ffffff8011511c20 x4 : 00000000000026d1
> > x3 : ffffff8010e14d88 x2 : 5b36396f4e7d4000
> > x1 : 0000000000208040 x0 : 0000000000000000
> > Process kmemleak (pid: 523, stack limit = 0x(____ptrval____))
> > Call trace:
> >  scan_block+0x70/0x190
> >  scan_gray_list+0x108/0x1c0
> >  kmemleak_scan+0x33c/0x7c0
> >  kmemleak_scan_thread+0x98/0xf0
> >  kthread+0x11c/0x120
> >  ret_from_fork+0x10/0x1c
> > Code: f9000fb4 d503201f 97ffffd2 35000580 (f9400260)
> > ---[ end trace 176d6ed9d86a0c33 ]---
> > note: kmemleak[523] exited with preempt_count 2
> > 
> > The crash happens when a no-map area is allocated in
> > early_init_dt_alloc_reserved_memory_arch(). The allocated region is
> > registered with kmemleak, but it is then removed from memblock using
> > memblock_remove() that is not kmemleak-aware.
> > 
> > Replacing memblock_phys_alloc_range() with memblock_find_in_range() makes
> > sure that the allocated memory is not added to kmemleak and then
> > memblock_remove()'ing this memory is safe.
> > 
> > As a bonus, since memblock_find_in_range() ensures the allocation in the
> > specified range, the bounds check can be removed.
> 
> hm, why is this against -mm rather than against mainline?
> 
> Do the OF maintainers intend to merge the fix?

There's a conflict this fix and resent memblock related changes in -mm.
Rob said he anyway wasn't planning to to send this for 5.0 [1] and
suggested to merge it via your tree.

[1] https://lore.kernel.org/lkml/CAL_JsqK-cC6oVZ9MkP+ExOGjCRhA0XxGSgqGKL3W9bFF3rKAgA@mail.gmail.com/

> 
> Thanks.
> 

-- 
Sincerely yours,
Mike.
