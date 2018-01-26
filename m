From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [RFC 10/37] soc: renesas: rcar-rst: Enable watchdog as reset
 trigger for Gen2
Date: Fri, 26 Jan 2018 11:05:58 +0100
Message-ID: <CAMuHMdWiVu9hs3PvXypJyeG0iDQkDvyPzHkTfq4NyPVdaYZKew@mail.gmail.com>
References: <1516903391-30467-1-git-send-email-fabrizio.castro@bp.renesas.com> <1516903391-30467-11-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516903391-30467-11-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Watchdog Mailing List <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orglinux-clk <l>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Thu, Jan 25, 2018 at 7:02 PM, Fabrizio Castro
<fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
> This patch allows for platform specific quirks as some of the SoC need
> further customization for the watchdog to work properly, like for R-Car
> Gen2 and for RZ/G.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>

Thanks for your patch!

> --- a/drivers/soc/renesas/rcar-rst.c
> +++ b/drivers/soc/renesas/rcar-rst.c
> @@ -13,8 +13,18 @@
>  #include <linux/of_address.h>
>  #include <linux/soc/renesas/rcar-rst.h>
>
> +#define WDTRSTCR_RESET         0xA55A0002
> +#define WDTRSTCR               0x0054
> +
> +static int gen2_configuration(void __iomem *base)

rcar_rst_enable_wdt_reset()?

> +{
> +       iowrite32(WDTRSTCR_RESET, base + WDTRSTCR);
> +       return 0;
> +}
> +
>  struct rst_config {
> -       unsigned int modemr;    /* Mode Monitoring Register Offset */
> +       unsigned int modemr;            /* Mode Monitoring Register Offset */
> +       int (*configure)(void *base);   /* Platform specific configuration */
>  };
>
>  static const struct rst_config rcar_rst_gen1 __initconst = {
> @@ -23,6 +33,7 @@ static const struct rst_config rcar_rst_gen1 __initconst = {
>
>  static const struct rst_config rcar_rst_gen2 __initconst = {
>         .modemr = 0x60,
> +       .configure = gen2_configuration,

BTW, does it hurt to do this on R-Car Gen3, too?

Instead of a function pointer, you could also just have a feature bit.

>  };
>
>  static const struct rst_config rcar_rst_gen3 __initconst = {
> @@ -79,6 +90,14 @@ static int __init rcar_rst_init(void)
>         rcar_rst_base = base;
>         cfg = match->data;
>         saved_mode = ioread32(base + cfg->modemr);
> +       if (cfg->configure) {
> +               error = cfg->configure(base);
> +               if (error) {
> +                       pr_warn("%pOF: Cannot run SoC specific configuration\n",
> +                               np);
> +                       goto out_put;
> +               }
> +       }
>
>         pr_debug("%pOF: MODE = 0x%08x\n", np, saved_mode);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
