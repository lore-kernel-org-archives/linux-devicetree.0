From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v2 1/6] pinctrl: berlin: regmap as an extra argument of
 berlin_pinctrl_probe()
Date: Fri, 2 Oct 2015 15:04:56 +0200
Message-ID: <20151002130456.GC3162@kwain>
References: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
 <1442829860-4647-2-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442829860-4647-2-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jisheng,

Thanks for providing this!

On Mon, Sep 21, 2015 at 06:04:15PM +0800, Jisheng Zhang wrote:
> Let berlin_pinctrl_probe() accepts an extra argument: regmap, this is=
 to
> prepare for the next berlin4ct support, where we won't use simple-mfd
> any more.

Just a question here: why don't we have instead one
berlin_pinctrl_probe() and one berlin_pinctrl_probe_regmap(), both
calling a static probe function in berlin.c, to avoid duplicating code?

Antoine

> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
> ---
>  drivers/pinctrl/berlin/berlin-bg2.c   | 10 +++++++++-
>  drivers/pinctrl/berlin/berlin-bg2cd.c | 10 +++++++++-
>  drivers/pinctrl/berlin/berlin-bg2q.c  | 10 +++++++++-
>  drivers/pinctrl/berlin/berlin.c       |  9 +--------
>  drivers/pinctrl/berlin/berlin.h       |  1 +
>  5 files changed, 29 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pinctrl/berlin/berlin-bg2.c b/drivers/pinctrl/be=
rlin/berlin-bg2.c
> index 274c553..4aede2e 100644
> --- a/drivers/pinctrl/berlin/berlin-bg2.c
> +++ b/drivers/pinctrl/berlin/berlin-bg2.c
> @@ -10,6 +10,7 @@
>   * warranty of any kind, whether express or implied.
>   */
> =20
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -233,8 +234,15 @@ static int berlin2_pinctrl_probe(struct platform=
_device *pdev)
>  {
>  	const struct of_device_id *match =3D
>  		of_match_device(berlin2_pinctrl_match, &pdev->dev);
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *parent_np =3D of_get_parent(dev->of_node);
> +	struct regmap *regmap =3D syscon_node_to_regmap(parent_np);
> =20
> -	return berlin_pinctrl_probe(pdev, match->data);
> +	of_node_put(parent_np);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return berlin_pinctrl_probe(pdev, regmap, match->data);
>  }
> =20
>  static struct platform_driver berlin2_pinctrl_driver =3D {
> diff --git a/drivers/pinctrl/berlin/berlin-bg2cd.c b/drivers/pinctrl/=
berlin/berlin-bg2cd.c
> index 0cb793a..6378dd8 100644
> --- a/drivers/pinctrl/berlin/berlin-bg2cd.c
> +++ b/drivers/pinctrl/berlin/berlin-bg2cd.c
> @@ -10,6 +10,7 @@
>   * warranty of any kind, whether express or implied.
>   */
> =20
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -176,8 +177,15 @@ static int berlin2cd_pinctrl_probe(struct platfo=
rm_device *pdev)
>  {
>  	const struct of_device_id *match =3D
>  		of_match_device(berlin2cd_pinctrl_match, &pdev->dev);
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *parent_np =3D of_get_parent(dev->of_node);
> +	struct regmap *regmap =3D syscon_node_to_regmap(parent_np);
> =20
> -	return berlin_pinctrl_probe(pdev, match->data);
> +	of_node_put(parent_np);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return berlin_pinctrl_probe(pdev, regmap, match->data);
>  }
> =20
>  static struct platform_driver berlin2cd_pinctrl_driver =3D {
> diff --git a/drivers/pinctrl/berlin/berlin-bg2q.c b/drivers/pinctrl/b=
erlin/berlin-bg2q.c
> index a466054..907bdf0 100644
> --- a/drivers/pinctrl/berlin/berlin-bg2q.c
> +++ b/drivers/pinctrl/berlin/berlin-bg2q.c
> @@ -10,6 +10,7 @@
>   * warranty of any kind, whether express or implied.
>   */
> =20
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -395,8 +396,15 @@ static int berlin2q_pinctrl_probe(struct platfor=
m_device *pdev)
>  {
>  	const struct of_device_id *match =3D
>  		of_match_device(berlin2q_pinctrl_match, &pdev->dev);
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *parent_np =3D of_get_parent(dev->of_node);
> +	struct regmap *regmap =3D syscon_node_to_regmap(parent_np);
> =20
> -	return berlin_pinctrl_probe(pdev, match->data);
> +	of_node_put(parent_np);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return berlin_pinctrl_probe(pdev, regmap, match->data);
>  }
> =20
>  static struct platform_driver berlin2q_pinctrl_driver =3D {
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin=
/berlin.c
> index f495806..0557bbe 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -11,7 +11,6 @@
>   */
> =20
>  #include <linux/io.h>
> -#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -293,19 +292,13 @@ static struct pinctrl_desc berlin_pctrl_desc =3D=
 {
>  };
> =20
>  int berlin_pinctrl_probe(struct platform_device *pdev,
> +			 struct regmap *regmap,
>  			 const struct berlin_pinctrl_desc *desc)
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
> diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin=
/berlin.h
> index e1aa841..bf5781a 100644
> --- a/drivers/pinctrl/berlin/berlin.h
> +++ b/drivers/pinctrl/berlin/berlin.h
> @@ -56,6 +56,7 @@ struct berlin_pinctrl_function {
>  #define BERLIN_PINCTRL_FUNCTION_UNKNOWN		{}
> =20
>  int berlin_pinctrl_probe(struct platform_device *pdev,
> +			 struct regmap *regmap,
>  			 const struct berlin_pinctrl_desc *desc);
> =20
>  #endif /* __PINCTRL_BERLIN_H */
> --=20
> 2.5.3
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
