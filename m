From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [RFC 23/37] ARM: shmobile: rcar-gen2: Export shmobile_set_wdt_clock_status
 function
Date: Fri, 26 Jan 2018 11:16:09 +0100
Message-ID: <CAMuHMdVVazZ=OmThKaLM0a-n=rRUiHdpDH1=w8=ANOuV2u1YPA@mail.gmail.com>
References: <1516903391-30467-1-git-send-email-fabrizio.castro@bp.renesas.com> <1516903391-30467-24-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516903391-30467-24-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Watchdog Mailing List <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orglinux-clk <l>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Thu, Jan 25, 2018 at 7:02 PM, Fabrizio Castro
<fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
> This patch exposes a function to set the value of variable
> "shmobile_wdt_clock_status" so that the watchdog driver may communicate
> critical information to the SMP bring up assembly routine.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>

Thanks for your patch, but this is the part I don't like, as it calls into deep
platform code from a driver.

Some generic comments below...

> --- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
> @@ -50,6 +50,16 @@ static inline u32 phys_to_sbar(phys_addr_t addr)
>  #define SYSCIER 0x0c
>  #define SYSCIMR 0x10
>
> +static void __iomem *shmobile_boot_vector_start;
> +static unsigned long clock_status;
> +
> +void shmobile_set_wdt_clock_status(unsigned long value)
> +{
> +       memcpy_toio(shmobile_boot_vector_start + clock_status,
> +                   &value, sizeof(value));

writel(shmobile_boot_vector_start + clock_status, value)?

> @@ -120,8 +130,12 @@ void __init rcar_gen2_pm_init(void)
>         if (!p)
>                 return;
>
> +       shmobile_boot_vector_start = p;
> +       clock_status = (&shmobile_wdt_clock_status -
> +                               (unsigned long *)shmobile_boot_vector) *
> +                               sizeof(shmobile_wdt_clock_status);

clock_status = (unsigned long)shmobile_wdt_clock_status -
               (unsigned long)shmobile_boot_vector?

> +
>         memcpy_toio(p, shmobile_boot_vector, shmobile_boot_size);
> -       iounmap(p);
>
>         /* setup reset vectors */
>         p = ioremap_nocache(RST, 0x63);

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
