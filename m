From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2 2/2] amr64: map FDT as RW for early_init_dt_scan()
Date: Wed, 15 May 2019 18:34:06 +0800
Message-ID: <CAJMQK-hGyuM=+C0ZPUbUwMqH8zPoYPF43L8oMP=p8MUeXrco4g@mail.gmail.com>
References: <20190513003819.356-1-hsinyi@chromium.org> <20190513003819.356-2-hsinyi@chromium.org>
 <20190513085853.GB9271@rapoport-lnx> <CAJMQK-hKrU2J0_uGe3eO_JTNwM=HRkXbDx2u45izcdD7wqwGeQ@mail.gmail.com>
 <155786794318.14659.2925897827978978040@swboyd.mtv.corp.google.com> <20190515050059.GA4081@rapoport-lnx>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515050059.GA4081@rapoport-lnx>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Stephen Boyd <swboyd@chromium.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Architecture Mailman List <boot-architecture@lists.linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 1:01 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > Why not just have fixmap_remap_fdt() that maps it as RW and reserves
> > memblock once, and then call __fixmap_remap_fdt() with RO after
> > early_init_dt_scan() or unflatten_device_tree() is called? Why the
> > desire to call memblock_reserve() twice or even three times?
>
> There's no desire to call memblock_reserve() twice. It's just that leaving
> the call for it in kaslr rather than in setup_arch() may end up with
> unreserved FDT because kaslr was disabled or even compiled out.
>
> I've suggested to use fixmap_remap_fdt() everywhere because IMHO this
> improves readability and allows to un-export __fixmap_remap_fdt().
>
> --
> Sincerely yours,
> Mike.
>

How about adding an arch hook that's not limited to be called at init
(like fixmap_remap_fdt). In this way we don't have to change currently
arm64 setup structure and only map fdt to RW before we need to modify
it (and can map back to RO after write). Since it can be called after
init, for CONFIG_KEXEC, we can also use it before updating fdt with a
new seed.

Does nothing by default, and for arm64 it can be like[1].
It's similar to __fixmap_remap_fdt on counting fdt size but using
update_mapping_prot() (will flush the TLBs).
And suppose fixmap_remap_fdt() is called at least once, region
checking is skipped.

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8080c9f489c3..e0fff8a009da 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -32,6 +32,7 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
+#include <linux/of_fdt.h>

 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -919,6 +920,22 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys)
        return dt_virt;
 }

+extern phys_addr_t fdt_pointer;
+
+/* Should be called after fixmap_remap_fdt() is called. */
+void update_fdt_pgprot(pgprot_t prot)
+{
+       u64 dt_virt_base = __fix_to_virt(FIX_FDT);
+       int offset, size;
+
+       offset = fdt_pointer % SWAPPER_BLOCK_SIZE;
+       size = fdt_totalsize((void *)dt_virt_base + offset);
+
+       update_mapping_prot(round_down(fdt_pointer, SWAPPER_BLOCK_SIZE),
+                       dt_virt_base,
+                       round_up(offset + size, SWAPPER_BLOCK_SIZE), prot);
+}
+


example use:
update_fdt_pgprot(PAGE_KERNEL);
fdt_delprop(initial_boot_params, node, "rng-seed");
update_fdt_pgprot(PAGE_KERNEL_RO);

I tested on arm64 device and it works. But if this doesn't seems
right, I'll probably just don't don't map fdt back to RO if kexec is
set.

Is this reasonable?

Thanks!
