From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] amr64: map FDT as RW for early_init_dt_scan()
Date: Mon, 13 May 2019 11:58:53 +0300
Message-ID: <20190513085853.GB9271@rapoport-lnx>
References: <20190513003819.356-1-hsinyi@chromium.org>
 <20190513003819.356-2-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190513003819.356-2-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, boot-architecture@lists.linaro.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 08:38:19AM +0800, Hsin-Yi Wang wrote:
> Currently in arm64, FDT is mapped to RO before it's passed to
> early_init_dt_scan(). However, there might be some code that needs
> to modify FDT during init. Map FDT to RW until unflatten DT.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  arch/arm64/kernel/setup.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 413d566405d1..08b22c1e72a9 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -179,9 +179,13 @@ static void __init smp_build_mpidr_hash(void)
>  		pr_warn("Large number of MPIDR hash buckets detected\n");
>  }
>  
> +extern void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, int *size,
> +				       pgprot_t prot);
> +
>
>  static void __init setup_machine_fdt(phys_addr_t dt_phys)
>  {
> -	void *dt_virt = fixmap_remap_fdt(dt_phys);
> +	int size;
> +	void *dt_virt = __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL);
>  	const char *name;
  
This makes the fdt mapped without the call to meblock_reserve(fdt) which
makes the fdt memory available for memblock allocations.

Chances that is will be actually allocated are small, but you know, things
happen.

IMHO, instead of calling directly __fixmap_remap_fdt() it would be better
to add pgprot parameter to fixmap_remap_fdt(). Then here and in kaslr.c it
can be called with PAGE_KERNEL and below with PAGE_KERNEL_RO.

There is no problem to call memblock_reserve() for the same area twice,
it's essentially a NOP.
 
>  	if (!dt_virt || !early_init_dt_scan(dt_virt)) {
> @@ -320,6 +324,9 @@ void __init setup_arch(char **cmdline_p)
>  	/* Parse the ACPI tables for possible boot-time configuration */
>  	acpi_boot_table_init();
>  
> +	/* remap fdt to RO */
> +	fixmap_remap_fdt(__fdt_pointer);
> +
>  	if (acpi_disabled)
>  		unflatten_device_tree();
>  
> -- 
> 2.20.1
> 

-- 
Sincerely yours,
Mike.
