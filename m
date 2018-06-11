Return-Path: <SRS0=R+Hl=I5=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: r8a77990: Enable USB2.0 Host for
 Ebisu board
Date: Mon, 11 Jun 2018 09:00:39 +0000
Message-ID: <OSBPR01MB2293A44176791A0FEE775566D8780@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1528278726-2910-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180608081850.zj5g77zzhbbgk5lp@verge.net.au>
In-Reply-To: <20180608081850.zj5g77zzhbbgk5lp@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Friday, June 8, 2018 5:19 PM
>=20
> On Wed, Jun 06, 2018 at 06:52:06PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds USB2.0 PHY and Host(EHCI/OHCI) nodes and
> > enables them for R-Car E3 Ebisu board.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> > This patch set is based on renesas-drivers.git /
> > renesas-drivers-2018-06-05-v4.17 tag.
> >
> > Changes from v1:
> >  - Squash 4 patches into a single patch.
>=20
> Thanks Shimoda-san, I have applied this for v4.19.
>=20
> I had to do so manually to resolve a trivial conflict in
> r8a779980-ebisu.dts. The result is below. Please check to make
> sure that I got it right.

Thank you very much for resolving the conflict.
I confirmed the resolved patch works correctly.

Best regards,
Yoshihiro Shimoda

> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH] arm64: dts: renesas: r8a77990: Enable USB2.0 Host for Eb=
isu
>  board
>=20
> This patch adds USB2.0 PHY and Host(EHCI/OHCI) nodes and
> enables them for R-Car E3 Ebisu board.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 20 ++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 37 ++++++++++++++++++++=
++++++
>  2 files changed, 57 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/=
boot/dts/renesas/r8a77990-ebisu.dts
> index 28945a8b9800..5e28c1b94b77 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -47,10 +47,18 @@
>  	};
>  };
>=20
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
>  &extal_clk {
>  	clock-frequency =3D <48000000>;
>  };
>=20
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
>  &pfc {
>  	avb_pins: avb {
>  		mux {
> @@ -58,6 +66,11 @@
>  			function =3D "avb";
>  		};
>  	};
> +
> +	usb0_pins: usb {
> +		groups =3D "usb0_b";
> +		function =3D "usb0";
> +	};
>  };
>=20
>  &rwdt {
> @@ -68,3 +81,10 @@
>  &scif2 {
>  	status =3D "okay";
>  };
> +
> +&usb2_phy0 {
> +	pinctrl-0 =3D <&usb0_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77990.dtsi
> index 735881d4e57a..f8004608c595 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -267,6 +267,43 @@
>  			status =3D "disabled";
>  		};
>=20
> +		ohci0: usb@ee080000 {
> +			compatible =3D "generic-ohci";
> +			reg =3D <0 0xee080000 0 0x100>;
> +			interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 703>;
> +			phys =3D <&usb2_phy0>;
> +			phy-names =3D "usb";
> +			power-domains =3D <&sysc 32>;
> +			resets =3D <&cpg 703>;
> +			status =3D "disabled";
> +		};
> +
> +		ehci0: usb@ee080100 {
> +			compatible =3D "generic-ehci";
> +			reg =3D <0 0xee080100 0 0x100>;
> +			interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 703>;
> +			phys =3D <&usb2_phy0>;
> +			phy-names =3D "usb";
> +			companion =3D <&ohci0>;
> +			power-domains =3D <&sysc 32>;
> +			resets =3D <&cpg 703>;
> +			status =3D "disabled";
> +		};
> +
> +		usb2_phy0: usb-phy@ee080200 {
> +			compatible =3D "renesas,usb2-phy-r8a77990",
> +				     "renesas,rcar-gen3-usb2-phy";
> +			reg =3D <0 0xee080200 0 0x700>;
> +			interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 703>;
> +			power-domains =3D <&sysc 32>;
> +			resets =3D <&cpg 703>;
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
>  		gic: interrupt-controller@f1010000 {
>  			compatible =3D "arm,gic-400";
>  			#interrupt-cells =3D <3>;
> --
> 2.11.0
