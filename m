From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCHv3 0/4] ARM: dts: r8a779[0-4]: Reference both DMA controllers
Date: Wed, 11 May 2016 15:46:07 +0200
Message-ID: <CAMuHMdWdfJMn+GzEQxpaMW3xYKZQYGK4v_tS_4ZiYjeRNQqGXA@mail.gmail.com>
References: <1462972438-20797-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462972438-20797-1-git-send-email-niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Niklas,

On Wed, May 11, 2016 at 3:13 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org> wrote:
> R-Car Gen2 have two DMA controllers, which are equivalent. However DM=
A
> slaves were tied only to a single DMA controller in .dtsi. This serie=
s
> add references to to both DMA controllers for all nodes that previous=
ly
> only referenced one of them. It also adds dma references to the SDHI
> nodes for r8a7794 which according to the datasheet should work but I
> have not access to HW to verify.

Thanks for your series!

> Niklas S=C3=B6derlund (4):
>   ARM: dts: r8a7790: Reference both DMA controllers
>   ARM: dts: r8a7791: Reference both DMA controllers
>   ARM: dts: r8a7793: Reference both DMA controllers
>   ARM: dts: r8a7794: Reference both DMA controllers

=46or patches 2-4:
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
