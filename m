From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: RE: [PATCH] arm64: dts: ls1088a: Add USB support
Date: Fri, 18 Aug 2017 07:48:19 +0000
Message-ID: <VI1PR04MB1262662395B8CD06BAF074CFE9800@VI1PR04MB1262.eurprd04.prod.outlook.com>
References: <1502938358-23522-1-git-send-email-yinbo.zhu@nxp.com>
 <20170817140232.GE7608@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170817140232.GE7608@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "linux-devel@gforge.freescale.net" <linux-devel@gforge.freescale.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Harninder Rai <harninder.rai@nxp.com>, Andy Tang <andy.tang@nxp.com>, "open list:" <devicetree@vger.kernel.org>, Ashish Kumar <ashish.kumar@nxp.com>, open list <linux-kernel@vger.kernel.org>, Raghav Dogra <raghav.dogra@nxp.com>, "moderated list:" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



-----Original Message-----
From: Shawn Guo [mailto:shawnguo@kernel.org]=20
Sent: Thursday, August 17, 2017 10:03 PM
To: Yinbo Zhu <yinbo.zhu@nxp.com>
Cc: linux-devel@gforge.freescale.net; Rob Herring <robh+dt@kernel.org>; Mar=
k Rutland <mark.rutland@arm.com>; Catalin Marinas <catalin.marinas@arm.com>=
; Will Deacon <will.deacon@arm.com>; Harninder Rai <harninder.rai@nxp.com>;=
 Andy Tang <andy.tang@nxp.com>; open list: <devicetree@vger.kernel.org>; As=
hish Kumar <ashish.kumar@nxp.com>; open list <linux-kernel@vger.kernel.org>=
; Raghav Dogra <raghav.dogra@nxp.com>; moderated list: <linux-arm-kernel@li=
sts.infradead.org>
Subject: Re: [PATCH] arm64: dts: ls1088a: Add USB support

On Thu, Aug 17, 2017 at 10:52:38AM +0800, yinbo.zhu@nxp.com wrote:
> From: "yinbo.zhu" <yinbo.zhu@nxp.com>
>=20
> Fix the issue that usb is not detected on ls1088ardb
>=20
> Signed-off-by: yinbo.zhu <yinbo.zhu@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts |  8 ++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    | 18 +++++++++++++++++=
+
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm=
64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> index e9276a5..949cd67 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> @@ -145,6 +145,14 @@
>  	status =3D "okay";
>  };
> =20
> +&usb0 {
> +	status =3D "okay";
> +};
> +
> +&usb1 {
> +	status =3D "okay";
> +};
> +
>  &esdhc {
>  	status =3D "okay";
>  };

Sort the labelled node alphabetically.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-ls1088a.dtsi
> index 3a3be87..0dbff29 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -458,6 +458,24 @@
>  			status =3D "disabled";
>  		};
> =20
> +		usb0: usb3@3100000 {
> +			compatible =3D "snps,dwc3";
> +			reg =3D <0x0 0x3100000 0x0 0x10000>;
> +			interrupts =3D <0 80 0x4>; /* Level high type */

Use IRQ_TYPE_LEVEL_HIGH, so that you can save the comment.

> +			dr_mode =3D "host";
> +			configure-gfladj;

What is this?  I do not see it in upstream kernel.

> +			snps,dis_rxdet_inp3_quirk;

You probably need a "disabled" status.

Shawn

Hi Shawn,

 About your description " You probably need a "disabled" status."
 Your meaning is that remove the property "snps,dis_rxdet_inp3_quirk;", isn=
't it?
 In fact, if remove the property , 1088ardb usb will doesn't detect.

Yinbo

> +		};
> +
> +		usb1: usb3@3110000 {
> +			compatible =3D "snps,dwc3";
> +			reg =3D <0x0 0x3110000 0x0 0x10000>;
> +			interrupts =3D <0 81 0x4>; /* Level high type */
> +			dr_mode =3D "host";
> +			configure-gfladj;
> +			snps,dis_rxdet_inp3_quirk;
> +		};
> +
>  		sata: sata@3200000 {
>  			compatible =3D "fsl,ls1088a-ahci";
>  			reg =3D <0x0 0x3200000 0x0 0x10000>,
> --=20
> 2.1.0.27.g96db324
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
