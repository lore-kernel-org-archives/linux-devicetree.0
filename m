From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Fix #ifdef dependency of early flattree declarations
Date: Thu, 4 Jan 2018 09:47:45 +0100
Message-ID: <CAMuHMdUpvLtNka0Cfj527FwW3fOu5S6PVEpa+C6CCQRxbsAKgw@mail.gmail.com>
References: <1514888297-10791-1-git-send-email-geert+renesas@glider.be> <20180103214120.jyeq64pe65zfr4fw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103214120.jyeq64pe65zfr4fw@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, Jan 3, 2018 at 10:41 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jan 02, 2018 at 11:18:17AM +0100, Geert Uytterhoeven wrote:
>> If OF_FLATTREE=y, but OF_EARLY_FLATTREE=n:
>>
>>     drivers/tty/serial/earlycon.o: In function `param_setup_earlycon':
>>     earlycon.c:(.init.text+0x3a4): undefined reference to `early_init_dt_scan_chosen_stdout'
>>
>> Fix this by moving the early flattree forward declarations and dummy
>> implementations inside an #ifdef CONFIG_OF_EARLY_FLATTREE block.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> ---
>> Seen after forcing OF_FLATTREE=y on sparc64 allmodconfig
>> (Hi, out-of-tree OF_CONFIGFS!).
>
> Humm, making FDT actually work with a PDT based system is probably more
> work...
>
> Then again, I guess it could be completely independent like DT overlays
> on an ACPI system. Though that needs some work too to actually be
> useful. Primarily, how to anchor overlays to devices on discoverable
> buses (or discovered by a mechanism other than FDT).

Indeed.

>> --- a/include/linux/of_fdt.h
>> +++ b/include/linux/of_fdt.h
>> @@ -47,6 +47,13 @@ extern void *initial_boot_params;
>>  extern char __dtb_start[];
>>  extern char __dtb_end[];
>>
>> +/* Other Prototypes */
>> +extern void early_init_devtree(void *);
>> +extern void early_get_first_memblock_info(void *, phys_addr_t *);
>
> Seems like these 2 should be in the ifdef?

These two are not provided nor used by drivers/of/fdt.c, but by architecture
specific code, so that's why I missed them.
The former is used by microblaze, nios2, openrisc, powerpc, and xtensa only.
The latter is used by powerpc only.

All affected architectures select OF_EARLY_FLATTREE (for xtensa only if
USE_OF).

So it indeed makes sense to move them inside the #ifdef. Will do.

>> +extern u64 of_flat_dt_translate_address(unsigned long node);
>> +extern void of_fdt_limit_memory(int limit);
>> +
>> +#ifdef CONFIG_OF_EARLY_FLATTREE
>>  /* For scanning the flat device-tree at boot time */
>>  extern int of_scan_flat_dt(int (*it)(unsigned long node, const char *uname,
>>                                    int depth, void *data),
>> @@ -95,17 +102,14 @@ extern const void *of_flat_dt_match_machine(const void *default_match,
>>  /* Other Prototypes */
>>  extern void unflatten_device_tree(void);
>>  extern void unflatten_and_copy_device_tree(void);
>> -extern void early_init_devtree(void *);
>> -extern void early_get_first_memblock_info(void *, phys_addr_t *);
>> -extern u64 of_flat_dt_translate_address(unsigned long node);
>> -extern void of_fdt_limit_memory(int limit);
>> -#else /* CONFIG_OF_FLATTREE */
>> +#else /* CONFIG_OF_EARLY_FLATTREE */
>>  static inline int early_init_dt_scan_chosen_stdout(void) { return -ENODEV; }
>>  static inline void early_init_fdt_scan_reserved_mem(void) {}
>>  static inline void early_init_fdt_reserve_self(void) {}
>>  static inline const char *of_flat_dt_get_machine_name(void) { return NULL; }
>>  static inline void unflatten_device_tree(void) {}
>>  static inline void unflatten_and_copy_device_tree(void) {}
>> +#endif /* CONFIG_OF_EARLY_FLATTREE */
>>  #endif /* CONFIG_OF_FLATTREE */

As pointed out by 0day, the #ifdef CONFIG_OF_EARLY_FLATTREE should be
outside the #ifdef CONFIG_OF_FLATTREE.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
