From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] amr64: map FDT as RW for early_init_dt_scan()
Date: Tue, 14 May 2019 18:42:24 +0300
Message-ID: <20190514154223.GA11115@rapoport-lnx>
References: <20190513003819.356-1-hsinyi@chromium.org>
 <20190513003819.356-2-hsinyi@chromium.org>
 <20190513085853.GB9271@rapoport-lnx>
 <CAJMQK-hKrU2J0_uGe3eO_JTNwM=HRkXbDx2u45izcdD7wqwGeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJMQK-hKrU2J0_uGe3eO_JTNwM=HRkXbDx2u45izcdD7wqwGeQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Architecture Mailman List <boot-architecture@lists.linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 07:14:32PM +0800, Hsin-Yi Wang wrote:
> On Mon, May 13, 2019 at 4:59 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> 
> >
> > This makes the fdt mapped without the call to meblock_reserve(fdt) which
> > makes the fdt memory available for memblock allocations.
> >
> > Chances that is will be actually allocated are small, but you know, things
> > happen.
> >
> > IMHO, instead of calling directly __fixmap_remap_fdt() it would be better
> > to add pgprot parameter to fixmap_remap_fdt(). Then here and in kaslr.c it
> > can be called with PAGE_KERNEL and below with PAGE_KERNEL_RO.
> >
> > There is no problem to call memblock_reserve() for the same area twice,
> > it's essentially a NOP.
> >
> Thanks for the suggestion. Will update fixmap_remap_fdt() in next patch.
> 
> However, I tested on some arm64 platform, if we also call
> memblock_reserve() in kaslr.c, would cause warning[1] when
> memblock_reserve() is called again in setup_machine_fdt(). The warning
> comes from https://elixir.bootlin.com/linux/latest/source/mm/memblock.c#L601
> ```
> if (type->regions[0].size == 0) {
>   WARN_ON(type->cnt != 1 || type->total_size);
>   ...
> ```
> 
> Call memblock_reserve() multiple times after setup_machine_fdt()
> doesn't have such warning though.

I'm not sure if early console is available at the time kaslr_early_init()
is called, but if yes, running with memblock=debug may shed some light.
 
> I didn't trace the real reason causing this. But in this case, maybe
> don't call memblock_reserve() in kaslr?

My concern that this uncovered a real bug which might hit us later.

> [1]
> [    0.000000] WARNING: CPU: 0 PID: 0 at
> /mnt/host/source/src/third_party/kernel/v4.19/mm/memblock.c:583
> memblock_add_range+0x1bc/0x1c8
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.19.38 #125
> [    0.000000] pstate: 600001c5 (nZCv dAIF -PAN -UAO)
> [    0.000000] pc : memblock_add_range+0x1bc/0x1c8
> [    0.000000] lr : memblock_add_range+0x30/0x1c8
> [    0.000000] sp : ffffff9b5e203e80
> [    0.000000] x29: ffffff9b5e203ed0 x28: 0000000040959324
> [    0.000000] x27: 0000000040080000 x26: 0000000000080000
> [    0.000000] x25: 0000000080127e4b x24: 0000000000000000
> [    0.000000] x23: 0000001b55000000 x22: 000000000001152b
> [    0.000000] x21: 000000005f800000 x20: 0000000000000000
> [    0.000000] x19: ffffff9b5e24bf00 x18: 00000000ffffffb8
> [    0.000000] x17: 000000000000003c x16: ffffffbefea00000
> [    0.000000] x15: ffffffbefea00000 x14: ffffff9b5e3c17d8
> [    0.000000] x13: 00e8000000000713 x12: 0000000000000000
> [    0.000000] x11: ffffffbefea00000 x10: 00e800005f800710
> [    0.000000] x9 : 000000000001152b x8 : ffffff9b5e365690
> [    0.000000] x7 : 6f20646573616228 x6 : 0000000000000002
> [    0.000000] x5 : 0000000000000000 x4 : 0000000000000000
> [    0.000000] x3 : 0000000000200000 x2 : 000000000001152b
> [    0.000000] x1 : 000000005f800000 x0 : ffffff9b5e24bf00
> [    0.000000] Call trace:
> [    0.000000]  memblock_add_range+0x1bc/0x1c8
> [    0.000000]  memblock_reserve+0x60/0xac
> [    0.000000]  fixmap_remap_fdt+0x4c/0x78
> [    0.000000]  setup_machine_fdt+0x64/0xfc
> [    0.000000]  setup_arch+0x68/0x1e0
> [    0.000000]  start_kernel+0x68/0x380
> 

-- 
Sincerely yours,
Mike.
