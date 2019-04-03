Return-Path: <SRS0=fBrN=SF=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/4] arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST
 support
Date: Wed, 3 Apr 2019 10:29:39 +0000
Message-ID: 
 <TY1PR01MB1770C64F41C77DAED3556E58C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: 
 <1551438348-22119-4-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Patch "usb: common: Consider only available nodes for dr_mode" has been tak=
en,
and that is enough to get USB 2.0 host to work on the EK874, do you think y=
ou
can take this patch now?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 01 March 2019 11:06
> Subject: [PATCH 3/4] arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST s=
upport
>=20
> This patch adds USB 2.0 HOST support to the CAT874 board.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64=
/boot/dts/renesas/r8a774c0-cat874.dts
> index f86b3628..7d3b76f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -76,10 +76,20 @@
>  	};
>  };
>=20
> +&ehci0 {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
>  &extal_clk {
>  	clock-frequency =3D <48000000>;
>  };
>=20
> +&ohci0 {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
>  &pcie_bus_clk {
>  	clock-frequency =3D <100000000>;
>  };
> @@ -128,3 +138,8 @@
>  	sd-uhs-sdr104;
>  	status =3D "okay";
>  };
> +
> +&usb2_phy0 {
> +	renesas,no-otg-pins;
> +	status =3D "okay";
> +};
> --
> 2.7.4
