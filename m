From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Regulator: Questions about constraints
Date: Mon, 6 Oct 2014 19:41:19 +0100
Message-ID: <20141006184119.GS4609@sirena.org.uk>
References: <1486422791.288728.1412617735622.JavaMail.open-xchange@oxbaltgw54.schlund.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BuGwuXnZwGGQ9GEc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486422791.288728.1412617735622.JavaMail.open-xchange-h4m1HHXQYNHPhFzx6VT8CsgmgJlYmuWJ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--BuGwuXnZwGGQ9GEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 06, 2014 at 07:48:55PM +0200, Stefan Wahren wrote:

> Should a regulator driver rely on DT regulator constraints or not?

> In case the constraints are not set by DT, what is the recommend behavior of a
> regulator driver?

The regulator driver should just pass any constraints it gets to the
core, it shouldn't look at them or care if there are none.

--BuGwuXnZwGGQ9GEc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUMuJOAAoJECTWi3JdVIfQkQwH/0fXU86EJFCGRkVuDFrJy0+I
r6UqrZgV1sX+1EPBSG96AABKYNrXKyP81cFRKImsO9AEu4JoD1vWZnPKoyaUH30Z
kAZqkGo67s2V5G1f0FwiZB/DBDj/W3jQ9LYL7X5GtnCZQnkkPBJOLtqXVsnDfqNd
EjEF/eDTcJJnhWqdoaKCuqCTRjgNBk4rnOuBXCjmoKx3Xlh8L1n6yXRH210vi7Fg
JspjAVvnd5JDPyk2WNm+VUoGQOGFBq/GzZBym5MNbEgbN2YFDglF2Ium+2VMQG0d
MKbK9S8sC3wYTdctX97ryoBDJwtEds27zM4x419Bdb0uV3QtOhP+iqDGx2gI2Tg=
=FBJP
-----END PGP SIGNATURE-----

--BuGwuXnZwGGQ9GEc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
