From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] amr64: map FDT as RW for early_init_dt_scan()
Date: Wed, 15 May 2019 08:00:59 +0300
Message-ID: <20190515050059.GA4081@rapoport-lnx>
References: <20190513003819.356-1-hsinyi@chromium.org>
 <20190513003819.356-2-hsinyi@chromium.org>
 <20190513085853.GB9271@rapoport-lnx>
 <CAJMQK-hKrU2J0_uGe3eO_JTNwM=HRkXbDx2u45izcdD7wqwGeQ@mail.gmail.com>
 <155786794318.14659.2925897827978978040@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <155786794318.14659.2925897827978978040@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Architecture Mailman List <boot-architecture@lists.linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 02:05:43PM -0700, Stephen Boyd wrote:
> Quoting Hsin-Yi Wang (2019-05-13 04:14:32)
> > On Mon, May 13, 2019 at 4:59 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > 
> > >
> > > This makes the fdt mapped without the call to meblock_reserve(fdt) which
> > > makes the fdt memory available for memblock allocations.
> > >
> > > Chances that is will be actually allocated are small, but you know, things
> > > happen.
> > >
> > > IMHO, instead of calling directly __fixmap_remap_fdt() it would be better
> > > to add pgprot parameter to fixmap_remap_fdt(). Then here and in kaslr.c it
> > > can be called with PAGE_KERNEL and below with PAGE_KERNEL_RO.
> > >
> > > There is no problem to call memblock_reserve() for the same area twice,
> > > it's essentially a NOP.
> > >
> > Thanks for the suggestion. Will update fixmap_remap_fdt() in next patch.
> > 
> > However, I tested on some arm64 platform, if we also call
> > memblock_reserve() in kaslr.c, would cause warning[1] when
> > memblock_reserve() is called again in setup_machine_fdt(). The warning
> > comes from https://elixir.bootlin.com/linux/latest/source/mm/memblock.c#L601
> > ```
> > if (type->regions[0].size == 0) {
> >   WARN_ON(type->cnt != 1 || type->total_size);
> >   ...
> > ```
> > 
> > Call memblock_reserve() multiple times after setup_machine_fdt()
> > doesn't have such warning though.
> > 
> > I didn't trace the real reason causing this. But in this case, maybe
> > don't call memblock_reserve() in kaslr?
> > 
> 
> Why not just have fixmap_remap_fdt() that maps it as RW and reserves
> memblock once, and then call __fixmap_remap_fdt() with RO after
> early_init_dt_scan() or unflatten_device_tree() is called? Why the
> desire to call memblock_reserve() twice or even three times?

There's no desire to call memblock_reserve() twice. It's just that leaving
the call for it in kaslr rather than in setup_arch() may end up with
unreserved FDT because kaslr was disabled or even compiled out.

I've suggested to use fixmap_remap_fdt() everywhere because IMHO this
improves readability and allows to un-export __fixmap_remap_fdt().

-- 
Sincerely yours,
Mike.
