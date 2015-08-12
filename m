From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 2/3] mfd: arizona: factor out checking of jack
 detection state
Date: Wed, 12 Aug 2015 15:45:27 +0100
Message-ID: <20150812144527.GI18282@x1>
References: <1439380692-7848-1-git-send-email-rf@opensource.wolfsonmicro.com>
 <1439380692-7848-3-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439380692-7848-3-git-send-email-rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 12 Aug 2015, Richard Fitzgerald wrote:

> Currently runtime_suspend will fully power off the codec if
> the jack detection is not enabled. Not all future codecs will
> have jack detection so to prepare for these codecs this patch
> factors out the check so that it be called as needed in the
> existing codec-specific switch cases.
>=20
> Signed-off-by: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/mfd/arizona-core.c | 41 ++++++++++++++++++++++++++++++++----=
-----
>  1 file changed, 32 insertions(+), 9 deletions(-)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 33f3db4..43ca30b 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -489,6 +489,23 @@ static int arizona_connect_dcvdd(struct arizona =
*arizona)
>  	return ret;
>  }
> =20
> +static int arizona_is_jack_det_active(struct arizona *arizona)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE, =
&val);
> +	if (ret) {
> +		dev_err(arizona->dev,
> +			"Failed to check jack det status: %d\n", ret);
> +		return ret;
> +	} else if (val & ARIZONA_JD1_ENA) {
> +		return 1;
> +	} else {
> +		return 0;
> +	}
> +}
> +
>  static int arizona_runtime_resume(struct device *dev)
>  {
>  	struct arizona *arizona =3D dev_get_drvdata(dev);
> @@ -613,20 +630,18 @@ err:
>  static int arizona_runtime_suspend(struct device *dev)
>  {
>  	struct arizona *arizona =3D dev_get_drvdata(dev);
> -	unsigned int val;
> +	unsigned int jd_active =3D 0;
>  	int ret;
> =20
>  	dev_dbg(arizona->dev, "Entering AoD mode\n");
> =20
> -	ret =3D regmap_read(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE, =
&val);
> -	if (ret) {
> -		dev_err(dev, "Failed to check jack det status: %d\n", ret);
> -		return ret;
> -	}
> -
>  	switch (arizona->type) {
>  	case WM5110:
>  	case WM8280:
> +		jd_active =3D arizona_is_jack_det_active(arizona);
> +		if (jd_active < 0)
> +			return jd_active;
> +
>  		if (arizona->external_dcvdd) {
>  			ret =3D arizona_isolate_dcvdd(arizona);
>  			if (ret !=3D 0)
> @@ -648,13 +663,17 @@ static int arizona_runtime_suspend(struct devic=
e *dev)
>  		}
>  		break;
>  	case WM5102:
> +		jd_active =3D arizona_is_jack_det_active(arizona);
> +		if (jd_active < 0)
> +			return jd_active;
> +
>  		if (arizona->external_dcvdd) {
>  			ret =3D arizona_isolate_dcvdd(arizona);
>  			if (ret !=3D 0)
>  				return ret;
>  		}
> =20
> -		if (!(val & ARIZONA_JD1_ENA)) {
> +		if (!jd_active) {
>  			ret =3D regmap_write(arizona->regmap,
>  					   ARIZONA_WRITE_SEQUENCER_CTRL_3, 0x0);
>  			if (ret) {
> @@ -666,6 +685,10 @@ static int arizona_runtime_suspend(struct device=
 *dev)
>  		}
>  		break;
>  	default:
> +		jd_active =3D arizona_is_jack_det_active(arizona);
> +		if (jd_active < 0)
> +			return jd_active;
> +
>  		if (arizona->external_dcvdd) {
>  			ret =3D arizona_isolate_dcvdd(arizona);
>  			if (ret !=3D 0)
> @@ -679,7 +702,7 @@ static int arizona_runtime_suspend(struct device =
*dev)
>  	regulator_disable(arizona->dcvdd);
> =20
>  	/* Allow us to completely power down if no jack detection */
> -	if (!(val & ARIZONA_JD1_ENA)) {
> +	if (!jd_active) {
>  		dev_dbg(arizona->dev, "Fully powering off\n");
> =20
>  		arizona->has_fully_powered_off =3D true;

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
