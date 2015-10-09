From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v4 1/6] pinctrl: berlin: introduce
 berlin_pinctrl_probe_regmap()
Date: Fri, 9 Oct 2015 11:04:43 +0200
Message-ID: <20151009090443.GB2842@kwain>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
 <1444378629-3057-2-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444378629-3057-2-git-send-email-jszhang@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 04:17:04PM +0800, Jisheng Zhang wrote:
> This is to prepare for the next berlin4ct support, where we won't use
> simple-mfd any more.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

> ---
>  drivers/pinctrl/berlin/berlin.c | 26 +++++++++++++++++---------
>  drivers/pinctrl/berlin/berlin.h |  4 ++++
>  2 files changed, 21 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin=
/berlin.c
> index f495806..898afa4 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -292,20 +292,14 @@ static struct pinctrl_desc berlin_pctrl_desc =3D=
 {
>  	.owner		=3D THIS_MODULE,
>  };
> =20
> -int berlin_pinctrl_probe(struct platform_device *pdev,
> -			 const struct berlin_pinctrl_desc *desc)
> +int berlin_pinctrl_probe_regmap(struct platform_device *pdev,
> +				const struct berlin_pinctrl_desc *desc,
> +				struct regmap *regmap)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct device_node *parent_np =3D of_get_parent(dev->of_node);
>  	struct berlin_pinctrl *pctrl;
> -	struct regmap *regmap;
>  	int ret;
> =20
> -	regmap =3D syscon_node_to_regmap(parent_np);
> -	of_node_put(parent_np);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
>  	pctrl =3D devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
>  	if (!pctrl)
>  		return -ENOMEM;
> @@ -330,3 +324,17 @@ int berlin_pinctrl_probe(struct platform_device =
*pdev,
> =20
>  	return 0;
>  }
> +
> +int berlin_pinctrl_probe(struct platform_device *pdev,
> +			 const struct berlin_pinctrl_desc *desc)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *parent_np =3D of_get_parent(dev->of_node);
> +	struct regmap *regmap =3D syscon_node_to_regmap(parent_np);
> +
> +	of_node_put(parent_np);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return berlin_pinctrl_probe_regmap(pdev, desc, regmap);
> +}
> diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin=
/berlin.h
> index e1aa841..dabbd2a 100644
> --- a/drivers/pinctrl/berlin/berlin.h
> +++ b/drivers/pinctrl/berlin/berlin.h
> @@ -58,4 +58,8 @@ struct berlin_pinctrl_function {
>  int berlin_pinctrl_probe(struct platform_device *pdev,
>  			 const struct berlin_pinctrl_desc *desc);
> =20
> +int berlin_pinctrl_probe_regmap(struct platform_device *pdev,
> +				const struct berlin_pinctrl_desc *desc,
> +				struct regmap *regmap);
> +
>  #endif /* __PINCTRL_BERLIN_H */
> --=20
> 2.6.1
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
