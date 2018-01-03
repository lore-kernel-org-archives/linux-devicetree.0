From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of/fdt: Fix #ifdef dependency of early flattree
 declarations
Date: Wed, 3 Jan 2018 15:41:20 -0600
Message-ID: <20180103214120.jyeq64pe65zfr4fw@rob-hp-laptop>
References: <1514888297-10791-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1514888297-10791-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 02, 2018 at 11:18:17AM +0100, Geert Uytterhoeven wrote:
> If OF_FLATTREE=y, but OF_EARLY_FLATTREE=n:
> 
>     drivers/tty/serial/earlycon.o: In function `param_setup_earlycon':
>     earlycon.c:(.init.text+0x3a4): undefined reference to `early_init_dt_scan_chosen_stdout'
> 
> Fix this by moving the early flattree forward declarations and dummy
> implementations inside an #ifdef CONFIG_OF_EARLY_FLATTREE block.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Seen after forcing OF_FLATTREE=y on sparc64 allmodconfig
> (Hi, out-of-tree OF_CONFIGFS!).

Humm, making FDT actually work with a PDT based system is probably more 
work...

Then again, I guess it could be completely independent like DT overlays 
on an ACPI system. Though that needs some work too to actually be 
useful. Primarily, how to anchor overlays to devices on discoverable 
buses (or discovered by a mechanism other than FDT). 

> ---
>  include/linux/of_fdt.h | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 013c5418aeecfdbd..d81a26df46bb6250 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -47,6 +47,13 @@ extern void *initial_boot_params;
>  extern char __dtb_start[];
>  extern char __dtb_end[];
>  
> +/* Other Prototypes */
> +extern void early_init_devtree(void *);
> +extern void early_get_first_memblock_info(void *, phys_addr_t *);

Seems like these 2 should be in the ifdef?

> +extern u64 of_flat_dt_translate_address(unsigned long node);
> +extern void of_fdt_limit_memory(int limit);
> +
> +#ifdef CONFIG_OF_EARLY_FLATTREE
>  /* For scanning the flat device-tree at boot time */
>  extern int of_scan_flat_dt(int (*it)(unsigned long node, const char *uname,
>  				     int depth, void *data),
> @@ -95,17 +102,14 @@ extern const void *of_flat_dt_match_machine(const void *default_match,
>  /* Other Prototypes */
>  extern void unflatten_device_tree(void);
>  extern void unflatten_and_copy_device_tree(void);
> -extern void early_init_devtree(void *);
> -extern void early_get_first_memblock_info(void *, phys_addr_t *);
> -extern u64 of_flat_dt_translate_address(unsigned long node);
> -extern void of_fdt_limit_memory(int limit);
> -#else /* CONFIG_OF_FLATTREE */
> +#else /* CONFIG_OF_EARLY_FLATTREE */
>  static inline int early_init_dt_scan_chosen_stdout(void) { return -ENODEV; }
>  static inline void early_init_fdt_scan_reserved_mem(void) {}
>  static inline void early_init_fdt_reserve_self(void) {}
>  static inline const char *of_flat_dt_get_machine_name(void) { return NULL; }
>  static inline void unflatten_device_tree(void) {}
>  static inline void unflatten_and_copy_device_tree(void) {}
> +#endif /* CONFIG_OF_EARLY_FLATTREE */
>  #endif /* CONFIG_OF_FLATTREE */
>  
>  #endif /* __ASSEMBLY__ */
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
