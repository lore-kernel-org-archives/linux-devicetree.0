From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 6/8] ARM: sunxi: dts: s3/s3l/v3: add DTSI
 files for S3/S3L/V3 SoCs
Date: Sat, 20 Jul 2019 11:48:14 +0200
Message-ID: <20190720094814.s6qik6ja2ympwpmp@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-7-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tszo4ocuvok5y3y2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBYGGZPUQKGQEWGBJOUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-7-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tszo4ocuvok5y3y2
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:32AM +0800, Icenowy Zheng wrote:
> The Allwinner S3/S3L/V3 SoCs all share the same die with the V3s SoC,
> but with more GPIO wired out of the package.
>
> Add DTSI files for these SoCs. The DTSI file for V3 just replaces the
> pinctrl compatible string, and the S3/S3L DTSI files just include the V3
> DTSI file.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> No changes since v2.
>
>  arch/arm/boot/dts/sun8i-s3.dtsi  |  6 ++++++
>  arch/arm/boot/dts/sun8i-s3l.dtsi |  6 ++++++
>  arch/arm/boot/dts/sun8i-v3.dtsi  | 14 ++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-s3.dtsi
>  create mode 100644 arch/arm/boot/dts/sun8i-s3l.dtsi
>  create mode 100644 arch/arm/boot/dts/sun8i-v3.dtsi
>
> diff --git a/arch/arm/boot/dts/sun8i-s3.dtsi b/arch/arm/boot/dts/sun8i-s3.dtsi
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
> diff --git a/arch/arm/boot/dts/sun8i-s3l.dtsi b/arch/arm/boot/dts/sun8i-s3l.dtsi
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
> diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi b/arch/arm/boot/dts/sun8i-v3.dtsi
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
> +	compatible = "allwinner,sun8i-v3-ccu";
> +};
> +
> +&pio {
> +	compatible = "allwinner,sun8i-v3-pinctrl";
> +};

Is there any difference between the S3, S3L and V3?

If not, then we don't need all those DTSI, just add the v3

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--tszo4ocuvok5y3y2--
