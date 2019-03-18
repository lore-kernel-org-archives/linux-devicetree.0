From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 11/14] ARM: sunxi: dts: s3/s3l/v3: add DTSI
 files for S3/S3L/V3 SoCs
Date: Mon, 18 Mar 2019 13:41:32 +0100
Message-ID: <ea4f86798466bd9680f064f663a50450452509bc.camel@bootlin.com>
References: <20190312152256.35574-1-icenowy@aosc.io>
	 <20190312152256.35574-12-icenowy@aosc.io>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCOO3QWNR4KRB75DX3SAKGQEI6I2JQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190312152256.35574-12-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Le mardi 12 mars 2019 =C3=A0 23:22 +0800, Icenowy Zheng a =C3=A9crit :
> The Allwinner S3/S3L/V3 SoCs all share the same die with the V3s SoC,
> but with more GPIO wired out of the package.
>=20
> Add DTSI files for these SoCs. The DTSI file for V3 just replaces the
> pinctrl compatible string, and the S3/S3L DTSI files just include the V3
> DTSI file.

Note that the V3 has a NMI controller at 1c000d0, that is required for
handling the AXP209 interrupts IIRQ. I have no idea whether it's also
the case on the V3s/S3/S3L though but it would be good to know.

Note that I can totally add support for it when adding support for my
V3 device that uses the AXP209 this way.

Also, could we get proper compatibles and config options for these new
SoCs, since they are distinct from the V3S?

Cheers,

Paul

> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-s3.dtsi  |  6 ++++++
>  arch/arm/boot/dts/sun8i-s3l.dtsi |  6 ++++++
>  arch/arm/boot/dts/sun8i-v3.dtsi  | 14 ++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-s3.dtsi
>  create mode 100644 arch/arm/boot/dts/sun8i-s3l.dtsi
>  create mode 100644 arch/arm/boot/dts/sun8i-v3.dtsi
>=20
> diff --git a/arch/arm/boot/dts/sun8i-s3.dtsi b/arch/arm/boot/dts/sun8i-s3=
.dtsi
> new file mode 100644
> index 000000000000..0f41a25ecb30
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3.dtsi
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + */
> +
> +#include "sun8i-v3.dtsi"
> diff --git a/arch/arm/boot/dts/sun8i-s3l.dtsi b/arch/arm/boot/dts/sun8i-s=
3l.dtsi
> new file mode 100644
> index 000000000000..0f41a25ecb30
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3l.dtsi
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + */
> +
> +#include "sun8i-v3.dtsi"
> diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi b/arch/arm/boot/dts/sun8i-v3=
.dtsi
> new file mode 100644
> index 000000000000..6ae8645ade50
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-v3.dtsi
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + */
> +
> +#include "sun8i-v3s.dtsi"
> +
> +&ccu {
> +	compatible =3D "allwinner,sun8i-v3-ccu";
> +};
> +
> +&pio {
> +	compatible =3D "allwinner,sun8i-v3-pinctrl";
> +};
> --=20
> 2.18.1
>=20
--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
