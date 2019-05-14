From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 2/2] amr64: map FDT as RW for early_init_dt_scan()
Date: Tue, 14 May 2019 14:05:43 -0700
Message-ID: <155786794318.14659.2925897827978978040@swboyd.mtv.corp.google.com>
References: <20190513003819.356-1-hsinyi@chromium.org>
 <20190513003819.356-2-hsinyi@chromium.org>
 <20190513085853.GB9271@rapoport-lnx>
 <CAJMQK-hKrU2J0_uGe3eO_JTNwM=HRkXbDx2u45izcdD7wqwGeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJMQK-hKrU2J0_uGe3eO_JTNwM=HRkXbDx2u45izcdD7wqwGeQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hsin-Yi Wang <hsinyi@chromium.org>, Mike Rapoport <rppt@linux.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Architecture Mailman List <boot-architecture@lists.linaro.org>, Michal Hocko <mhocko@suse.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Quoting Hsin-Yi Wang (2019-05-13 04:14:32)
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
> 
> I didn't trace the real reason causing this. But in this case, maybe
> don't call memblock_reserve() in kaslr?
> 

Why not just have fixmap_remap_fdt() that maps it as RW and reserves
memblock once, and then call __fixmap_remap_fdt() with RO after
early_init_dt_scan() or unflatten_device_tree() is called? Why the
desire to call memblock_reserve() twice or even three times?
