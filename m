From: Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH v2] ARM: dts: r8a7743: add IIC cores to dtsi
Date: Tue, 22 Aug 2017 09:10:08 +0000
Message-ID: <TY1PR06MB07027D9A55FBFE2D591CEDCFB7840@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <1502704398-28378-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1502704398-28378-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Wolfram Sang <wsa@the-dreams.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Biju Das <biju.das@bp.renesas.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

Hello reviewers,=20

> From: Biju Das [mailto:biju.das@bp.renesas.com]
> Sent: 14 August 2017 10:53
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v1-->v2
>    Corrected the resets property for i2c6 device node.

Are you happy with this version of the patch?

Or is the discussion for moving to 'iic' still alive?

Thanks, Chris


>=20
> This patch is compiled against renesas-devel tag renesas-devel-20170814-
> v4.13-rc5.
>=20
>  arch/arm/boot/dts/r8a7743.dtsi | 55
> ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.d=
tsi
> index ce80a26..480950f 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -25,6 +25,9 @@
>  		i2c3 =3D &i2c3;
>  		i2c4 =3D &i2c4;
>  		i2c5 =3D &i2c5;
> +		i2c6 =3D &i2c6;
> +		i2c7 =3D &i2c7;
> +		i2c8 =3D &i2c8;
>  	};
>=20
>  	cpus {
> @@ -411,6 +414,58 @@
>  			status =3D "disabled";
>  		};
>=20
> +		i2c6: i2c@e60b0000 {
> +			/* doesn't need pinmux */
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg =3D <0 0xe60b0000 0 0x425>;
> +			interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 926>;
> +			dmas =3D <&dmac0 0x77>, <&dmac0 0x78>,
> +			       <&dmac1 0x77>, <&dmac1 0x78>;
> +			dma-names =3D "tx", "rx", "tx", "rx";
> +			power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 926>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c7: i2c@e6500000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg =3D <0 0xe6500000 0 0x425>;
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 318>;
> +			dmas =3D <&dmac0 0x61>, <&dmac0 0x62>,
> +			       <&dmac1 0x61>, <&dmac1 0x62>;
> +			dma-names =3D "tx", "rx", "tx", "rx";
> +			power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 318>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c8: i2c@e6510000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg =3D <0 0xe6510000 0 0x425>;
> +			interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 323>;
> +			dmas =3D <&dmac0 0x65>, <&dmac0 0x66>,
> +			       <&dmac1 0x65>, <&dmac1 0x66>;
> +			dma-names =3D "tx", "rx", "tx", "rx";
> +			power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 323>;
> +			status =3D "disabled";
> +		};
> +
>  		scifa0: serial@e6c40000 {
>  			compatible =3D "renesas,scifa-r8a7743",
>  				     "renesas,rcar-gen2-scifa", "renesas,scifa";
> --
> 1.9.1
