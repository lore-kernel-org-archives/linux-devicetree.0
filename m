From: Bhaskar Upadhaya <bhaskar.upadhaya-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/1] arm64: dts: ls1012a: Add LS1012A-2G5RDB board support
Date: Wed, 29 Nov 2017 03:55:19 +0000
Message-ID: <AM3PR04MB449B294AE2AC9A9A654E9718C3B0@AM3PR04MB449.eurprd04.prod.outlook.com>
References: <1511257503-12475-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <20171129032730.GD9376@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171129032730.GD9376@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



-----Original Message-----
From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]=20
Sent: Wednesday, November 29, 2017 8:58 AM
To: Bhaskar Upadhaya <bhaskar.upadhaya-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Subject: Re: [PATCH 1/1] arm64: dts: ls1012a: Add LS1012A-2G5RDB board supp=
ort

On Tue, Nov 21, 2017 at 03:15:03PM +0530, Bhaskar Upadhaya wrote:
> LS1012A-2G5RDB is similar to LS1012ARDB with below features
> 2 2.5G SGMII PFE Block, SATA, USB 2.0/3.0, WiFi, DDR, eMMC QuadSPI,=20
> UART
>=20
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  1 +
>  .../boot/dts/freescale/fsl-ls1012a-2g5rdb.dts      | 66 ++++++++++++++++=
++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644=20
> arch/arm64/boot/dts/freescale/fsl-ls1012a-2g5rdb.dts
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile=20
> b/arch/arm64/boot/dts/freescale/Makefile
> index 72c4b52..b3a0aec 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -1,6 +1,7 @@
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-frdm.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-rdb.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-2g5rdb.dtb

Please maintain the order in alphabet.

Shawn
[Bhaskar] OK, Will keep like below
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-frdm.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-2g5rdb.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-rdb.dtb


>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1043a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1043a-rdb.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1046a-qds.dtb diff --git=20
> a/arch/arm64/boot/dts/freescale/fsl-ls1012a-2g5rdb.dts=20
> b/arch/arm64/boot/dts/freescale/fsl-ls1012a-2g5rdb.dts
> new file mode 100644
> index 0000000..99b1835
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-2g5rdb.dts
> @@ -0,0 +1,66 @@
> +/*
> + * Device Tree file for NXP LS1012A 2G5RDB Board.
> + *
> + * Copyright 2017 NXP
> + *
> + * Bhaskar Upadhaya <bhaskar.upadhaya-3arQi8VN3Tc@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPLv2 or the X11 license, at your option. Note that this=20
> +dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of th=
e
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +/dts-v1/;
> +
> +#include "fsl-ls1012a.dtsi"
> +
> +/ {
> +	model =3D "LS1012A 2G5RDB Board";
> +	compatible =3D "fsl,ls1012a-rdb", "fsl,ls1012a";
> +
> +};
> +
> +&duart0 {
> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +};
> +
> +&sata {
> +	status =3D "okay";
> +};
> --
> 1.9.1
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flist
> s.infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&data=3D02%7C01%7
> CBhaskar.Upadhaya%40nxp.com%7C409d0e6aad364cfb981708d536d92adb%7C686ea
> 1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636475228707650079&sdata=3D4GdFrz7
> zM%2FVi7XrR6zjRXdbMi6XD2SABxBdtItT7zbA%3D&reserved=3D0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
