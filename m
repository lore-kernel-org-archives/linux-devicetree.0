From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-V5 2/4] mfd: 88pm800: Remove unnecessary protection
 around pdata
Date: Tue, 7 Jul 2015 08:30:36 +0100
Message-ID: <20150707073036.GP3182@x1>
References: <1435591877-18214-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435591877-18214-3-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1435591877-18214-3-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 29 Jun 2015, Vaibhav Hiremath wrote:

> With addition of proper checks in place in pm800_probe function,
> which makes sure that pdata would never become NULL.
> So remove all unnecessary protection around pdata in whole
> driver code.
>=20
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/88pm800.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index 40fd014..d495737 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -302,7 +302,7 @@ static int device_gpadc_init(struct pm80x_chip *c=
hip,
>  	mask =3D (PM800_GPADC_GP_BIAS_EN0 | PM800_GPADC_GP_BIAS_EN1 |
>  		PM800_GPADC_GP_BIAS_EN2 | PM800_GPADC_GP_BIAS_EN3);
> =20
> -	if (pdata && (pdata->batt_det =3D=3D 0))
> +	if (pdata->batt_det =3D=3D 0)
>  		data =3D (PM800_GPADC_GP_BIAS_EN0 | PM800_GPADC_GP_BIAS_EN1 |
>  			PM800_GPADC_GP_BIAS_EN2 | PM800_GPADC_GP_BIAS_EN3);
>  	else
> @@ -342,11 +342,9 @@ static int device_rtc_init(struct pm80x_chip *ch=
ip,
>  {
>  	int ret;
> =20
> -	if (pdata) {
> -		rtc_devs[0].platform_data =3D pdata->rtc;
> -		rtc_devs[0].pdata_size =3D
> -				pdata->rtc ? sizeof(struct pm80x_rtc_pdata) : 0;
> -	}
> +	rtc_devs[0].platform_data =3D pdata->rtc;
> +	rtc_devs[0].pdata_size =3D pdata->rtc ? sizeof(struct pm80x_rtc_pda=
ta) : 0;
> +
>  	ret =3D mfd_add_devices(chip->dev, 0, &rtc_devs[0],
>  			      ARRAY_SIZE(rtc_devs), NULL, 0, NULL);
>  	if (ret) {
> @@ -503,7 +501,7 @@ static int device_800_init(struct pm80x_chip *chi=
p,
>  		goto out;
>  	}
>  	if (val & PM800_ALARM_WAKEUP) {
> -		if (pdata && pdata->rtc)
> +		if (pdata->rtc)
>  			pdata->rtc->rtc_wakeup =3D 1;
>  	}
> =20
> @@ -602,7 +600,7 @@ static int pm800_probe(struct i2c_client *client,
>  		goto err_device_init;
>  	}
> =20
> -	if (pdata && pdata->plat_config)
> +	if (pdata->plat_config)
>  		pdata->plat_config(chip, pdata);
> =20
>  	return 0;

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
