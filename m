From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [RFC 21/37] dt-bindings: watchdog: renesas-wdt: Add R-Car Gen2 support
Date: Fri, 26 Jan 2018 11:10:28 +0100
Message-ID: <CAMuHMdVn-XbsT1PQpcxKNHJ3ErecZtHy9=oJAGKd+heGLpLgcg@mail.gmail.com>
References: <1516903391-30467-1-git-send-email-fabrizio.castro@bp.renesas.com> <1516903391-30467-22-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516903391-30467-22-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Watchdog Mailing List <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orglinux-clk <l>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Thu, Jan 25, 2018 at 7:02 PM, Fabrizio Castro
<fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
> This commit documents the compatibility with R-Car Gen2 and RZ/G
> devices by defining the generifc compatible string "renesas,rcar-gen2-wdt".

generic

+ SoC-specific compatible values.

> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/watchdog/renesas-wdt.txt | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> index bf6d1ca..436dca5 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> @@ -1,17 +1,20 @@
>  Renesas Watchdog Timer (WDT) Controller
>
>  Required properties:
> -- compatible : Should be "renesas,<soctype>-wdt", and
> -              "renesas,rcar-gen3-wdt" or "renesas,rza-wdt" as fallback.
> + - compatible : Must be "renesas,<soctype>-wdt", followed by a generic
> +               fallback compatible string when compatible with the generic
> +               version.
>                Examples with soctypes are:
> +                - "renesas,r8a7743-wdt" (RZ/G1M)
> +                - "renesas,r8a7745-wdt" (RZ/G1E)

I guess you wanted to add r8a779[0-4], too, as you use (some of) them in
later patches in this series?

>                  - "renesas,r8a7795-wdt" (R-Car H3)
>                  - "renesas,r8a7796-wdt" (R-Car M3-W)
>                  - "renesas,r8a77995-wdt" (R-Car D3)
>                  - "renesas,r7s72100-wdt" (RZ/A1)
> +               The generic compatible string must be:
> +                - "renesas,rcar-gen2-wdt" for R-Car Gen2 and RZ/G
> +                - "renesas,rcar-gen3-wdt" for R-Car Gen3
>
> -  When compatible with the generic version, nodes must list the SoC-specific
> -  version corresponding to the platform first, followed by the generic
> -  version.
>
>  - reg : Should contain WDT registers location and length
>  - clocks : the clock feeding the watchdog timer.

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
