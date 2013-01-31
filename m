From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/4] pwm_backlight: Validate dft_brightness in main probe
 function
Date: Thu, 31 Jan 2013 13:38:18 +0100
Message-ID: <510A65BA.6090208@ti.com>
References: <1358861996-27194-1-git-send-email-peter.ujfalusi@ti.com> <1358861996-27194-3-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1358861996-27194-3-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Thierry Reding <thierry.reding@avionic-design.de>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Andrew Morton <akpm@linux-foundation.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On 01/22/2013 02:39 PM, Peter Ujfalusi wrote:
> Move the dft_brightness validity check from the DT parsing function t=
o the
> main probe. In this way we can validate it in case we are booting wit=
h or
> without DT.

Based on the discussion the rest of the series is going to be dropped, =
but
what about this single patch?
I think it is still addresses a valid issue, which is that in non DT bo=
ot we
do not check if the dft_brightness is within valid range.

I can resend this patch alone since it is not going to apply on mainlin=
e as it is.

--=20
P=E9ter

>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/video/backlight/pwm_bl.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlig=
ht/pwm_bl.c
> index f0d6854..2a81c24 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -135,12 +135,6 @@ static int pwm_backlight_parse_dt(struct device =
*dev,
>  		if (ret < 0)
>  			return ret;
> =20
> -		if (value >=3D data->max_brightness) {
> -			dev_warn(dev, "invalid default brightness level: %u, using %u\n",
> -				 value, data->max_brightness - 1);
> -			value =3D data->max_brightness - 1;
> -		}
> -
>  		data->dft_brightness =3D value;
>  	}
> =20
> @@ -249,6 +243,12 @@ static int pwm_backlight_probe(struct platform_d=
evice *pdev)
>  		goto err_alloc;
>  	}
> =20
> +	if (data->dft_brightness > data->max_brightness) {
> +		dev_warn(&pdev->dev,
> +			 "invalid default brightness level: %u, using %u\n",
> +			 data->dft_brightness, data->max_brightness);
> +		data->dft_brightness =3D data->max_brightness;
> +	}
>  	bl->props.brightness =3D data->dft_brightness;
>  	backlight_update_status(bl);
> =20
>=20
