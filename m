From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH resend] ARM: dts: r8a7745: Add Ethernet AVB support
Date: Fri, 25 Aug 2017 08:26:38 +0000
Message-ID: <KL1PR06MB1702901A223C3FE2030DA79BB89B0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1503388405-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1503582359-43820-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503582359-43820-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

> -----Original Message-----
> From: Biju Das [mailto:biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org]
> Sent: 24 August 2017 14:46
> To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland
> <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>; Magnus Damm
> <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; Chris
> Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux=
-
> renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Biju D=
as
> <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Subject: [PATCH resend] ARM: dts: r8a7745: Add Ethernet AVB support
>
> Add Ethernet AVB support for r8a7745 SoC.
>
> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
> It is applying cleanly on renesas-devel branch tag renesas-devel-20170824=
-
> v4.13-rc6.
>
> It is tested against renesas-devel branch tag renesas-devel-20170824-v4.1=
3-rc6.
>
>  arch/arm/boot/dts/r8a7745.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.d=
tsi
> index 7fd2967..c34f88e 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -707,6 +707,19 @@
>  status =3D "disabled";
>  };
>
> +avb: ethernet@e6800000 {
> +compatible =3D "renesas,etheravb-r8a7745",
> +     "renesas,etheravb-rcar-gen2";
> +reg =3D <0 0xe6800000 0 0x800>, <0 0xee0e8000 0
> 0x4000>;
> +interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 812>;
> +power-domains =3D <&sysc R8A7745_PD_ALWAYS_ON>;
> +resets =3D <&cpg 812>;
> +#address-cells =3D <1>;
> +#size-cells =3D <0>;
> +status =3D "disabled";
> +};
> +

Hmmm. Just observed that positioning of avb node is not correct compared to=
 the similar r8a7794 SoC(R-Car E2).
I will send a new patch for correcting this.

>  mmcif0: mmc@ee200000 {
>  compatible =3D "renesas,mmcif-r8a7745",
>       "renesas,sh-mmcif";
> --
> 1.9.1




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
