From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 30/30] ARM: dts: r8a7794: Reference both DMA controllers
 in QSPI node
Date: Thu, 10 Mar 2016 13:08:56 +0100
Message-ID: <CAMuHMdW_nMfWF-sQPFgtxmtA_1vxw_hFPsb1DkRp7TJtKrB2ig@mail.gmail.com>
References: <1457609782-24108-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
	<1457609782-24108-31-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457609782-24108-31-git-send-email-niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Niklas,

On Thu, Mar 10, 2016 at 12:36 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org> wrote:
> R-Car Gen2 have two DMA controllers, which are equivalent. Add
> references to both dmac0 and dmac1 so the driver can fallback to the
> later if the first one is unavailable.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> ---
>  arch/arm/boot/dts/r8a7794.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a77=
94.dtsi
> index 76709ff..e098eab 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -605,8 +605,9 @@
>                 reg =3D <0 0xee200000 0 0x80>;
>                 interrupts =3D <0 169 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks =3D <&mstp3_clks R8A7794_CLK_MMCIF0>;

This one has the wrong subject: QSPI vs. MMCIF.

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
