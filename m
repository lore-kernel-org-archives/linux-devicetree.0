From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Wed, 14 Feb 2018 09:28:47 +0100
Message-ID: <CAMuHMdUYDWXF9uSzsYEOeOVysQKRSFhJ+bLbPhwFbMs-qBjbcA@mail.gmail.com>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com> <20180214060547.bf6upib2mbgoexas@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180214060547.bf6upib2mbgoexas@katana>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Wolfram,

On Wed, Feb 14, 2018 at 7:05 AM, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org> wrote:
>> +     chosen {
>> +             bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
>> +             stdout-path = "serial0:38400n8";
>
> Hmm, that would be our first board to not have 115200, or? We already
> have some other boards upstream where UBoot has 38400 and Linux 115200.
> I'd prefer consistency here a little, but no strong opinion and asking
> for other opinions.

The other R-Car Gen2 boards use 115200 bps for U-Boot and Linux, but some
other value (38400?) for the SPI loader that loads U-Boot.

What about U-Boot commit f40574e2d78c96a3 ("Kconfig: Migrate CONFIG_BAUDRATE"),
which says all R-Car Gen2 boards use 38400, before and after?

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
