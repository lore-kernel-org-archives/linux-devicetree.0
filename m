From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Enable power supplies on
 A20-OLinuxIno-Micro
Date: Wed, 30 Aug 2017 16:40:54 +0200
Message-ID: <20170830144054.36m6wfilwdztcfij@flea.lan>
References: <20170829170810.1302-1-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mpfurkajycglapac"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170829170810.1302-1-harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mpfurkajycglapac
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2017 at 07:08:10PM +0200, Harald Geyer wrote:
> The axp209.dtsi defines nodes for ac, usb and battery supplies for a
> while now. This patch enables these nodes for the A20-Olinuxino-Micro,
> which has connectors for all three of them.
>=20
> The patch was run-tested against linux-next-20170825.
>=20
> Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
> ---
> Note: I guess the same change is good for the olinuxino lime boards too.
> However I don't have such boards to test, so I don't formally submit a
> patch for them.
>=20
>  arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/b=
oot/dts/sun7i-a20-olinuxino-micro.dts
> index 0b7403e..64c993a 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
> @@ -256,6 +256,18 @@
> =20
>  #include "axp209.dtsi"
> =20
> +&ac_power_supply {
> +	status =3D "okay";
> +};
> +
> +&battery_power_supply {
> +	status =3D "okay";
> +};
> +
> +&usb_power_supply {
> +	status =3D "okay";
> +};
> +

We usually try to sort the nodes per alphabetical order (even though
it's a bit difficult for the battery and AC-IN power supplies).

I've moved the usb_power_supply node a bit below, where it belongs,
and it will be part of 4.15.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mpfurkajycglapac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZps52AAoJEBx+YmzsjxAgOkIQAK2Y218uhwOEMH+N+e+en5Ea
PF3JulrqKfcgI+EKd30+a5zPj0Q/bEAPE6QO4L/SKHbdBhyO8lOTsuxx33M8QvkQ
XZa2XJDdOb3+QbZGkY3T5b4Bh9+jnvFmYo2WXl4YXi7c9JMnO4XOGYinCSWXO1N6
Kjq+u0pq7/O4uPQspYLGYGC+mgNZHxTpJAxa5Kd4/9KaIf34bCjpRFIia02ik+ct
IqdwGrhEL1L3sr5LlwJkC0hWuNbwmrDS/wPrxDiqOZX5NM/lFr9gLTk8tg4XoLZG
J8H2gEVAF5LXDaMQsRvzJ9VYp/7c9jcWbiiSsir+6ubp1sIuYOr5w2YDNfFLYDXO
1dh1Cndsl+TNw1zJYvn8vP14yG6WYxZQ3nHZf8TM7BQQTKB6vdO5kjUznnG72WNF
HYvJaq5F4vKwgw/s5FkURU0oqgnGFTs0pYUNwk15tEAeY4pGnnhCrgo/6EuKFrW8
Sf8ML34rGq/YtgbVgBj6ZNxs4K0toUCIHRrfDVYvy2LI3cLmyuanq3yiK3wNU0+g
Z3kBU6CEyvZGky/3AfPFnt3bn/rvAJrSieNkDXBegAmv7ez3ybils8rLPrtK8TWM
O6INLh8AoqhxaSFqT2mjse4SxPnGR/BXEOP+0Wpu/RQjP73ipaLpCb6F8K3KhcSA
H03ncprSRQL7OnLkwDtA
=oUYn
-----END PGP SIGNATURE-----

--mpfurkajycglapac--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
