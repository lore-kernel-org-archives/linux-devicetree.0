From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] clk: sunxi: Add support for A80 APBS clock
Date: Tue, 2 Feb 2016 12:15:41 +0100
Message-ID: <20160202111541.GN4652@lukather>
References: <1454337769-4130-1-git-send-email-wens@csie.org>
 <1454337769-4130-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4OpS+d6oOtUQaRm1"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454337769-4130-2-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--4OpS+d6oOtUQaRm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu

On Mon, Feb 01, 2016 at 10:42:48PM +0800, Chen-Yu Tsai wrote:
> A80's APBS clock is not the same as the APB0 clock on A23. The A80's
> is a zero-based divider, while the A23's is a power-of-two divider.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  drivers/clk/sunxi/Makefile                        |  2 +-
>  drivers/clk/sunxi/clk-sun9i-apbs.c                | 64 +++++++++++++++++=
++++++
>  3 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/sunxi/clk-sun9i-apbs.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index e59f57b24777..fad81157798c 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -58,6 +58,7 @@ Required properties:
>  	"allwinner,sun6i-a31-apb2-gates-clk" - for the APB2 gates on A31
>  	"allwinner,sun8i-a23-apb2-gates-clk" - for the APB2 gates on A23
>  	"allwinner,sun8i-h3-bus-gates-clk" - for the bus gates on H3
> +	"allwinner,sun9i-a80-apbs-clk" - for the APBS clock on A80
>  	"allwinner,sun9i-a80-apbs-gates-clk" - for the APBS gates on A80
>  	"allwinner,sun4i-a10-dram-gates-clk" - for the DRAM gates on A10
>  	"allwinner,sun5i-a13-mbus-clk" - for the MBUS clock on A13
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 3fd7901d48e4..df433b3f789d 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -17,7 +17,7 @@ obj-y +=3D clk-sun9i-core.o
>  obj-y +=3D clk-sun9i-mmc.o
>  obj-y +=3D clk-usb.o
> =20
> -obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun8i-apb0.o
> +obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun9i-apbs.o
>  obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun9i-cpus.o
> =20
>  obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D \
> diff --git a/drivers/clk/sunxi/clk-sun9i-apbs.c b/drivers/clk/sunxi/clk-s=
un9i-apbs.c
> new file mode 100644
> index 000000000000..aacb92873621
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-sun9i-apbs.c
> @@ -0,0 +1,64 @@
> +/*
> + * Copyright (C) 2016 Chen-Yu Tsai
> + * Author: Chen-Yu Tsai <wens@csie.org>
> + *
> + * Allwinner A80 APBS clock driver
> + *
> + * License Terms: GNU General Public License v2
> + *
> + * Based on clk-sun6i-apbs.c
> + * Allwinner A31 APB0 clock driver
> + *
> + * Copyright (C) 2014 Free Electrons
> + * Author: Boris BREZILLON <boris.brezillon@free-electrons.com>
> + *
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +static void sun9i_apbs_setup(struct device_node *node)
> +{
> +	const char *name =3D node->name;
> +	const char *parent;
> +	struct resource res;
> +	struct clk *clk;
> +	void __iomem *reg;
> +	int ret;
> +
> +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("Could not get registers for a80-apbs-clk\n");
> +		return;
> +	}
> +
> +	parent =3D of_clk_get_parent_name(node, 0);
> +	if (!parent)
> +		return;
> +
> +	of_property_read_string(node, "clock-output-names", &name);
> +
> +	/* The A80 APBS clock is a standard 2 bit wide divider clock */
> +	clk =3D clk_register_divider(NULL, name, parent, 0, reg, 0, 2, 0, NULL);
> +	if (IS_ERR(clk)) {
> +		pr_err("failed to register a80-apbs-clk: %ld\n", PTR_ERR(clk));
> +		goto err_unmap;
> +	}
> +
> +	ret =3D of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +	if (ret)
> +		goto err_unregister;
> +
> +	return;
> +
> +err_unregister:
> +	clk_unregister_divider(clk);
> +err_unmap:
> +	iounmap(reg);
> +	of_address_to_resource(node, 0, &res);
> +	release_mem_region(res.start, resource_size(&res));
> +}
> +CLK_OF_DECLARE(sun9i_apbs, "allwinner,sun9i-a80-apbs-clk", sun9i_apbs_se=
tup);

So it's just a different set of flags? Maybe we can simply reuse the
same driver.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--4OpS+d6oOtUQaRm1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsI/dAAoJEBx+YmzsjxAglBIQAIvEQ+XiDsRhDqairF3yaPjt
plPGeflh8HPBKeUl6w56rIkKvZzOXOknb0H/F7OnDJUGTP5ZG9/1z6qWqJCQ34tK
tESAjByqPdNkLYyteeV67WXHigw/zWcpOIVFBCPkbz69QFxOMRC+vqMI0eeCcGYf
6bgAcIfVIh8iT5ZyznnrXHyXfq4zRgKGUvwGmiOjx2sqWr4s6CR3fbbEYRJsXg7x
631nPhfP2v+PQUS3xwx6C3KN4nkyVgOjA17g+0qXuh/ixypjaLWw2rzj5hSaIavL
hdW2fprBbJHlIV74m4rQb2Mo+RxFbmYT94PsD773EOwoh1Sfv+mKsoh+R36aa1Gu
cb1vGRYctuSt0Oe8AieG7Bn9e2o5cDJj/X7XHw8B44VPaHpwfE83as0f8YsnXFCz
lYfJoO+0H4sU+8B5sIrb7OzMRFGHsXWfRQVfuqKWQRlnvI+kzAdGAyUSnePPFk6D
gD7oA3fOeobgVIguk7o2Atc4c02rRUHPfYqPQZo037cJlvBmotQ0dfEsTKcdXdmb
5h+tWlQXxV5BPgx1ZZz64Qzk2uD4fajDO+xG84poGFv8tnHbs97fyLgCsAyFp+lH
mQ/AiaqrnsU9bsAUOv8UKNr/ZPcyD1AOE5eqZGC9FxR/4XKP5HdPso9L0qsi5Ryl
WzVE+pM4ucIre879HWXk
=k3pl
-----END PGP SIGNATURE-----

--4OpS+d6oOtUQaRm1--
