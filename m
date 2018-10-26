Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 6/7] ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
Date: Fri, 26 Oct 2018 09:45:55 +0000
Message-ID: 
 <TYXPR01MB177572D7D7238400BBDA1F4EC0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-7-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 6/7] ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
>
> Enable USB2.0 host on USB port1 of the iwg23s sbc.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch is tested against renesas-devel.
> ---
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dt=
s/r8a77470-iwg23s-sbc.dts
> index 157af7c..7aa7993e 100644
> --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> @@ -73,10 +73,18 @@
>  };
>  };
>
> +&ehci1 {
> +status =3D "okay";
> +};
> +
>  &extal_clk {
>  clock-frequency =3D <20000000>;
>  };
>
> +&ohci1 {
> +status =3D "okay";
> +};
> +
>  &pfc {
>  mmc_pins_uhs: mmc_uhs {
>  groups =3D "mmc_data8", "mmc_ctrl";
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
