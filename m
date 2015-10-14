From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Wed, 14 Oct 2015 14:09:20 +0100
Message-ID: <20151014130920.GW14956@sirena.org.uk>
References: <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1>
 <20151013151252.GH14956@sirena.org.uk>
 <20151014072812.GE32409@x1>
 <20151014094903.GP14956@sirena.org.uk>
 <20151014123014.GJ32409@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1RhGCd1AsoFHGRHc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151014123014.GJ32409@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org


--1RhGCd1AsoFHGRHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 01:30:14PM +0100, Lee Jones wrote:
> On Wed, 14 Oct 2015, Mark Brown wrote:

> > > Not necessarily _your_ review.  Just someone, other than the
> > > submitter, who I trust and knows about this stuff.  You just happen=
=20
> > > to tick those boxes this time.  Cross pollination and knowledge shari=
ng
> > > is one of the characteristics of MLs which I'm particularly proud of.

> > That was what it read like.

=2E..

> > So, a more specific question would have helped - just a general "any
> > thoughts" type question isn't very clear.

> To both comments -- this is how I phrased it:

> "I either need an Ack from the DT folks, or at least someone who knows
> about this stuff.  Mark perhaps."

I'd have expected something that says why you're looking for this -
something saying what you were unclear on, something more like "It seems
like there's an awful lot of properties for something that just checks
if a jack".  From the above (especially with the request for the DT
people to review) it seems like more just a review because there's DT
properties.

--1RhGCd1AsoFHGRHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWHlP/AAoJECTWi3JdVIfQSxQH/RRG//u+IYqWa+1cQXCKTH7/
yyZ+Rr/MlT9IObLMTKQhu+BjVDJDgfe6ZOhSMTEmLIGkSRrS1z+7YWNrkZFfjHGN
JlDa/H9y7BMwuxEu8Sz8canZdxoPtXV67ihjgUXUzs2bZNnzwQgWMzUG6zzIxGPv
+zm8mwu6RrhIvsh2GBECR2Ojqja4B/r7+RE+CCazPxE+vnmYAwye3783mUr/207S
JnFkQvbO/sbo2NR0Z76m9lTEfALVURHrwZ2e65ezSBfB+SvEj3ugLCxL4QqxpwH9
6QhcW1cHA9DB6gfOfIh+ZsvePvb98z/QPIpOjIbGTYXCCC0pvPFa3uUaafxCR6k=
=iX/a
-----END PGP SIGNATURE-----

--1RhGCd1AsoFHGRHc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
