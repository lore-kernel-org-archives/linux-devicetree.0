From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RESEND PATCH v3 1/2] of: base: Introduce of_alias_get_alias_list()
 to check alias IDs
Date: Mon, 24 Sep 2018 09:41:03 +0200
Message-ID: <CAMuHMdW5zze-KJhK=diR-WKbhO_vsMV2b7WuLHmcT2FtRD4J7Q@mail.gmail.com>
References: <b1772d99d4e8b788448cde0fc5c7dccb1f63b507.1537443710.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b1772d99d4e8b788448cde0fc5c7dccb1f63b507.1537443710.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, Greg KH <gregkh@linuxfoundation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Thu, Sep 20, 2018 at 1:42 PM Michal Simek <michal.simek@xilinx.com> wrote:
> The function travels the lookup table to record alias ids for the given
> device match structures and alias stem.
> This function will be used by serial drivers to check if requested alias
> is allocated or free to use.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

I know this has already been applied, it just drew my attention.

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -16,6 +16,7 @@
>
>  #define pr_fmt(fmt)    "OF: " fmt
>
> +#include <linux/bitmap.h>
>  #include <linux/console.h>
>  #include <linux/ctype.h>
>  #include <linux/cpu.h>
> @@ -1943,6 +1944,57 @@ int of_alias_get_id(struct device_node *np, const char *stem)
>  EXPORT_SYMBOL_GPL(of_alias_get_id);
>
>  /**
> + * of_alias_get_alias_list - Get alias list for the given device driver
> + * @matches:   Array of OF device match structures to search in
> + * @stem:      Alias stem of the given device_node
> + * @bitmap:    Bitmap field pointer
> + * @nbits:     Maximum number of alias ID which can be recorded it bitmap

IDs

> + *
> + * The function travels the lookup table to record alias ids for the given
> + * device match structures and alias stem.
> + *
> + * Return:     0 or -ENOSYS when !CONFIG_OF
> + */
> +int of_alias_get_alias_list(const struct of_device_id *matches,
> +                            const char *stem, unsigned long *bitmap,
> +                            unsigned int nbits)
> +{
> +       struct alias_prop *app;
> +
> +       /* Zero bitmap field to make sure that all the time it is clean */
> +       bitmap_zero(bitmap, nbits);
> +
> +       mutex_lock(&of_mutex);
> +       pr_debug("%s: Looking for stem: %s\n", __func__, stem);
> +       list_for_each_entry(app, &aliases_lookup, link) {
> +               pr_debug("%s: stem: %s, id: %d\n",
> +                        __func__, app->stem, app->id);
> +
> +               if (strcmp(app->stem, stem) != 0) {
> +                       pr_debug("%s: stem comparison doesn't passed %s\n",

didn't pass?

> +                                __func__, app->stem);
> +                       continue;
> +               }
> +
> +               if (app->id >= nbits) {
> +                       pr_debug("%s: ID %d greater then bitmap field %d\n",

than
%u for unsigned int

> +                               __func__, app->id, nbits);
> +                       continue;

Shouldn't this return an error, if of_match_node() below would have matched?

> +               }
> +
> +               if (of_match_node(matches, app->np)) {
> +                       pr_debug("%s: Allocated ID %d\n", __func__, app->id);
> +                       set_bit(app->id, bitmap);
> +               }
> +               /* Alias exist but it not compatible with matches */

exists but is npt

> +       }
> +       mutex_unlock(&of_mutex);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_alias_get_alias_list);
> +
> +/**
>   * of_alias_get_highest_id - Get highest alias id for the given stem
>   * @stem:      Alias stem to be examined
>   *

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
