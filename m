From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v3 1/4] leds: leds-pwm: Convert to use devm_get_pwm
Date: Tue, 11 Dec 2012 08:03:07 +0100
Message-ID: <20121211070307.GB8294@avionic-0098.adnet.avionic-design.de>
References: <1355133637-2784-1-git-send-email-peter.ujfalusi@ti.com>
 <1355133637-2784-2-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1355133637-2784-2-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2012 at 11:00:34AM +0100, Peter Ujfalusi wrote:
> Update the driver to use the new API for requesting pwm so we can take
> advantage of the pwm_lookup table to find the correct pwm to be used for =
the
> LED functionality.
> If the devm_get_pwm fails we fall back to legacy mode to try to get the p=
wm.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/leds/leds-pwm.c  | 19 ++++++-------------
>  include/linux/leds_pwm.h |  2 +-
>  2 files changed, 7 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 2157524..351257c 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -67,12 +67,11 @@ static int led_pwm_probe(struct platform_device *pdev)
>  		cur_led =3D &pdata->leds[i];
>  		led_dat =3D &leds_data[i];
> =20
> -		led_dat->pwm =3D pwm_request(cur_led->pwm_id,
> -				cur_led->name);
> +		led_dat->pwm =3D devm_pwm_get(&pdev->dev, cur_led->name);
>  		if (IS_ERR(led_dat->pwm)) {
>  			ret =3D PTR_ERR(led_dat->pwm);
> -			dev_err(&pdev->dev, "unable to request PWM %d\n",
> -					cur_led->pwm_id);
> +			dev_err(&pdev->dev, "unable to request PWM for %s\n",
> +				cur_led->name);
>  			goto err;
>  		}

The commit message says that legacy mode is used as fallback if
devm_get_pwm() (that should really be devm_pwm_get() btw) fails but I
don't see where pwm_request() is called.

Thierry

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQxtqrAAoJEN0jrNd/PrOhXCAP/16NmcodkPZtMJg+A8NHuMp9
dwUAuX3de6qMQijqjF4VCCN9uqeDlxBQRNAICAl1Iif8zkpQApVNKrVPKGLdiGPI
OPuyrw6QwgQ7rW/e+ndZAdSUePQi5Pq9JZZNwnk2KbfP4e3QXjDo6GObKz5DcKua
Ur0I9zVfyXyyZsnq6LjzpebpHzp9o3wnHXFh1YPkq94A0XNXgiG2+IHCWhZIoDUz
swT3ZXPeAF+QW1ZmXmEuHPXP7KsJiZ7VfjkmeNUNFqrMsSe3w/3BF3qvJGYcVRwj
1oegqil9oDXx/jHi8F0LdyRpFUnPb0cyrZlNQq/0fGrNU0GsHJA6JnhzoZ1HhfR8
6uQ2zBL9hY3oZm25SEluZ8PknGOXhssQk3NLol+pQdnehA0wCdqtSi8WWDRin1+O
MmSSaIm4gVXul0KrwARwplxvteYgFIcFuZpojBQ0SjdYntrjih3abQAsyWR9rbVO
zZ0vFXOLmCXjykW1YhszVE6FozCy2ed+eEcmiU8N0JjbzgsunAQxuSdBmSRrzZZd
ZcgFgRfPNlNNS+hRp+YkCKq5FCPGD2RNy2jCMxPFecQuW7bwjuZMnt1MGTwXagxu
+pIHKdnKuWcG0zC//6WuSiDe4wlLIXMsWTr8Fbf/ATBUD/8bCxAoJFfM6AD3sILm
sT5Bq/qM/+Xz+JCavxIE
=vBuo
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
