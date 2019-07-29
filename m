From: Paul Burton <paul.burton@mips.com>
Subject: Re: [EXTERNAL][PATCH v15 04/13] mfd/syscon: Add
 device_node_to_regmap()
Date: Mon, 29 Jul 2019 16:55:37 +0000
Message-ID: <20190729165536.dd67ws6nr2msx4pk@pburton-laptop>
References: <20190724171615.20774-1-paul@crapouillou.net>
 <20190724171615.20774-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724171615.20774-5-paul@crapouillou.net>
Content-Language: en-US
Content-ID: <32FB9FC5C16F79419150751ABA1AF071@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "od@zcrc.me" <od@zcrc.me>, Mathieu Malaterre <malat@debian.org>
List-Id: devicetree@vger.kernel.org

Lee, Arnd,

On Wed, Jul 24, 2019 at 01:16:06PM -0400, Paul Cercueil wrote:
> device_node_to_regmap() is exactly like syscon_node_to_regmap(), but it
> does not check that the node is compatible with "syscon", and won't
> attach the first clock it finds to the regmap.
>=20
> The rationale behind this, is that one device node with a standard
> compatible string "foo,bar" can be covered by multiple drivers sharing a
> regmap, or by a single driver doing all the job without a regmap, but
> these are implementation details which shouldn't reflect on the
> devicetree.

Does this looks like a good path forwards to you? Its use in this case
is described by Documentation/devicetree/bindings/timer/ingenic,tcu.txt
in patch 3 of the series.

If you're OK with it an ack would be appreciated so I can take the
series through mips-next, otherwise I guess we'd need to go back to the
v14 approach.

Thanks,
    Paul

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
>     v15: New patch
>=20
>  drivers/mfd/syscon.c       | 46 +++++++++++++++++++++++++-------------
>  include/linux/mfd/syscon.h |  6 +++++
>  2 files changed, 36 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index b65e585fc8c6..660723276481 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -40,7 +40,7 @@ static const struct regmap_config syscon_regmap_config =
=3D {
>  	.reg_stride =3D 4,
>  };
> =20
> -static struct syscon *of_syscon_register(struct device_node *np)
> +static struct syscon *of_syscon_register(struct device_node *np, bool ch=
eck_clk)
>  {
>  	struct clk *clk;
>  	struct syscon *syscon;
> @@ -51,9 +51,6 @@ static struct syscon *of_syscon_register(struct device_=
node *np)
>  	struct regmap_config syscon_config =3D syscon_regmap_config;
>  	struct resource res;
> =20
> -	if (!of_device_is_compatible(np, "syscon"))
> -		return ERR_PTR(-EINVAL);
> -
>  	syscon =3D kzalloc(sizeof(*syscon), GFP_KERNEL);
>  	if (!syscon)
>  		return ERR_PTR(-ENOMEM);
> @@ -117,16 +114,18 @@ static struct syscon *of_syscon_register(struct dev=
ice_node *np)
>  		goto err_regmap;
>  	}
> =20
> -	clk =3D of_clk_get(np, 0);
> -	if (IS_ERR(clk)) {
> -		ret =3D PTR_ERR(clk);
> -		/* clock is optional */
> -		if (ret !=3D -ENOENT)
> -			goto err_clk;
> -	} else {
> -		ret =3D regmap_mmio_attach_clk(regmap, clk);
> -		if (ret)
> -			goto err_attach;
> +	if (check_clk) {
> +		clk =3D of_clk_get(np, 0);
> +		if (IS_ERR(clk)) {
> +			ret =3D PTR_ERR(clk);
> +			/* clock is optional */
> +			if (ret !=3D -ENOENT)
> +				goto err_clk;
> +		} else {
> +			ret =3D regmap_mmio_attach_clk(regmap, clk);
> +			if (ret)
> +				goto err_attach;
> +		}
>  	}
> =20
>  	syscon->regmap =3D regmap;
> @@ -150,7 +149,8 @@ static struct syscon *of_syscon_register(struct devic=
e_node *np)
>  	return ERR_PTR(ret);
>  }
> =20
> -struct regmap *syscon_node_to_regmap(struct device_node *np)
> +static struct regmap *device_node_get_regmap(struct device_node *np,
> +					     bool check_clk)
>  {
>  	struct syscon *entry, *syscon =3D NULL;
> =20
> @@ -165,13 +165,27 @@ struct regmap *syscon_node_to_regmap(struct device_=
node *np)
>  	spin_unlock(&syscon_list_slock);
> =20
>  	if (!syscon)
> -		syscon =3D of_syscon_register(np);
> +		syscon =3D of_syscon_register(np, check_clk);
> =20
>  	if (IS_ERR(syscon))
>  		return ERR_CAST(syscon);
> =20
>  	return syscon->regmap;
>  }
> +
> +struct regmap *device_node_to_regmap(struct device_node *np)
> +{
> +	return device_node_get_regmap(np, false);
> +}
> +EXPORT_SYMBOL_GPL(device_node_to_regmap);
> +
> +struct regmap *syscon_node_to_regmap(struct device_node *np)
> +{
> +	if (!of_device_is_compatible(np, "syscon"))
> +		return ERR_PTR(-EINVAL);
> +
> +	return device_node_get_regmap(np, true);
> +}
>  EXPORT_SYMBOL_GPL(syscon_node_to_regmap);
> =20
>  struct regmap *syscon_regmap_lookup_by_compatible(const char *s)
> diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
> index 8cfda0554381..112dc66262cc 100644
> --- a/include/linux/mfd/syscon.h
> +++ b/include/linux/mfd/syscon.h
> @@ -17,12 +17,18 @@
>  struct device_node;
> =20
>  #ifdef CONFIG_MFD_SYSCON
> +extern struct regmap *device_node_to_regmap(struct device_node *np);
>  extern struct regmap *syscon_node_to_regmap(struct device_node *np);
>  extern struct regmap *syscon_regmap_lookup_by_compatible(const char *s);
>  extern struct regmap *syscon_regmap_lookup_by_phandle(
>  					struct device_node *np,
>  					const char *property);
>  #else
> +static inline struct regmap *device_node_to_regmap(struct device_node *n=
p)
> +{
> +	return ERR_PTR(-ENOTSUPP);
> +}
> +
>  static inline struct regmap *syscon_node_to_regmap(struct device_node *n=
p)
>  {
>  	return ERR_PTR(-ENOTSUPP);
> --=20
> 2.21.0.593.g511ec345e18
>=20
