From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Question about fixed regulator DT properties
Date: Tue, 25 Nov 2014 12:17:49 +0000
Message-ID: <20141125121749.GV7712@sirena.org.uk>
References: <546B5EF9.3080102@mentor.com>
 <546CAB49.8030103@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GkP4R6qzw9SWbMoL"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <546CAB49.8030103-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GkP4R6qzw9SWbMoL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 04:38:01PM +0200, Vladimir Zapolskiy wrote:
> Hello Mark,
>=20
> On 18.11.2014 17:00, Vladimir Zapolskiy wrote:

Your mail is really quite long and all in quotes which makes it hard to
follow, brevity is really helpful to readers.

> > | regulator-boot-on | enable-active-high | GPIO polarity | GPIO output |
> > +-------------------+--------------------+---------------+-------------+
> > |        no         |         yes        |  active high  |    low      |
> > |        no         |          no        |  active low   |   high      |

> > I'd rather think that both resulting GPIO outputs are incorrect or
> > better to say do not correspond to my perception of "regulator-boot-on"
> > and "enable-active-high" DTS properties described in the documentation,
> > however above "enable-active-high" and actual GPIO polarity are the same
> > (when they are not, it is another open topic for discussion).

What you're saying seems sensible.

> > Should documentation be updated to reflect "regulator-boot-on" role that
> > a regulator is re-enabled by the kernel?

I'm confused about this.  That's the sole purpose of the flag and as far
as I can tell it's what the documentation says.

> > Should "enable-active-high" be replaced by getting GPIO flags directly?

Probably makes sense, it predates those flags by quite some time.

--GkP4R6qzw9SWbMoL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUdHNtAAoJECTWi3JdVIfQb1oH/AsnpwoEhS5tk5UMF7HYZphB
04+FG7LtSNoDPuY+mJD37PIpivewQsg1gW3yYzxTvHf5H+7iTS5rDeBoTvsuj/+b
r+5AsBc0RyiUOSlOxDa1B22KpiJ0AuJZfh0FZ+fYxx+nuz0KplfYWaZqVc4zYZI1
RMVpU/GhDTkxYM1o4xr70XlEVE3aq5Sj8zIxOGo2rarnsidQEvvkQl+kHgyOxLjQ
upCeFrwTVi2la/vrXlC0O3YFgqG+7knyvJo2R/igx78+nlFOZQiDikeXPtG/U+ui
neFrzPKBCk9iWNJxUXpU0CuFJbT+fKOM8ukvCu5upghwnI3sfRGW4vdxqY+JcYA=
=lvs6
-----END PGP SIGNATURE-----

--GkP4R6qzw9SWbMoL--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
