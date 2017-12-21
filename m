From: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 2/2][v2] ARM: dts: ls1021aqds: Add nand node for ifc
 controller
Date: Thu, 21 Dec 2017 05:14:51 +0000
Message-ID: <HE1PR04MB124129FE73928FFDA66AFFAB970D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1512013344-4042-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512013344-4042-3-git-send-email-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512013344-4042-3-git-send-email-prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

> -----Original Message-----
> From: Prabhakar Kushwaha [mailto:prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org]
> Sent: Thursday, November 30, 2017 9:12 AM
> To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Prabhakar Kushwaha
> <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>; Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
> Subject: [PATCH 2/2][v2] ARM: dts: ls1021aqds: Add nand node for ifc cont=
roller
>=20
> LS1021AQDS support NAND flash on IFC chip-select 2.
>=20
> So add NAND node in device tree for IFC controller.
>=20
> Signed-off-by: Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes for v2: updated subject
>=20
>  arch/arm/boot/dts/ls1021a-qds.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021=
a-
> qds.dts
> index 9408753..2b37d04 100644
> --- a/arch/arm/boot/dts/ls1021a-qds.dts
> +++ b/arch/arm/boot/dts/ls1021a-qds.dts
> @@ -239,6 +239,11 @@
>  		device-width =3D <1>;
>  	};
>=20
> +	nand@2,0 {
> +		compatible =3D "fsl,ifc-nand";
> +		reg =3D <0x2 0x0 0x10000>;
> +	};
> +
>  	fpga: board-control@3,0 {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> --


There are no review comments on this patch.

Can you please accept this patch

--pk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
