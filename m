From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/5] gpio: of: Scan available child node for gpio-hog
Date: Tue, 8 Mar 2016 15:18:46 +0100
Message-ID: <20160308141844.GA9864@ulmo.nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
 <1457438528-29054-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1457438528-29054-2-git-send-email-ldewangan@nvidia.com>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2016 at 05:32:04PM +0530, Laxman Dewangan wrote:
> Look for child node which are available when iterating for
> gpio hog node for request/set GPIO initial configuration
> during OF gpio chip registration.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  drivers/gpio/gpiolib-of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 42a4bb7..f2ba1a4 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -210,7 +210,7 @@ static void of_gpiochip_scan_gpios(struct gpio_chip *=
chip)
>  	enum gpio_lookup_flags lflags;
>  	enum gpiod_flags dflags;
> =20
> -	for_each_child_of_node(chip->of_node, np) {
> +	for_each_available_child_of_node(chip->of_node, np) {
>  		if (!of_property_read_bool(np, "gpio-hog"))
>  			continue;

Makes sense:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW3t9AAAoJEN0jrNd/PrOhHdcP/RqazKFP5mEi7MugNVJ9yeEK
wMlBvSFwt2RGuXrOEO2Tf8nygYit+1lWd3knz/6JXjRTWDVed2fDLEg2f1lit5Nu
v2jOdcMxepCiVg95jKIzqZ/lSFI4vO+fgAlxE7Wov4Nyxl1+cYyUnty8OopqRlyE
+X3S2+KKjckawLsDO3ADbs5jIK8YeI4DnRMltnYnU2KEDxoL8dtLVxCECeS0AnEk
fQRwDye1wXLBXGcD0mcYOgTb98otGQtQ14eBVhvujahqg6WcAj31nMFzNvFHXxHL
J4JxFxhCPkIZ84Zs8Yi7X0dVRM5ANHMbNNTC7PLRB8aS97NYQhKEkxjiHbCQAB4G
zb6rAaXvLRBz7WPkHwIj39vfu6akrgwcg6tlRDzq78imqZAByv38l7rhq8eh4fXt
pb7zm8TgEQnxHB/oqZ7LwEhL5P74sWN4lkQNjzRe33mq4IKzZtINzOUDvBD2zOim
B0xMnarsBsFyPxbaHTKGnVZY1GYQT+UXUml/IwmZMiYlocHk5iKkqWwCwW/bHr+A
9KcZcaeInzhZUmXHVkNXSuRC4BX3L7JtRgE+xq2uCwXCva9s5GetSNcOZ3zvmi+Y
jYjBrr1ehk4bq9JuhOnk48cK5UKhoDZexcNlZaTUmUDE8Eq/Hz58dMIBMX42uE3W
rWddoksqnKsYlBDIMztK
=vOkY
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
