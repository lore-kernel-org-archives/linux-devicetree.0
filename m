Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 4/7] ARM: dts: iwg23s-sbc: Enable USB Phy[01]
Date: Fri, 26 Oct 2018 09:45:14 +0000
Message-ID: 
 <TYXPR01MB177556DDE03E958D60264F3DC0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-5-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 4/7] ARM: dts: iwg23s-sbc: Enable USB Phy[01]
>
> Enable USB phy[01] on iWave iwg23s sbc based on RZ/G1C SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch is tested against renesas devel.
> ---
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dt=
s/r8a77470-iwg23s-sbc.dts
> index e5cfb50..157af7c 100644
> --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> @@ -100,6 +100,16 @@
>  function =3D "sdhi2";
>  power-source =3D <1800>;
>  };
> +
> +usb0_pins: usb0 {
> +groups =3D "usb0";
> +function =3D "usb0";
> +};
> +
> +usb1_pins: usb1 {
> +groups =3D "usb1";
> +function =3D "usb1";
> +};
>  };
>
>  &scif1 {
> @@ -134,3 +144,17 @@
>  sd-uhs-sdr50;
>  status =3D "okay";
>  };
> +
> +&usbphy0 {
> +pinctrl-0 =3D <&usb0_pins>;
> +pinctrl-names =3D "default";
> +
> +status =3D "okay";
> +};
> +
> +&usbphy1 {
> +pinctrl-0 =3D <&usb1_pins>;
> +pinctrl-names =3D "default";
> +
> +status =3D "okay";
> +};
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
