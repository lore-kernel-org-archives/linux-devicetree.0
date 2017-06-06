From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: iwg20m: Add iWave RZG1M Qseven SOM
Date: Tue, 6 Jun 2017 09:41:37 +0200
Message-ID: <CAMuHMdV8Ugz_kvHLbV7sii-2v1WdHTSFm3meM8faVtx3jBpC+Q@mail.gmail.com>
References: <1496420523-23506-1-git-send-email-biju.das@bp.renesas.com> <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496420523-23506-4-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Biju,

On Fri, Jun 2, 2017 at 6:22 PM, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
> Add support for iWave RZG1M Qseven System On Module.
> http://www.iwavesystems.com/rz-g1m-qseven-module.html

Thanks for your patch!

> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Reviewed-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> @@ -0,0 +1,27 @@
> +/*
> + * Device Tree Source for the iWave-RZG1M-20M Qseven SOM
> + *
> + * Copyright (C) 2017 Renesas Electronics Corp.
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */
> +
> +#include "r8a7743.dtsi"
> +
> +/ {

Given this is a sub-board with many other components, I think it should have
its own (documented) compatible value, e.g.

    compatible = "iwave,g20m", "renesas,r8a7743";

> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0 0x40000000 0 0x20000000>;
> +       };
> +
> +       memory@200000000 {
> +               device_type = "memory";
> +               reg = <2 0x00000000 0 0x20000000>;
> +       };
> +};

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
