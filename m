From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH resend 2/6] clk: sunxi: Add VE (Video Engine) module
 clock driver for sun[457]i
Date: Tue, 8 Dec 2015 11:02:35 +0100
Message-ID: <20151208100235.GQ27957@lukather>
References: <1449321407-4531-1-git-send-email-wens@csie.org>
 <1449321407-4531-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SvyA5ywaG/v2A5dH"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449321407-4531-3-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--SvyA5ywaG/v2A5dH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 05, 2015 at 09:16:43PM +0800, Chen-Yu Tsai wrote:
> The video engine has its own special module clock, consisting of a clock
> gate, configurable dividers, and a reset control.
>=20
> On later (sun[68]i) families, the reset control is moved out of this
> piece of hardware and grouped with reset controls of other peripherals.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   4 +
>  drivers/clk/sunxi/Makefile                        |   1 +
>  drivers/clk/sunxi/clk-a10-ve.c                    | 171 ++++++++++++++++=
++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-a10-ve.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index ef0b452806b1..14496056319f 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -74,6 +74,7 @@ Required properties:
>  	"allwinner,sun8i-h3-usb-clk" - for usb gates + resets on H3
>  	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
>  	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
> +	"allwinner,sun4i-a10-ve-clk" - for the Video Engine clock
> =20
>  Required properties for all clocks:
>  - reg : shall be the control register address for the clock.
> @@ -93,6 +94,9 @@ Required properties for all clocks:
>  And "allwinner,*-usb-clk" clocks also require:
>  - reset-cells : shall be set to 1
> =20
> +The "allwinner,sun4i-a10-ve-clk" clock also requires:
> +- reset-cells : shall be set to 0
> +
>  The "allwinner,sun9i-a80-mmc-config-clk" clock also requires:
>  - #reset-cells : shall be set to 1
>  - resets : shall be the reset control phandle for the mmc block.
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 103efab05ca8..78db91ad5af6 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -7,6 +7,7 @@ obj-y +=3D clk-a10-codec.o
>  obj-y +=3D clk-a10-hosc.o
>  obj-y +=3D clk-a10-mod1.o
>  obj-y +=3D clk-a10-pll2.o
> +obj-y +=3D clk-a10-ve.o
>  obj-y +=3D clk-a20-gmac.o
>  obj-y +=3D clk-mod0.o
>  obj-y +=3D clk-simple-gates.o
> diff --git a/drivers/clk/sunxi/clk-a10-ve.c b/drivers/clk/sunxi/clk-a10-v=
e.c
> new file mode 100644
> index 000000000000..de0fdb656150
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-a10-ve.c
> @@ -0,0 +1,171 @@
> +/*
> + * Copyright 2015 Chen-Yu Tsai
> + *
> + * Chen-Yu Tsai <wens@csie.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +static DEFINE_SPINLOCK(ve_lock);
> +
> +#define SUN4I_VE_ENABLE		31
> +#define SUN4I_VE_DIVIDER_SHIFT	16
> +#define SUN4I_VE_DIVIDER_WIDTH	3
> +#define SUN4I_VE_RESET		0
> +
> +/**
> + * sunxi_ve_reset... - reset bit in ve clk registers handling
> + */
> +
> +struct ve_reset_data {
> +	void __iomem			*reg;
> +	spinlock_t			*lock;
> +	struct reset_controller_dev	rcdev;
> +};
> +
> +static int sunxi_ve_reset_assert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	struct ve_reset_data *data =3D container_of(rcdev,
> +						  struct ve_reset_data,
> +						  rcdev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(data->lock, flags);
> +
> +	reg =3D readl(data->reg);
> +	writel(reg & ~BIT(SUN4I_VE_RESET), data->reg);
> +
> +	spin_unlock_irqrestore(data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int sunxi_ve_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	struct ve_reset_data *data =3D container_of(rcdev,
> +						  struct ve_reset_data,
> +						  rcdev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(data->lock, flags);
> +
> +	reg =3D readl(data->reg);
> +	writel(reg | BIT(SUN4I_VE_RESET), data->reg);
> +
> +	spin_unlock_irqrestore(data->lock, flags);
> +
> +	return 0;
> +}

Is it me, or do we have this code duplicated everywhere now?

Maybe we should turn this into a small library.

> +static int sunxi_ve_of_xlate(struct reset_controller_dev *rcdev,
> +			     const struct of_phandle_args *reset_spec)
> +{
> +    if (WARN_ON(reset_spec->args_count !=3D 0))
> +	return -EINVAL;
> +
> +    return 0;
> +}

And this could be part of the reset controller framework too.

Anyway, both these comments can be fixed by a later patch. Can you
take care of this?

I've fixed the white space issue, and applied your patch.

(and added Jens Tested-by)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--SvyA5ywaG/v2A5dH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZqq7AAoJEBx+YmzsjxAg8KEQALOTrc2L+eJmToG8flXtEV1T
xn6NXhr8UYSW1ZyieOoOtFCukySYSF6fzDKXCB3JQiTcaW0Ao32RnOo0vFCcEm0I
vZ5TZppAmVCtYlXZArlD60MHpaeYU7wjbizsiTTFoUfjyOgYXhS14tgEd3D7MVjq
jod9i4y7SDhHB2bAtIeUNWbU8CHIrFGXlfAxq02uvSGdDz7OcU7ofePIXJYNor3l
JUHpm4rrmgC2Veh1ul81tYerHFrnnTl14EMus0X46EsJeKb7wpir25Cw5blqa5Yw
ntqXpViGo1E1cWzeEVoqtF0vDyCvUZUsuk2S+kSQWG1dWrfqUInGTibC+ZwXn7ty
2IfU10hAUOKkJEnSMHuTC1XDTGDlyjVdoE9LTr3tkQZV7PlT4jx8On5uvk78xAo3
VSmoKQ6G3HhmD59Ob5M+4mkffauI6GIeCOaXBuW5pV07c2U/dDOiuDU8bNey1tqp
4iX82JOf1r6eEZ4iigdxq3zRv5EUWLce4Xa9oP1xWbrkyZutb5xcKiNQyyNoNN/i
NNCKcxLj/LyCuEO55mwWIFQzm8YR38noblNqPmUgnk7XMZgTeCW4452/csofCw3X
36H1r6h49JogURGMnLMUk7F/LWfb5cg+DGxb+MU8HzHBewKCm8C+FuBMHUFWoP+K
5HqmAlhnRFWQ0s0wWxBn
=3bJ5
-----END PGP SIGNATURE-----

--SvyA5ywaG/v2A5dH--
