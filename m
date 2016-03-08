From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/5] gpio: gpiolib: Print error number if gpio hog failed
Date: Tue, 8 Mar 2016 15:22:19 +0100
Message-ID: <20160308142217.GB9864@ulmo.nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
 <1457438528-29054-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457438528-29054-3-git-send-email-ldewangan@nvidia.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2016 at 05:32:05PM +0530, Laxman Dewangan wrote:
> Print the error number of GPIO hog failed during
> its configurations. This helps in identifying the
> failure without instrumenting the code.

Please use up all 72 characters per line at your disposal. Excessively
short lines are hard to read.

> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  drivers/gpio/gpiolib.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index bc788b9..7575ebb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2621,15 +2621,16 @@ int gpiod_hog(struct gpio_desc *desc, const char =
*name,
> =20
>  	local_desc =3D gpiochip_request_own_desc(chip, hwnum, name);
>  	if (IS_ERR(local_desc)) {
> -		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed\n",
> -		       name, chip->label, hwnum);
> +		status =3D PTR_ERR(local_desc);
> +		pr_err("requesting hog GPIO %s, chip %s, offset %d failed %d\n",
> +		       name, chip->label, hwnum, status);

I find this type of format hard to read. I prefer a semi-colon to
separate the message from the failure reason (i.e. error code).

Besides that I don't understand why you're dropping the parentheses
around the "chip %s, offset %d", I found that easier on the eye.

Thierry

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW3uAZAAoJEN0jrNd/PrOhorMP/AvzHbguLnY8zJMCCIG3EgS+
CSmh61z3s2edTuHGG2xrZnUV2Iz6+7Mv+GIjGVpqS26tcpVUxPRRIW2FGE7zBcwh
DdT0l2S9HGESXl2EUl1jeOFBYjGkTbnXRqWnAsHGQMsczJICQw2/F76UGrFyh86l
jnuEYK3wQVSMAvy10SfyRNIlQqKIW+3HC3310ER7msXQcWsfHDq5yoGst844BqkA
TOZU6uR1VmA2CjSqNXrmmkLEnpbeRIBeHzstRcYMEKWE+neE7DqN12ipWXYRhA65
GVH8yyhNbfeuoMGDkbOfQ+mYwwKdmO3eUhY9hjiPIvzQMVLxHDp8Tvl5dyFE9PqJ
IJgodSZzhYeXTJSsWdUy0vRBLbTVcuEx7Zh4CO2TGdphFxf/fNW5LnFEkRmKRBpG
DVlKFziGVvh2bu34i9w7FMZ5G9BGgmCY2yWlE4jKHi4ON6y2C8okrxvwCvBXym2Q
2JvNmkvzScuy9VmMzh2BmArWGXLLpPlNfpOcXf0xE2pyMym73mE7/MoybR5j9bFv
fNs3e9B/tf3rr5RKECEEfk2+YOKXNQx+BFw9fKw5kgio0/GfHLdo/yE3mqCrE/pp
LJrMvIK0zHyH5dHgoO+8DORPtb+VUXHqT6tBFKMh5T32ipgKzd8ELMp1gUm11eAJ
OSFQr6YVkzz5ccRCObvT
=1SCZ
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
