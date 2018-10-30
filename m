Return-Path: <SRS0=PvxZ=NK=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable cmt0
Date: Tue, 30 Oct 2018 16:48:30 +0000
Message-ID: 
 <OSBPR01MB21031B41A3384F13D02E9BDCB8CC0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540543709-35959-1-git-send-email-biju.das@bp.renesas.com>
 <1540543709-35959-2-git-send-email-biju.das@bp.renesas.com>
 <20181030155151.7jxqfzvd4y44zuij@verge.net.au>
In-Reply-To: <20181030155151.7jxqfzvd4y44zuij@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for the feedback.

> Subject: Re: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable cmt0
>
> On Fri, Oct 26, 2018 at 09:48:29AM +0100, Biju Das wrote:
> > This patch enables cmt0 support on the iWave iwg23s sbc.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>
> Thanks, I applied this for v4.21, resolving a conflict.
> The result is as follows:
>
> From: Biju Das <biju.das@bp.renesas.com>
> Date: Fri, 26 Oct 2018 09:48:29 +0100
> Subject: [PATCH] ARM: dts: iwg23s-sbc: Enable cmt0
>
> This patch enables cmt0 support on the iWave iwg23s sbc.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> index ffd8216f28c3..295f11afac21 100644
> --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> @@ -77,6 +77,10 @@
>  clock-frequency =3D <20000000>;
>  };
>
> +&cmt0 {
> +status =3D "okay";
> +};

I believe as per our process, the nodes should be in alphabetical order,
If it is the case, it should be above  extal_clk

&extal_clk {
        clock-frequency =3D <20000000>;
};

>  &pfc {
>  mmc_pins_uhs: mmc_uhs {
>  groups =3D "mmc_data8", "mmc_ctrl";
> --

regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
