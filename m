From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: Add coupled regulator
Date: Fri, 5 Feb 2016 15:33:28 +0100
Message-ID: <20160205143328.GD31506@lukather>
References: <1452605842-9317-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452605842-9317-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160112143100.GA14628@rob-hp-laptop>
 <20160115085734.GG4581@lukather>
 <20160117000434.GB7774@rob-hp-laptop>
 <20160118162538.GH6588@sirena.org.uk>
 <20160121154649.GE3997@lukather>
 <20160121162802.GL6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160121162802.GL6588-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, Jan 21, 2016 at 04:28:02PM +0000, Mark Brown wrote:
> On Thu, Jan 21, 2016 at 04:46:49PM +0100, Maxime Ripard wrote:
>=20
> > I guess a separate driver would make it easier to deal with cases like
> > the one you suggested (shutting down when the load is going to be
> > lower). I don't see how we could have a good DT representation of that
> > if we're going to use lists.
>=20
> We can have a driver regardless of what the DT looks like, it's a
> question of how things get instantiated.
>=20
> > Anyway, I'm fine with both approaches, just let me know what you
> > prefer.
>=20
> Without seeing an implementation of the lists it's hard to say.

Just to make sure we're on the same page: you want to keep the
regulator, but instead of giving the parent through vinX-supplies
properties, you want to have a single *-supply property, with a list
of regulators, right?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWtLK4AAoJEBx+YmzsjxAguNoQALmfXhbIgg1W/Xw3LZgD4nrZ
R751Jt56rA/0dIwaNBQE3/lbFu4VSgeB4Htl6avk4aLhic+QRwB8N2VmtW5UA0Tx
T6OcGJmJ5MbY/36xexX+2iQodWB2xedNEzLNKlfq22ZtVXnF3otKRD6eBL0Zvs5U
cRYVAT18+UmAYAkpTJZJCSly5Mn+WqagFCt2Ry8+6liUukFHXMmbvgHGRRBOuDHi
QcBa9bYoOzIlGJLSba9UU2fUZFusYI+pDcf+iNdZCL6cfw90ZtTnYANKwjeP7XPm
sKXTrvvmlHJbfFRLpFEQ9QIgbsbstH3clZcMK8lbJw6DYU815SsDkKjfXWcJnOkR
jqBS/Pr8cue++/167WlueBByppbKvGyki33eyFDA6G0zbl3Bsgu8A88Nje95dxoi
62GiZM29PCSyvfldRAWFTB/HkkadSTd4RmRO/c2YSbRwrmykTANYSpbzSGXWxvCJ
B4cC/fRVedboeQJmQL25H0ZldlaVFvpF7sxAF8oxKOuBFcT8K7QyfsW65l+8IbYu
CJC9dUgPbmJ2YkpauiG5oZpbD8w1cTYQt7E78V42DLVq3uQIzEn8Emaf4Vnnm4HP
h1IVy+gzp2VfaBziLKFROjF3vUUWhwy0oZe7MFMBDVYrh/P3EHZBZNc+KySP4Xm8
0pWUvNjvhb2C7yYMy8zB
=5OpA
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
