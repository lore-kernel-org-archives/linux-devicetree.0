From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 22/29] of: remove early_init_dt_setup_initrd_arch
Date: Fri, 8 Nov 2013 13:07:49 +0000
Message-ID: <527CE225.4040602@imgtec.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com> <1381163377-21044-23-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381163377-21044-23-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-metag <linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/10/13 17:29, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> All arches do essentially the same thing now for
> early_init_dt_setup_initrd_arch, so it can now be removed.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>
> Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> Cc: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
> Cc: x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> Cc: Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>
> Cc: Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> [metag]

Cheers
James

> ---
>  arch/arc/mm/init.c            |  7 -------
>  arch/arm/mm/init.c            |  8 --------
>  arch/c6x/kernel/devicetree.c  | 10 ----------
>  arch/metag/mm/init.c          |  9 ---------
>  arch/microblaze/kernel/prom.c |  9 ---------
>  arch/mips/kernel/prom.c       | 10 ----------
>  arch/openrisc/kernel/prom.c   |  9 ---------
>  arch/powerpc/kernel/prom.c    |  9 ---------
>  arch/x86/kernel/devicetree.c  |  9 ---------
>  arch/xtensa/kernel/setup.c    | 15 ++++-----------
>  drivers/of/fdt.c              |  9 ++++++---
>  include/linux/of_fdt.h        | 10 ----------
>  12 files changed, 10 insertions(+), 104 deletions(-)
> 
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index 81279ec..55e0a85 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -125,10 +125,3 @@ void __init free_initrd_mem(unsigned long start, unsigned long end)
>  	free_reserved_area((void *)start, (void *)end, -1, "initrd");
>  }
>  #endif
> -
> -#ifdef CONFIG_OF_FLATTREE
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	pr_err("%s(%llx, %llx)\n", __func__, start, end);
> -}
> -#endif /* CONFIG_OF_FLATTREE */
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 9eeb1cd..9d0b91d 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -77,14 +77,6 @@ static int __init parse_tag_initrd2(const struct tag *tag)
>  
>  __tagtable(ATAG_INITRD2, parse_tag_initrd2);
>  
> -#if defined(CONFIG_OF_FLATTREE) && defined(CONFIG_BLK_DEV_INITRD)
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	initrd_start = (unsigned long)__va(start);
> -	initrd_end = (unsigned long)__va(end);
> -}
> -#endif /* CONFIG_OF_FLATTREE */
> -
>  /*
>   * This keeps memory configuration data used by a couple memory
>   * initialization functions, as well as show_mem() for the skipping
> diff --git a/arch/c6x/kernel/devicetree.c b/arch/c6x/kernel/devicetree.c
> index d28a92f..fa3e574 100644
> --- a/arch/c6x/kernel/devicetree.c
> +++ b/arch/c6x/kernel/devicetree.c
> @@ -10,18 +10,8 @@
>   *
>   */
>  #include <linux/init.h>
> -#include <linux/initrd.h>
>  #include <linux/memblock.h>
>  
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	initrd_start = (unsigned long)__va(start);
> -	initrd_end = (unsigned long)__va(end);
> -	initrd_below_start_ok = 1;
> -}
> -#endif
> -
>  void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>  {
>  	c6x_add_memory(base, size);
> diff --git a/arch/metag/mm/init.c b/arch/metag/mm/init.c
> index 1239195..249fff6 100644
> --- a/arch/metag/mm/init.c
> +++ b/arch/metag/mm/init.c
> @@ -12,7 +12,6 @@
>  #include <linux/percpu.h>
>  #include <linux/memblock.h>
>  #include <linux/initrd.h>
> -#include <linux/of_fdt.h>
>  
>  #include <asm/setup.h>
>  #include <asm/page.h>
> @@ -405,11 +404,3 @@ void free_initrd_mem(unsigned long start, unsigned long end)
>  			   "initrd");
>  }
>  #endif
> -
> -#ifdef CONFIG_OF_FLATTREE
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	pr_err("%s(%llx, %llx)\n",
> -	       __func__, start, end);
> -}
> -#endif /* CONFIG_OF_FLATTREE */
> diff --git a/arch/microblaze/kernel/prom.c b/arch/microblaze/kernel/prom.c
> index 951e4d6..cab6dc3 100644
> --- a/arch/microblaze/kernel/prom.c
> +++ b/arch/microblaze/kernel/prom.c
> @@ -114,15 +114,6 @@ void __init early_init_devtree(void *params)
>  	pr_debug(" <- early_init_devtree()\n");
>  }
>  
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	initrd_start = (unsigned long)__va(start);
> -	initrd_end = (unsigned long)__va(end);
> -	initrd_below_start_ok = 1;
> -}
> -#endif
> -
>  /*******
>   *
>   * New implementation of the OF "find" APIs, return a refcounted
> diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
> index 67a4c53..0b2485f 100644
> --- a/arch/mips/kernel/prom.c
> +++ b/arch/mips/kernel/prom.c
> @@ -13,7 +13,6 @@
>  #include <linux/errno.h>
>  #include <linux/types.h>
>  #include <linux/bootmem.h>
> -#include <linux/initrd.h>
>  #include <linux/debugfs.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> @@ -48,15 +47,6 @@ void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
>  	return __alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS));
>  }
>  
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	initrd_start = (unsigned long)__va(start);
> -	initrd_end = (unsigned long)__va(end);
> -	initrd_below_start_ok = 1;
> -}
> -#endif
> -
>  int __init early_init_dt_scan_model(unsigned long node,	const char *uname,
>  				    int depth, void *data)
>  {
> diff --git a/arch/openrisc/kernel/prom.c b/arch/openrisc/kernel/prom.c
> index 6dbcaa8..2aae474 100644
> --- a/arch/openrisc/kernel/prom.c
> +++ b/arch/openrisc/kernel/prom.c
> @@ -52,12 +52,3 @@ void __init early_init_devtree(void *params)
>  	early_init_dt_scan(params);
>  	memblock_allow_resize();
>  }
> -
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	initrd_start = (unsigned long)__va(start);
> -	initrd_end = (unsigned long)__va(end);
> -	initrd_below_start_ok = 1;
> -}
> -#endif
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index b7634ce..a089468 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -546,15 +546,6 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>  	memblock_add(base, size);
>  }
>  
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	initrd_start = (unsigned long)__va(start);
> -	initrd_end = (unsigned long)__va(end);
> -	initrd_below_start_ok = 1;
> -}
> -#endif
> -
>  static void __init early_reserve_mem_dt(void)
>  {
>  	unsigned long i, len, dt_root;
> diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
> index 0db805c..0e1f95b 100644
> --- a/arch/x86/kernel/devicetree.c
> +++ b/arch/x86/kernel/devicetree.c
> @@ -51,15 +51,6 @@ void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
>  	return __alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS));
>  }
>  
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	initrd_start = (unsigned long)__va(start);
> -	initrd_end = (unsigned long)__va(end);
> -	initrd_below_start_ok = 1;
> -}
> -#endif
> -
>  void __init add_dtb(u64 data)
>  {
>  	initial_dtb = data + offsetof(struct setup_data, data);
> diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
> index 65974a8..6e2b663 100644
> --- a/arch/xtensa/kernel/setup.c
> +++ b/arch/xtensa/kernel/setup.c
> @@ -61,8 +61,8 @@ extern struct rtc_ops no_rtc_ops;
>  struct rtc_ops *rtc_ops;
>  
>  #ifdef CONFIG_BLK_DEV_INITRD
> -extern void *initrd_start;
> -extern void *initrd_end;
> +extern unsigned long initrd_start;
> +extern unsigned long initrd_end;
>  int initrd_is_mapped = 0;
>  extern int initrd_below_start_ok;
>  #endif
> @@ -149,8 +149,8 @@ static int __init parse_tag_initrd(const bp_tag_t* tag)
>  {
>  	meminfo_t* mi;
>  	mi = (meminfo_t*)(tag->data);
> -	initrd_start = __va(mi->start);
> -	initrd_end = __va(mi->end);
> +	initrd_start = (unsigned long)__va(mi->start);
> +	initrd_end = (unsigned long)__va(mi->end);
>  
>  	return 0;
>  }
> @@ -167,13 +167,6 @@ static int __init parse_tag_fdt(const bp_tag_t *tag)
>  
>  __tagtable(BP_TAG_FDT, parse_tag_fdt);
>  
> -void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> -{
> -	initrd_start = (void *)__va(start);
> -	initrd_end = (void *)__va(end);
> -	initrd_below_start_ok = 1;
> -}
> -
>  #endif /* CONFIG_OF */
>  
>  #endif /* CONFIG_BLK_DEV_INITRD */
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 5bc55b6..5f4cc88 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -624,7 +624,7 @@ int __init of_scan_flat_dt_by_path(const char *path,
>   * early_init_dt_check_for_initrd - Decode initrd location from flat tree
>   * @node: reference to node containing initrd location ('chosen')
>   */
> -void __init early_init_dt_check_for_initrd(unsigned long node)
> +static void __init early_init_dt_check_for_initrd(unsigned long node)
>  {
>  	u64 start, end;
>  	unsigned long len;
> @@ -642,12 +642,15 @@ void __init early_init_dt_check_for_initrd(unsigned long node)
>  		return;
>  	end = of_read_number(prop, len/4);
>  
> -	early_init_dt_setup_initrd_arch(start, end);
> +	initrd_start = (unsigned long)__va(start);
> +	initrd_end = (unsigned long)__va(end);
> +	initrd_below_start_ok = 1;
> +
>  	pr_debug("initrd_start=0x%llx  initrd_end=0x%llx\n",
>  		 (unsigned long long)start, (unsigned long long)end);
>  }
>  #else
> -inline void early_init_dt_check_for_initrd(unsigned long node)
> +static inline void early_init_dt_check_for_initrd(unsigned long node)
>  {
>  }
>  #endif /* CONFIG_BLK_DEV_INITRD */
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 73e1651..b365f5a 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -96,22 +96,12 @@ extern int of_scan_flat_dt_by_path(const char *path,
>  
>  extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  				     int depth, void *data);
> -extern void early_init_dt_check_for_initrd(unsigned long node);
>  extern int early_init_dt_scan_memory(unsigned long node, const char *uname,
>  				     int depth, void *data);
>  extern void early_init_dt_add_memory_arch(u64 base, u64 size);
>  extern void * early_init_dt_alloc_memory_arch(u64 size, u64 align);
>  extern u64 dt_mem_next_cell(int s, __be32 **cellp);
>  
> -/*
> - * If BLK_DEV_INITRD, the fdt early init code will call this function,
> - * to be provided by the arch code. start and end are specified as
> - * physical addresses.
> - */
> -#ifdef CONFIG_BLK_DEV_INITRD
> -extern void early_init_dt_setup_initrd_arch(u64 start, u64 end);
> -#endif
> -
>  /* Early flat tree scan hooks */
>  extern int early_init_dt_scan_root(unsigned long node, const char *uname,
>  				   int depth, void *data);
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
