From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3] of: fix kmemleak crash caused by imbalance in early
 memory reservation
Date: Wed, 13 Feb 2019 13:47:24 -0800
Message-ID: <20190213134724.f134e3388b591016e96cbf56@linux-foundation.org>
References: <20190213181921.GB15270@rapoport-lnx>
        <20190213121237.b6df41e4fb6317e58c0716a3@linux-foundation.org>
        <20190213211329.GD15270@rapoport-lnx>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213211329.GD15270@rapoport-lnx>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Frank Rowand <frowand.list@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Prateek Patel <prpatel@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 13 Feb 2019 23:13:29 +0200 Mike Rapoport <rppt@linux.ibm.com> wrote:

> > > As a bonus, since memblock_find_in_range() ensures the allocation in the
> > > specified range, the bounds check can be removed.
> > 
> > hm, why is this against -mm rather than against mainline?
> > 
> > Do the OF maintainers intend to merge the fix?
> 
> There's a conflict this fix and resent memblock related changes in -mm.
> Rob said he anyway wasn't planning to to send this for 5.0 [1] and
> suggested to merge it via your tree.
> 
> [1] https://lore.kernel.org/lkml/CAL_JsqK-cC6oVZ9MkP+ExOGjCRhA0XxGSgqGKL3W9bFF3rKAgA@mail.gmail.com/

OK, thanks, no probs.
