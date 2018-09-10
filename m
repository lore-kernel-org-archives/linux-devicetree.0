From: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH 2/2] MIPS: Fix CONFIG_CMDLINE handling
Date: Mon, 10 Sep 2018 14:09:21 +0200
Message-ID: <CA+7wUsx8gmDNh_kYAxx=PUR2gNJFRCLNYq=hZE79jT=yjNrj+w@mail.gmail.com>
References: <20180907185414.2630-1-paul.burton@mips.com> <20180907185414.2630-2-paul.burton@mips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180907185414.2630-2-paul.burton@mips.com>
Sender: stable-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Paul Cercueil <paul@crapouillou.net>, LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jaedon Shin <jaedon.shin@gmail.com>, Rob Herring <robh+dt@kernel.org>, "# v4 . 11" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 7, 2018 at 8:55 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Commit 8ce355cf2e38 ("MIPS: Setup boot_command_line before
> plat_mem_setup") fixed a problem for systems which have
> CONFIG_CMDLINE_BOOL=y & use a DT with a chosen node that has either no
> bootargs property or an empty one. In this configuration
> early_init_dt_scan_chosen() copies CONFIG_CMDLINE into
> boot_command_line, but the MIPS code doesn't know this so it appends
> CONFIG_CMDLINE (via builtin_cmdline) to boot_command_line again. The
> result is that boot_command_line contains the arguments from
> CONFIG_CMDLINE twice.
>
> That commit took the approach of simply setting up boot_command_line
> from the MIPS code before early_init_dt_scan_chosen() runs, causing it
> not to copy CONFIG_CMDLINE to boot_command_line if a chosen node with no
> bootargs property is found.
>
> Unfortunately this is problematic for systems which do have a non-empty
> bootargs property & CONFIG_CMDLINE_BOOL=y. There
> early_init_dt_scan_chosen() will overwrite boot_command_line with the
> arguments from DT, which means we lose those from CONFIG_CMDLINE
> entirely. This breaks CONFIG_MIPS_CMDLINE_DTB_EXTEND. If we have
> CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER or
> CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND selected and the DT has a bootargs
> property which we should ignore, it will instead be honoured breaking
> those configurations too.
>
> Fix this by reverting commit 8ce355cf2e38 ("MIPS: Setup
> boot_command_line before plat_mem_setup") to restore the former
> behaviour, and fixing the CONFIG_CMDLINE duplication issue by instead
> providing a no-op implementation of early_init_dt_fixup_cmdline_arch()
> to prevent early_init_dt_scan_chosen() from using CONFIG_CMDLINE.

Sorry I cannot test this patch ATM. I've simply CCed Paul C. just in case.

> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Fixes: 8ce355cf2e38 ("MIPS: Setup boot_command_line before plat_mem_setup")
> References: https://patchwork.linux-mips.org/patch/18804/
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Jaedon Shin <jaedon.shin@gmail.com>
> Cc: Mathieu Malaterre <malat@debian.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Cc: stable@vger.kernel.org # v4.16+
> ---
>  arch/mips/kernel/setup.c | 47 +++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 20 deletions(-)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index c71d1eb7da59..7f755bc8a91c 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -841,11 +841,38 @@ static void __init request_crashkernel(struct resource *res)
>  #define BUILTIN_EXTEND_WITH_PROM       \
>         IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND)
>
> +void __init early_init_dt_fixup_cmdline_arch(char *data)
> +{
> +       /*
> +        * Do nothing - arch_mem_init() will assemble our command line below,
> +        * for both the DT & non-DT cases.
> +        */
> +}
> +
>  static void __init arch_mem_init(char **cmdline_p)
>  {
>         struct memblock_region *reg;
>         extern void plat_mem_setup(void);
>
> +       /* call board setup routine */
> +       plat_mem_setup();
> +
> +       /*
> +        * Make sure all kernel memory is in the maps.  The "UP" and
> +        * "DOWN" are opposite for initdata since if it crosses over
> +        * into another memory section you don't want that to be
> +        * freed when the initdata is freed.
> +        */
> +       arch_mem_addpart(PFN_DOWN(__pa_symbol(&_text)) << PAGE_SHIFT,
> +                        PFN_UP(__pa_symbol(&_edata)) << PAGE_SHIFT,
> +                        BOOT_MEM_RAM);
> +       arch_mem_addpart(PFN_UP(__pa_symbol(&__init_begin)) << PAGE_SHIFT,
> +                        PFN_DOWN(__pa_symbol(&__init_end)) << PAGE_SHIFT,
> +                        BOOT_MEM_INIT_RAM);
> +
> +       pr_info("Determined physical RAM map:\n");
> +       print_memory_map();
> +
>  #if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
>         strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>  #else
> @@ -873,26 +900,6 @@ static void __init arch_mem_init(char **cmdline_p)
>         }
>  #endif
>  #endif
> -
> -       /* call board setup routine */
> -       plat_mem_setup();
> -
> -       /*
> -        * Make sure all kernel memory is in the maps.  The "UP" and
> -        * "DOWN" are opposite for initdata since if it crosses over
> -        * into another memory section you don't want that to be
> -        * freed when the initdata is freed.
> -        */
> -       arch_mem_addpart(PFN_DOWN(__pa_symbol(&_text)) << PAGE_SHIFT,
> -                        PFN_UP(__pa_symbol(&_edata)) << PAGE_SHIFT,
> -                        BOOT_MEM_RAM);
> -       arch_mem_addpart(PFN_UP(__pa_symbol(&__init_begin)) << PAGE_SHIFT,
> -                        PFN_DOWN(__pa_symbol(&__init_end)) << PAGE_SHIFT,
> -                        BOOT_MEM_INIT_RAM);
> -
> -       pr_info("Determined physical RAM map:\n");
> -       print_memory_map();
> -
>         strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
>
>         *cmdline_p = command_line;
> --
> 2.18.0
>
