From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 1/3] mfd: arizona: factor out DCVDD isolation control
Date: Wed, 12 Aug 2015 15:42:57 +0100
Message-ID: <20150812144257.GH18282@x1>
References: <1439380692-7848-1-git-send-email-rf@opensource.wolfsonmicro.com>
 <1439380692-7848-2-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439380692-7848-2-git-send-email-rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 12 Aug 2015, Richard Fitzgerald wrote:

> Currently DCVDD isolation is enabled and disabled for
> runtime_suspend and runtime_resume. Future codecs will not
> have the isolation control so to prepare for these codecs
> this patch factors out the isolation control allowing it to
> be called as needed in the existing codec-specific switch cases.
>=20
> Signed-off-by: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/mfd/arizona-core.c | 108 ++++++++++++++++++++++++++---------=
----------
>  1 file changed, 62 insertions(+), 46 deletions(-)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index bc814b0..33f3db4 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -462,6 +462,33 @@ static int wm5102_clear_write_sequencer(struct a=
rizona *arizona)
>  }
> =20
>  #ifdef CONFIG_PM
> +static int arizona_isolate_dcvdd(struct arizona *arizona)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(arizona->regmap,
> +				 ARIZONA_ISOLATION_CONTROL,
> +				 ARIZONA_ISOLATE_DCVDD1,
> +				 ARIZONA_ISOLATE_DCVDD1);
> +	if (ret !=3D 0)
> +		dev_err(arizona->dev, "Failed to isolate DCVDD: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int arizona_connect_dcvdd(struct arizona *arizona)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(arizona->regmap,
> +				 ARIZONA_ISOLATION_CONTROL,
> +				 ARIZONA_ISOLATE_DCVDD1, 0);
> +	if (ret !=3D 0)
> +		dev_err(arizona->dev, "Failed to connect DCVDD: %d\n", ret);
> +
> +	return ret;
> +}
> +
>  static int arizona_runtime_resume(struct device *dev)
>  {
>  	struct arizona *arizona =3D dev_get_drvdata(dev);
> @@ -501,14 +528,9 @@ static int arizona_runtime_resume(struct device =
*dev)
>  	switch (arizona->type) {
>  	case WM5102:
>  		if (arizona->external_dcvdd) {
> -			ret =3D regmap_update_bits(arizona->regmap,
> -						 ARIZONA_ISOLATION_CONTROL,
> -						 ARIZONA_ISOLATE_DCVDD1, 0);
> -			if (ret !=3D 0) {
> -				dev_err(arizona->dev,
> -					"Failed to connect DCVDD: %d\n", ret);
> +			ret =3D arizona_connect_dcvdd(arizona);
> +			if (ret !=3D 0)
>  				goto err;
> -			}
>  		}
> =20
>  		ret =3D wm5102_patch(arizona);
> @@ -533,14 +555,9 @@ static int arizona_runtime_resume(struct device =
*dev)
>  			goto err;
> =20
>  		if (arizona->external_dcvdd) {
> -			ret =3D regmap_update_bits(arizona->regmap,
> -						 ARIZONA_ISOLATION_CONTROL,
> -						 ARIZONA_ISOLATE_DCVDD1, 0);
> -			if (ret) {
> -				dev_err(arizona->dev,
> -					"Failed to connect DCVDD: %d\n", ret);
> +			ret =3D arizona_connect_dcvdd(arizona);
> +			if (ret !=3D 0)
>  				goto err;
> -			}
>  		} else {
>  			/*
>  			 * As this is only called for the internal regulator
> @@ -572,14 +589,9 @@ static int arizona_runtime_resume(struct device =
*dev)
>  		}
> =20
>  		if (arizona->external_dcvdd) {
> -			ret =3D regmap_update_bits(arizona->regmap,
> -						 ARIZONA_ISOLATION_CONTROL,
> -						 ARIZONA_ISOLATE_DCVDD1, 0);
> -			if (ret !=3D 0) {
> -				dev_err(arizona->dev,
> -					"Failed to connect DCVDD: %d\n", ret);
> +			ret =3D arizona_connect_dcvdd(arizona);
> +			if (ret !=3D 0)
>  				goto err;
> -			}
>  		}
>  		break;
>  	}
> @@ -612,37 +624,36 @@ static int arizona_runtime_suspend(struct devic=
e *dev)
>  		return ret;
>  	}
> =20
> -	if (arizona->external_dcvdd) {
> -		ret =3D regmap_update_bits(arizona->regmap,
> -					 ARIZONA_ISOLATION_CONTROL,
> -					 ARIZONA_ISOLATE_DCVDD1,
> -					 ARIZONA_ISOLATE_DCVDD1);
> -		if (ret !=3D 0) {
> -			dev_err(arizona->dev, "Failed to isolate DCVDD: %d\n",
> -				ret);
> -			return ret;
> -		}
> -	}
> -
>  	switch (arizona->type) {
>  	case WM5110:
>  	case WM8280:
> -		if (arizona->external_dcvdd)
> -			break;
> -
> -		/*
> -		 * As this is only called for the internal regulator
> -		 * (where we know voltage ranges available) it is ok
> -		 * to request an exact range.
> -		 */
> -		ret =3D regulator_set_voltage(arizona->dcvdd, 1175000, 1175000);
> -		if (ret < 0) {
> -			dev_err(arizona->dev,
> -				"Failed to set suspend voltage: %d\n", ret);
> -			return ret;
> +		if (arizona->external_dcvdd) {
> +			ret =3D arizona_isolate_dcvdd(arizona);
> +			if (ret !=3D 0)
> +				return ret;
> +		} else {
> +			/*
> +			 * As this is only called for the internal regulator
> +			 * (where we know voltage ranges available) it is ok
> +			 * to request an exact range.
> +			 */
> +			ret =3D regulator_set_voltage(arizona->dcvdd,
> +						    1175000, 1175000);
> +			if (ret < 0) {
> +				dev_err(arizona->dev,
> +					"Failed to set suspend voltage: %d\n",
> +					ret);
> +				return ret;
> +			}
>  		}
>  		break;
>  	case WM5102:
> +		if (arizona->external_dcvdd) {
> +			ret =3D arizona_isolate_dcvdd(arizona);
> +			if (ret !=3D 0)
> +				return ret;
> +		}
> +
>  		if (!(val & ARIZONA_JD1_ENA)) {
>  			ret =3D regmap_write(arizona->regmap,
>  					   ARIZONA_WRITE_SEQUENCER_CTRL_3, 0x0);
> @@ -655,6 +666,11 @@ static int arizona_runtime_suspend(struct device=
 *dev)
>  		}
>  		break;
>  	default:
> +		if (arizona->external_dcvdd) {
> +			ret =3D arizona_isolate_dcvdd(arizona);
> +			if (ret !=3D 0)
> +				return ret;
> +		}
>  		break;
>  	}
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
