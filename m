From: pierre kuo <vichy.kuo@gmail.com>
Subject: Re: [PATCH 1/1] of: reserved_mem: fix reserve memory leak
Date: Tue, 12 Mar 2019 09:58:00 +0800
Message-ID: <CAOVJa8FROiP7e=p_4Bs=QxiwcdqD5ydrrO=6G2GX2TJkQh9U8A@mail.gmail.com>
References: <20190219074500.16454-1-vichy.kuo@gmail.com> <CAL_Jsq+wUGxeQUMJd0eu52QadvLvkkT=36q9e1Qbru2gEsUGCw@mail.gmail.com>
 <CAOVJa8HUx-8Ok8yMm91UmXpo39KAipt6C1BsfOL1c0Q_kqs1Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOVJa8HUx-8Ok8yMm91UmXpo39KAipt6C1BsfOL1c0Q_kqs1Vg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

hi Rob, Marek and Frank:
> > > The __reserved_mem_init_node will call region specific reserved memory
> > > init codes, but once all compatibled init codes failed, the memory region
> > > will left in memory.reserved and cause leakage.
> > >
> > > Take cma reserve memory DTS for example, if user declare 1MB size,
> > > which is not align to (PAGE_SIZE << max(MAX_ORDER - 1,
> > > pageblock_order)), rmem_cma_setup will return -EINVAL.
> > > Meanwhile, rmem_dma_setup will also return -EINVAL since "reusable"
> > > property is not set. If finally there is no reserved memory init pick up
> > > this memory, kernel will left the 1MB leak in memory.reserved.
> > >
> > > This patch will remove this kind of memory from memory.reserved, only
> > > when __reserved_mem_init_node return neither 0 nor -ENOENT.
> >
> > I'm not sure that un-reserving memory on error is the correct
> > behavior. It may be fine for something like CMA, but if it is some
> > shared memory used by another processor in the system not reserving it
> > would probably never be correct.
>
> In this patch, we un-reserving memory ONLY if explicit compatible matching fail.
> That mean driver found something wrong while matching and let OS know.
> (But reserved-memory without compatible property will not be affected.)
>
> So per ur explaination, there would be cases that driver reported
> matching memory fail,
> but the memory is still needed by another processor?

Would you mind to give some comment and suggestion for this patch?
Sincerely appreciate ur kind help.
