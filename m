From: Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2] arm64: dts: ls1088a: Add USB support
Date: Tue, 14 Nov 2017 08:00:00 +0000
Message-ID: <AM3PR04MB12515DB71B8ACF7422A20244E9280@AM3PR04MB1251.eurprd04.prod.outlook.com>
References: <20170913091009.21448-1-yinbo.zhu@nxp.com>
 <20170922065454.GF26358@dragon>
 <VI1PR04MB1262D160BA8625330E32CAF9E9470@VI1PR04MB1262.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <VI1PR04MB1262D160BA8625330E32CAF9E9470-mr6QIVyDiCGbtYzA8xQqo89NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Catalin Marinas )" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "Will Deacon )" <will.deacon-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Raghav Dogra <raghav.dogra-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>, Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



-----Original Message-----
From: Yinbo Zhu=20
Sent: Tuesday, October 24, 2017 5:15 PM
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; =
Catalin Marinas ) <catalin.marinas-5wv7dgnIgG8@public.gmane.org>; Will Deacon ) <will.deacon@arm=
.com>; Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>; Raghav Dogra <raghav.dogra@nx=
p.com>; Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>; Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>;=
 open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vge=
r.kernel.org>; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; open list <linux-kerne=
l@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: dts: ls1088a: Add USB support


-----Original Message-----
From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]=20
Sent: Friday, September 22, 2017 2:55 PM
To: Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; =
Catalin Marinas ) <catalin.marinas-5wv7dgnIgG8@public.gmane.org>; Will Deacon ) <will.deacon@arm=
.com>; Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>; Raghav Dogra <raghav.dogra@nx=
p.com>; Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>; Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>;=
 open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vge=
r.kernel.org>; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; open list <linux-kerne=
l@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ls1088a: Add USB support

On Wed, Sep 13, 2017 at 05:10:09PM +0800, yinbo.zhu-3arQi8VN3Tc@public.gmane.org wrote:
> From: "yinbo.zhu" <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
>=20
> Fix the issue that usb is not detected on ls1088ardb

>It's not really about fixing issue but adding support.

The patch had been tested on upstream 4.14 code, it can fix the issue.=20
>=20
> Signed-off-by: yinbo.zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
> ---

>You should better have a version history here to tell what's changed betwe=
en version.

>I will add a version history on next v3 patch
Hi,

I had modified the code as v4 version,=20
https://patchwork.kernel.org/patch/10027393/
please check.

Thanks,
BRs
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts |  8 ++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    | 20 +++++++++++++++++=
+++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts=20
> b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> index 213abb72de93..6c3c3bc4b681 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> @@ -118,6 +118,14 @@
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

>Please sort these labeled nodes alphabetically.

>Shawn

>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi=20
> b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index c144d06a6e33..c23fede8cf5d 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -359,6 +359,26 @@
>  			status =3D "disabled";
>  		};
> =20
> +		usb0: usb3@3100000 {
> +			compatible =3D "snps,dwc3";
> +			reg =3D <0x0 0x3100000 0x0 0x10000>;
> +			interrupts =3D <0 80 IRQ_TYPE_LEVEL_HIGH>;
> +			dr_mode =3D "host";
> +			snps,quirk-frame-length-adjustment =3D <0x20>;
> +			snps,dis_rxdet_inp3_quirk;
> +			status =3D "disabled";
> +		};
> +
> +		usb1: usb3@3110000 {
> +			compatible =3D "snps,dwc3";
> +			reg =3D <0x0 0x3110000 0x0 0x10000>;
> +			interrupts =3D <0 81 IRQ_TYPE_LEVEL_HIGH>;
> +			dr_mode =3D "host";
> +			snps,quirk-frame-length-adjustment =3D <0x20>;
> +			snps,dis_rxdet_inp3_quirk;
> +			status =3D "disabled";
> +		};
> +
>  		sata: sata@3200000 {
>  			compatible =3D "fsl,ls1088a-ahci";
>  			reg =3D <0x0 0x3200000 0x0 0x10000>,
> --
> 2.14.1
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
