From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 resend] arm: dts: sun7i-a20-bananapi: name the GPIO
 lines
Date: Thu, 4 May 2017 16:56:57 +0200
Message-ID: <20170504145657.yzbehfov2rgeqn5g@lukather>
References: <CACRpkdZcnJ1eCNW4ZF_A4zbeCt3JcAuw-1meB_Pn7ctMy99B_g@mail.gmail.com>
 <1493795360-18629-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sosrdgjsfqepwsl2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493795360-18629-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sosrdgjsfqepwsl2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 09:09:20AM +0200, Oleksij Rempel wrote:
> This names the GPIO lines on the Banana Pi board in accordance with
> the A20_Banana_Pi v1.4 Specification.
>=20
> This will make these line names reflect through to userspace
> so that they can easily be identified and used with the new
> character device ABI.
>=20
> Some care has been taken to name all lines, not just those used
> by the external connectors, also lines that are muxed into some
> other function than GPIO: these are named "[FOO]" so that users
> can see with lsgpio what all lines are used for.
>=20
> Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 60 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 60 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts=
/sun7i-a20-bananapi.dts
> index 91f2e5f..5b3e0ee 100644
> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> @@ -178,6 +178,66 @@
>  };
> =20
>  &pio {
> +	/*
> +	 * Legend: proper name =3D the GPIO line is used as GPIO

I'm not convinced that a legend here is helpful in any way. No end
user is going to even search for it here.

> +	 *         NC =3D not connected (not routed from the SoC)

Judging from the binding documentation, this should be the same than
"".

> +	 *         "[PER]" =3D pin is muxed for peripheral (not GPIO)

We don't need the brackets. You have no guarantee that it is actually
muxed, and will need to get that info from somewhere else either
way. This is also not a syntax that is in the generic binding
definition.

> +	 *         "" =3D no idea, schematic doesn't say, could be
> +	 *              unrouted (not connected to any external pin)
> +	 *         LSEC =3D Low Speed External Connector
> +	 *         HSEC =3D High Speed External Connector

And both of those are not used.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sosrdgjsfqepwsl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZC0E1AAoJEBx+YmzsjxAgbFsQALeO+Nyv1C9dnVT3EJBZSxBH
M2Wc3d5wyEAlUhhFuGJi7fIwlT7hZMLu39lJQiSWoUSRaE5gJ/uNJCH4jBcGp9u5
lR6NKOAmi17cgFUFCh1dFn4IEw2VdLhA4drW0S4v1lkb2JZBhWXPdjj6XFl4+emO
gEckHC2iwB7VEor2VljgisjwejOI6fEAl3PowVuAtW7j22zMbWNkHD9mniCVZqb/
vjxzD0KzyNL0vM++jOj1E8TRrjLguoHHkkFSVJCxJxek8/xZLZo3/wO63tULxUmx
unW23L9E+EMjt1TGvsbg5IbpIXXYj0dQ0peyWuEb6o+oc1DcYJ+w4IR0O+R3Gp50
fD2HfcbOFisb6+nwKqEMGBy3OseJgaDaKVd9H/Ccm4Zdca/xq9gZ6ioJ5C7DXp8a
5OFzz3g58Am0UpDewaLO3qim3Cw0/uvxN8kGAGmxhqltIR8ExtlDE92LbV6eEYXP
fKdByoLoabrB211+OHczOIRSy9XKTGR6qqspU7kA6Q5IrhFsHJa2/8e4NZxk3OAF
VyeNBO5cYAbdkBUANbjePtwLGnyt9qNCFKTObj+N/Opk8ZT13munVUVw2NEq+z1p
wDmgmiu3FE/QTU/suEhiH3ql00ePnRmPgv2SCaLcKw4yNzl5eb4dwzEBMVmbgAe2
8wtHHt5BzbtytojhjpH3
=WZKP
-----END PGP SIGNATURE-----

--sosrdgjsfqepwsl2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
