From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH] ARM: dts: ls1021: Fix SGMII PCS link remaining down after
 PHY disconnect
Date: Mon, 25 Mar 2019 18:46:39 +0000
Message-ID: <AM6PR04MB586318A19F0EE5D9B92B01BC8F5E0@AM6PR04MB5863.eurprd04.prod.outlook.com>
References: <1553506240-2584-1-git-send-email-vladimir.oltean@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553506240-2584-1-git-send-email-vladimir.oltean@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Oltean <vladimir.oltean@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Vladimir Oltean
> Sent: Monday, March 25, 2019 4:31 AM
> To: shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; Claudiu Manoil
> <claudiu.manoil@nxp.com>
> Cc: robh+dt@kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> netdev@vger.kernel.org; davem@davemloft.net; Vladimir Oltean
> <vladimir.oltean@nxp.com>
> Subject: [PATCH] ARM: dts: ls1021: Fix SGMII PCS link remaining down afte=
r
> PHY disconnect
>=20
> Each eTSEC MAC has its own TBI (SGMII) PCS and private MDIO bus.
> But due to a DTS oversight, both SGMII-compatible MACs of the LS1021 SoC
> are pointing towards the same internal PCS. Therefore nobody is controlli=
ng
> the internal PCS of eTSEC0.
>=20
> Upon initial ndo_open, the SGMII link is ok by virtue of U-boot initializ=
ation.
> But upon an ifdown/ifup sequence, the code path from ndo_open ->
> init_phy -> gfar_configure_serdes does not get executed for the PCS of
> eTSEC0 (and is executed twice for MAC eTSEC1). So the SGMII link remains
> down for eTSEC0. On the LS1021A-TWR board, to signal this failure conditi=
on,
> the PHY driver keeps printing
> '803x_aneg_done: SGMII link is not ok'.
>=20
> Fixes: 055223d4d22d ("ARM: dts: ls1021a: Enable the eTSEC ports on QDS
> and TWR")
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  arch/arm/boot/dts/ls1021a-twr.dts | 9 ++++++++-
>  arch/arm/boot/dts/ls1021a.dtsi    | 9 +++++++++
>  2 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/ls1021a-twr.dts
> b/arch/arm/boot/dts/ls1021a-twr.dts
> index 97e1fb7..9b1fe99 100644
> --- a/arch/arm/boot/dts/ls1021a-twr.dts
> +++ b/arch/arm/boot/dts/ls1021a-twr.dts
> @@ -145,7 +145,7 @@
>  };
>=20
>  &enet0 {
> -	tbi-handle =3D <&tbi1>;
> +	tbi-handle =3D <&tbi0>;
>  	phy-handle =3D <&sgmii_phy2>;
>  	phy-connection-type =3D "sgmii";
>  	status =3D "okay";
> @@ -225,6 +225,13 @@
>  	sgmii_phy2: ethernet-phy@2 {
>  		reg =3D <0x2>;
>  	};
> +	tbi0: tbi-phy@1f {
> +		reg =3D <0x1f>;
> +		device_type =3D "tbi-phy";
> +	};
> +};
> +
> +&mdio1 {
>  	tbi1: tbi-phy@1f {
>  		reg =3D <0x1f>;
>  		device_type =3D "tbi-phy";
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi
> b/arch/arm/boot/dts/ls1021a.dtsi index b4f2723..3a3d264 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -709,6 +709,15 @@
>  			      <0x0 0x2d10030 0x0 0x4>;
>  		};
>=20
> +		mdio1: mdio@2d64000 {
> +			compatible =3D "gianfar";

I know it is not your fault to use this compatible string as it already use=
d this for mdio node in the device tree, but it is somewhat ambiguous to us=
e the same compatible string as the ethernet controller.  And this dts is t=
he only one in all kernel device trees using this compatible string for mdi=
o node.  I would think it will be more clear to use "fsl,etsec2-mdio" or "f=
sl,etsec2-tbi".

> +			device_type =3D "mdio";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0x2d64000 0x0 0x4000>,
> +			      <0x0 0x2d50030 0x0 0x4>;
> +		};
> +
>  		ptp_clock@2d10e00 {
>  			compatible =3D "fsl,etsec-ptp";
>  			reg =3D <0x0 0x2d10e00 0x0 0xb0>;
> --
> 2.7.4
