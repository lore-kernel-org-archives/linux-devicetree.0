From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/6] mfd: arizona: Factor out read of device tree GPIOs
Date: Tue, 15 Apr 2014 11:25:27 +0100
Message-ID: <20140415102527.GD27091@lee--X1>
References: <1396340845-24060-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1396340845-24060-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396340845-24060-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, sameo@linux.intel.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 01 Apr 2014, Charles Keepax wrote:

> This patch factors out the reading of GPIOs for the Arizona devices
> into a helper function.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/mfd/arizona-core.c       |   33 ++++++++++++++++++++++++----=
-----
>  include/linux/mfd/arizona/core.h |    3 +++
>  2 files changed, 27 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index a45aab9..8ad4373 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -512,19 +512,34 @@ int arizona_of_get_type(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(arizona_of_get_type);
> =20
> +int arizona_of_get_named_gpio(struct arizona *arizona, const char *p=
rop,
> +			      bool mandatory, int *gpio)
> +{
> +	int ret;
> +
> +	ret =3D of_get_named_gpio(arizona->dev->of_node, prop, 0);
> +	*gpio =3D ret;
> +	if (ret >=3D 0)
> +		return ret;
> +
> +	*gpio =3D 0;
> +
> +	if (mandatory)
> +		dev_err(arizona->dev,
> +			"Mandatory DT gpio %s missing/malformed: %d\n",
> +			prop, ret);
> +
> +	return ret;
> +}

Hmm.. me no likey!

How about:

+void arizona_of_get_named_gpio(struct arizona *arizona, const char *pr=
op,
+				bool mandatory, int *gpio)
+{
+	*gpio =3D of_get_named_gpio(arizona->dev->of_node, prop, 0);
+	if (*gpio < 0) {
+	 	if (mandatory)
+			dev_err(arizona->dev,
+				"Mandatory DT gpio %s missing/malformed: %d\n",
+				prop, *gpio);
+		*gpio =3D 0;
+	}
+}

> +EXPORT_SYMBOL_GPL(arizona_of_get_named_gpio);
> +

Are you sure you're going to use this externally?

NB: I haven't looked at the remainder of the set yet.

>  static int arizona_of_get_core_pdata(struct arizona *arizona)
>  {
> +	struct arizona_pdata *pdata =3D &arizona->pdata;
>  	int ret, i;
> =20
> -	arizona->pdata.reset =3D of_get_named_gpio(arizona->dev->of_node,
> -						 "wlf,reset", 0);
> -	if (arizona->pdata.reset < 0)
> -		arizona->pdata.reset =3D 0;
> -
> -	arizona->pdata.ldoena =3D of_get_named_gpio(arizona->dev->of_node,
> -						  "wlf,ldoena", 0);
> -	if (arizona->pdata.ldoena < 0)
> -		arizona->pdata.ldoena =3D 0;
> +	arizona_of_get_named_gpio(arizona, "wlf,reset", true, &pdata->reset=
);
> +	arizona_of_get_named_gpio(arizona, "wlf,ldoena", true, &pdata->ldoe=
na);

I guess this pdata is populated by DT?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
