From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [RESEND PATCH v2] of: fix kmemleak crash caused by imbalance in
 early memory reservation
Date: Wed, 13 Feb 2019 18:30:12 +0200
Message-ID: <20190213163012.GA6110@rapoport-lnx>
References: <20190123055414.GA4747@rapoport-lnx>
 <78f4ea8a-996d-038e-9e33-5ff02fa2c43f@samsung.com>
 <20190123123143.GE4747@rapoport-lnx>
 <4b8f82c4-7f8f-b814-c1ec-9902e43963f6@free.fr>
 <617e0d57-342d-4162-bd21-ece18e481d87@free.fr>
 <CAL_JsqKbCg-rGmLoA3mPv54=LMuQBfevfzL8f2QPVyjN-sNk8w@mail.gmail.com>
 <20190213085028.6199594b@canb.auug.org.au>
 <CAL_JsqK-cC6oVZ9MkP+ExOGjCRhA0XxGSgqGKL3W9bFF3rKAgA@mail.gmail.com>
 <20190213065734.GA14425@rapoport-lnx>
 <5c9184f3-71c1-7875-52f7-616d299a9549@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c9184f3-71c1-7875-52f7-616d299a9549@free.fr>
Sender: stable-owner@vger.kernel.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Frank Rowand <frowand.list@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Prateek Patel <prpatel@nvidia.com>, DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 10:27:48AM +0100, Marc Gonzalez wrote:
> On 13/02/2019 07:57, Mike Rapoport wrote:
> 
> > Below is the version vs. current mmotm.
> > 
> > From 9ea6dceb46067d4f1cbbdbec1189c8496aa0a4bc Mon Sep 17 00:00:00 2001
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > Date: Mon, 4 Feb 2019 15:37:21 +0100
> > Subject: [PATCH] of: fix kmemleak crash caused by imbalance in early memory reservation
> 
> Out of curiosity, why don't you send as a proper v3?
 
Was too much in a hurry

> > Marc Gonzalez reported the following kmemleak crash:
> > 
> > [...]
> > 
> > The crash happens when a no-map area is allocated in
> > early_init_dt_alloc_reserved_memory_arch(). The allocated region is
> > registered with kmemleak, but it is then removed from memblock using
> > memblock_remove() that is not kmemleak-aware.
> > 
> > Replacing __memblock_alloc_base() with memblock_find_in_range()
> 
> Nit: in this new version, you're replacing memblock_phys_alloc_range()
> with memblock_find_in_range() so I don't know if the comment still
> applies.

and didn't check the outcome of blindly applying the patch :(

I'll send a proper v3 soon. Sorry for the noise.
 
> > makes sure that the allocated memory is not added to kmemleak and then
> > memblock_remove()'ing this memory is safe.
> > 
> > As a bonus, since memblock_find_in_range() ensures the allocation in the
> > specified range, the bounds check can be removed.
> > 
> > Cc: stable@vger.kernel.org # 3.15+
> > Fixes: 3f0c820664483 ("drivers: of: add initialization code for dynamic reserved memory")
> > Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Acked-by: Prateek Patel <prpatel@nvidia.com>
> > Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 

-- 
Sincerely yours,
Mike.
