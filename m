From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: add support for RZ/A1L
Date: Wed, 4 Oct 2017 15:58:12 +0200
Message-ID: <CAMuHMdVU_dmMvfSNQXOON1doW98EjRY9p8XT6XP7ccxa7414bw@mail.gmail.com>
References: <20171003073334.18917-1-chris.brandt@renesas.com> <20171003073334.18917-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003073334.18917-3-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Tue, Oct 3, 2017 at 9:33 AM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> Compatible "r7s72102-ports" was added for RZ/A1L devices
>
> Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> index 43e21474528a..2a3366cee848 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> @@ -13,7 +13,8 @@ Pin controller node
>
>  Required properties:
>    - compatible
> -    this shall be "renesas,r7s72100-ports".
> +    this shall be "renesas,r7s72100-ports" for RZ/A1H and RZ/A1M or
> +    "renesas,r7s72102-ports" for RZ/A1L

Shouldn't you also document "renesas,r7s72101-ports" for RZ/A1M?
You could use "renesas,r7s72100-ports" as a fallback property for RZ/A1M,
though.

BTW, is there a way to distinguish the various RZ/A1 SoCs at runtime?

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
