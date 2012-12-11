From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 2/4] leds: leds-pwm: Preparing the driver for device
 tree support
Date: Tue, 11 Dec 2012 08:12:53 +0100
Message-ID: <20121211071253.GC8294@avionic-0098.adnet.avionic-design.de>
References: <1355133637-2784-1-git-send-email-peter.ujfalusi@ti.com>
 <1355133637-2784-3-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3505245983583987728=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355133637-2784-3-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============3505245983583987728==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2012 at 11:00:35AM +0100, Peter Ujfalusi wrote:
> In order to be able to add device tree support for leds-pwm driver we need
> to rearrange the data structures used by the drivers.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/leds/leds-pwm.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 351257c..02f0c0c 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -30,6 +30,11 @@ struct led_pwm_data {
>  	unsigned int		period;
>  };
> =20
> +struct led_pwm_priv {
> +	int num_leds;
> +	struct led_pwm_data leds[];
> +};

I think you want leds[0] here. Otherwise your structure is too large by
sizeof(struct led_pwm_data *).

> +
>  static void led_pwm_set(struct led_classdev *led_cdev,
>  	enum led_brightness brightness)
>  {
> @@ -47,25 +52,29 @@ static void led_pwm_set(struct led_classdev *led_cdev,
>  	}
>  }
> =20
> +static inline int sizeof_pwm_leds_priv(int num_leds)

Perhaps this should return size_t?

> +{
> +	return sizeof(struct led_pwm_priv) +
> +		      (sizeof(struct led_pwm_data) * num_leds);
> +}
> +
>  static int led_pwm_probe(struct platform_device *pdev)
>  {
>  	struct led_pwm_platform_data *pdata =3D pdev->dev.platform_data;
> -	struct led_pwm *cur_led;
> -	struct led_pwm_data *leds_data, *led_dat;
> +	struct led_pwm_priv *priv;
>  	int i, ret =3D 0;
> =20
>  	if (!pdata)
>  		return -EBUSY;
> =20
> -	leds_data =3D devm_kzalloc(&pdev->dev,
> -			sizeof(struct led_pwm_data) * pdata->num_leds,
> -				GFP_KERNEL);
> -	if (!leds_data)
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof_pwm_leds_priv(pdata->num_leds),
> +			    GFP_KERNEL);

I'm not sure if sizeof_pwm_leds_priv() requires to be a separate
function. You could make it shorter by doing something like:

	size_t extra =3D sizeof(*led_dat) * pdata->num_leds;

	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv) + extra, GFP_KERNEL);

But that's really just a matter of taste, so no further objections if
you want to keep the inline function.

Thierry

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQxtz1AAoJEN0jrNd/PrOhUU4P+gLJHgWtDm0s/NCnexXBdCrf
vzMxNBFgJ2yE8onyjjY7xBmb1gcPNZrjM92lTyy87mz6USNcq9EI5nNFzgZysGUQ
NxsEOlYD2EZ3FNi/9cdhq3T9EOR+G57HetqCvimoOdl7ZMGZ8DDKOADk/Wx25juX
lHotDE6l9Fcv8z4ObUZR3Nvr0SCU+4pal+q19qHWmeGjVFatB8zStqpNDBpv00ta
i3Q1TFOeDe7+WZhnMdL9vX5P5Lumlly1idZCd0s70mqJPB54eZId4qiKz2xWyOnl
Jgl0I8bifWCmRLBobEcwYtynHAnRoxni+JfkXxRp9jju2Sa7EtsQOJ+fxhLOLZ1O
pLoBcqNvhOPzWjn2lqacamp29ioHkyOR9ZxI/sa5d+7YWlujBMMqErIHcd2PknHb
Y6j4XdQM9Oyp2xiw4T7DIlt1VaNXqkEL7dD4+GjpH3AUSN6vRyr5sppvBJiqkaqR
Cr2Avy+64Hwnwnbq9wSi27t/rXmhFeQBbNqiCQ2cQRiKJQiGHf84JqbWMlBuqx/z
0oTQQwGhy7WdRuyObep2+t0ir0ZPT7ZH+XsMym/Ha8b5MyHqToMUdj08DiLDPylq
C700jKySZhoFHR0yWM4d1X0NJHb0uBlz2W6tckiY3k5L2148qhlBKK8xnVLZNDi3
dLhVV8MIKcZ66NwLvumq
=NODy
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--

--===============3505245983583987728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3505245983583987728==--
