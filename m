From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/3] of: Handle memory@0 node on PPC32 only
Date: Fri, 18 Apr 2014 10:04:15 +0200
Message-ID: <CAMuHMdXBNWum7UJ95uT2hwTd1b5C8ebF2LQ4T-A+RS80p7MH=A@mail.gmail.com>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
	<1397756521-29387-4-git-send-email-leif.lindholm@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397756521-29387-4-git-send-email-leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Leif,

On Thu, Apr 17, 2014 at 7:42 PM, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> In order to deal with an firmware bug on a specific ppc32 platform
> (longtrail), early_init_dt_scan_memory() looks for a node called
> memory@0 on all platforms. Restrict this quirk to ppc32 kernels only.

This breaks backwards compatibilty with old DTSes (at least on ARM/MIPS,
where you added the missing property in patches 1 and 2 of the series)?

For the Longtrail, I don't care much anymore, as mine died in 2004.
AFAIK, there have never been many users anyway.

> Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/of/fdt.c |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index fa16a91..7368472 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -887,14 +887,19 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>
>         /* We are scanning "memory" nodes only */
>         if (type == NULL) {
> +#ifdef CONFIG_PPC32
>                 /*
>                  * The longtrail doesn't have a device_type on the
>                  * /memory node, so look for the node called /memory@0.
>                  */
>                 if (depth != 1 || strcmp(uname, "memory@0") != 0)
>                         return 0;
> -       } else if (strcmp(type, "memory") != 0)
> +#else
> +               return 0;
> +#endif
> +       } else if (strcmp(type, "memory") != 0) {
>                 return 0;
> +       }
>
>         reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
>         if (reg == NULL)

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
