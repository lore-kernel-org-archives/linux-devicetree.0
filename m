From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v4 1/3] amr64: map FDT as RW for early_init_dt_scan()
Date: Sat, 25 May 2019 12:30:49 +0300
Message-ID: <20190525093048.GB31026@rapoport-lnx>
References: <20190519160446.320-1-hsinyi@chromium.org>
 <5ce73503.1c69fb81.5f889.1d84@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5ce73503.1c69fb81.5f889.1d84@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 05:04:18PM -0700, Stephen Boyd wrote:
> Quoting Hsin-Yi Wang (2019-05-19 09:04:44)
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index a170c6369a68..29648e86f7e5 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -940,12 +940,12 @@ void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
> >         return dt_virt;
> >  }
> >  
> > -void *__init fixmap_remap_fdt(phys_addr_t dt_phys)
> > +void *__init fixmap_remap_fdt(phys_addr_t dt_phys, pgprot_t prot)
> >  {
> >         void *dt_virt;
> >         int size;
> >  
> > -       dt_virt = __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
> > +       dt_virt = __fixmap_remap_fdt(dt_phys, &size, prot);
> >         if (!dt_virt)
> >                 return NULL;
> >  
> 
> Sorry, I'm still confused why we want to call memblock_reserve() again.
> Why not avoid it?
 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 67ef25d037ea..d0d9de9da5c1 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -137,7 +137,7 @@ extern void init_mem_pgprot(void);
>  extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>  			       unsigned long virt, phys_addr_t size,
>  			       pgprot_t prot, bool page_mappings_only);
> -extern void *fixmap_remap_fdt(phys_addr_t dt_phys);
> +extern void *__fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);

I'd drop '__' prefix from __fixmap_remap_fdt is it's the only function to
remain.
Otherwise makes perfect sense.

>  extern void mark_linear_text_alias_ro(void);
>  
>  #define INIT_MM_CONTEXT(name)	\
> diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> index b09b6f75f759..0701c2cf1534 100644
> --- a/arch/arm64/kernel/kaslr.c
> +++ b/arch/arm64/kernel/kaslr.c
> @@ -65,9 +65,6 @@ static __init const u8 *kaslr_get_cmdline(void *fdt)
>  	return default_cmdline;
>  }
>  
> -extern void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, int *size,
> -				       pgprot_t prot);
> -
>  /*
>   * This routine will be executed with the kernel mapped at its default virtual
>   * address, and if it returns successfully, the kernel will be remapped, and
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 413d566405d1..3e97354566ff 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -181,9 +181,13 @@ static void __init smp_build_mpidr_hash(void)
>  
>  static void __init setup_machine_fdt(phys_addr_t dt_phys)
>  {
> -	void *dt_virt = fixmap_remap_fdt(dt_phys);
> +	int size;
> +	void *dt_virt = __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL);
>  	const char *name;
>  
> +	if (dt_virt)
> +		memblock_reserve(dt_phys, size);
> +
>  	if (!dt_virt || !early_init_dt_scan(dt_virt)) {
>  		pr_crit("\n"
>  			"Error: invalid device tree blob at physical address %pa (virtual address 0x%p)\n"
> @@ -195,6 +199,9 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
>  			cpu_relax();
>  	}
>  
> +	/* Early fixups are done, map the FDT as read-only now */
> +	__fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
> +
>  	name = of_flat_dt_get_machine_name();
>  	if (!name)
>  		return;
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a170c6369a68..ddf6086cd9dd 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -940,19 +940,6 @@ void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
>  	return dt_virt;
>  }
>  
> -void *__init fixmap_remap_fdt(phys_addr_t dt_phys)
> -{
> -	void *dt_virt;
> -	int size;
> -
> -	dt_virt = __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
> -	if (!dt_virt)
> -		return NULL;
> -
> -	memblock_reserve(dt_phys, size);
> -	return dt_virt;
> -}
> -
>  int __init arch_ioremap_pud_supported(void)
>  {
>  	/* only 4k granule supports level 1 block mappings */
> 

-- 
Sincerely yours,
Mike.
