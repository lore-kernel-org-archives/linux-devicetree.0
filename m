From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 02/12] ARM: dts: sunxi: h3/h5: Fix i2c2 register address
Date: Fri, 22 Sep 2017 09:49:45 +0200
Message-ID: <20170922074945.jzibcgromgbhggxy@flea.lan>
References: <20170921172151.29779-1-clabbe.montjoie@gmail.com>
 <20170921172151.29779-3-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3wsqaxik5uzaeofz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170921172151.29779-3-clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3wsqaxik5uzaeofz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2017 at 05:21:41PM +0000, Corentin Labbe wrote:
> The unit address and register address does not match.
> This patch fix the register address with the good one.
>=20
> Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi=
-h3-h5.dtsi
> index 59ddac9f65a7..37464d4d07f6 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -630,9 +630,9 @@
>  			#size-cells =3D <0>;
>  		};
> =20
> -		i2c2: i2c@01c2b400 {
> +		i2c2: i2c@1c2b400 {

This one should be merged into the previous patch.

The serie looks good otherwise, onec it's fixed, you can add my
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3wsqaxik5uzaeofz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZxMCZAAoJEBx+YmzsjxAgqqsP/3HiqZFc8sLf0k6225Eu7mz3
TptcXyhWY77MbVWvXzMNkputPBh7ltTquQmCwmOnLFr0SN9iS0q8gJao6eoc1amR
Q5Pn6mHdMGRrlapBv1+6tO46OIqrRnurtA5OgW+nilPNwdTyY6ao77zz3bhs+mzh
eSmcwvijQR+Wl51HMpKKAEtxrbEZm9qlfbTGFl+SkH5wt5QRjYX40Zu74q4gjJPg
N4bS0JyyxzjkvsJGNsUGZ2mCKXpyjkx8jQnHzSCdQLhkig5YVNPyUbfV54dkCZX2
DOFuVO/ooYf7e1TuybawJW4IHztajN5FqiYJN8S/0joIbWFFzXGGtLu92g7acHow
INChr2aTq8RV7L0ZNWMWvcnMbGiOiIgSa7EqPJnlV9onbVxKMXYL9VD2eqYvguaH
58kwjasc7ZjkyVw2FNSp6CWnkaUSVPl+FJbCvijfPqtrfBkfOm5TQzYxCPy1G8bc
5VHKBlLcSu1/YkYwqTTnKoW1xeWZfVmLMozOOvIgIMTp5MA0N8xpGA618FlD9kOs
RC3cxMbBI2nXkE2cKyuXRNUG/wYnmHWqPudZcjejhuMKUW/SRq5V28i30SehMcdJ
3dZbE04yhmwJe27MV067gLQKpn/WOwZoJjLma1Pf7pRYSPvXy/G6fXDD8Lc18nvX
+9g/jP9qCMRHsFqjpLTH
=SPjg
-----END PGP SIGNATURE-----

--3wsqaxik5uzaeofz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
