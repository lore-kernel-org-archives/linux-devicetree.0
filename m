From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 11/12] ARM: dts: sun6i: Add pinmux settings for mmc1
 to dtsi
Date: Tue, 10 Mar 2015 22:31:17 +0100
Message-ID: <20150310213117.GG5085@lukather>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-12-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+Pu8h6CsJtbukPM9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425988764-23618-12-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+Pu8h6CsJtbukPM9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 07:59:22PM +0800, Chen-Yu Tsai wrote:
> mmc1 is used to connect to the WiFi chip on the Hummingbird A31.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a=
31.dtsi
> index 92abea20b946..39d87a901b46 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -581,6 +581,14 @@
>  				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>  			};
> =20
> +			mmc1_pins_a: mmc1@0 {
> +				allwinner,pins =3D "PG0", "PG1", "PG2", "PG3",
> +						 "PG4", "PG5";
> +				allwinner,function =3D "mmc1";
> +				allwinner,drive =3D <2>;
> +				allwinner,pull =3D <0>;

You should use the defines here.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+Pu8h6CsJtbukPM9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/2KlAAoJEBx+YmzsjxAgyoMQALGlffY4CvM4PV46cUDBDuOu
TT1jqCQUwdqIsiVzXcg3dgdJDJgOdzfMaWU2gGKndv6GPtoZU4zkgEOvXDjjNmnf
xN9JGo9/ZJJqrNWUBHVzm/tPkuQX9Ormq4P0uTqZ++XsIISbV2UaDY3LTUNGULr2
K40wzClUEjFP+XDHGrowhzPVhSyUrXbX0YL0xhXbx1ps80HKcMgIDJsValO1WTo5
FjBDK4e+AtX3BMMfAnJ5m0iLx1vsFPiyfYZF5LyR9St9pdXznTUO7XCJpKj1kf9j
BmakG1E5BglkmEwTyJ8uAnStKPacraAyHZhZ0gqJWKC08ohJ2hpJb6bZDIo+zjXL
sVlhXyFTFapZsYpknCGmGJCygGloE7WYfYJmH+yVZkE92A/zR6UnMPD/JCYXSlCO
QHdRLT0GdalNOSI97BzYju6IG3hsGNVfVmcPHlA4mUwNJiHqwa1hlSom+s2MwaZP
n4dwbnq0FNmazAm7AIWuZM9ZsXqW87NG+PuBN9Dp63YjFNvVvg4rKw8ApT3Gh6UE
vm5U66HJrhMkt3oGacvu2zM5u+AYb+CrRgudp+ftTS2MHQuSNGpseu/rNaOISXRY
DuJHltho2pXqAtuIcin8uhQkRvmtBj0DwNn4oo/ppCSiDi09jfHgmqei+n9KzDKZ
6pZFcxytqmkj6l+byyz2
=+gyk
-----END PGP SIGNATURE-----

--+Pu8h6CsJtbukPM9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
