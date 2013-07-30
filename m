Return-Path: <devicetree-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:40564 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751480Ab3G3GKV (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Tue, 30 Jul 2013 02:10:21 -0400
Date: Tue, 30 Jul 2013 16:10:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] of: add vendor prefix for Altera Corp.
Message-ID: <20130730061028.GM29970@voom.fritz.box>
References: <1374867540-9477-1-git-send-email-dinguyen@altera.com>
 <51F2D686.4090104@wwwdotorg.org>
 <20130728044125.60F3A3E08FE@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GoZzJvFfKjxI3RhA"
Content-Disposition: inline
In-Reply-To: <20130728044125.60F3A3E08FE@localhost>
Sender: devicetree-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, dinguyen@altera.com, dinh.linux@gmail.com, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-ID: <devicetree@vger.kernel.org>


--GoZzJvFfKjxI3RhA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2013 at 10:41:25PM -0600, Grant Likely wrote:
> On Fri, 26 Jul 2013 14:05:26 -0600, Stephen Warren <swarren@wwwdotorg.org=
> wrote:
> > On 07/26/2013 01:39 PM, dinguyen@altera.com wrote:
> >=20
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> >=20
> > > +altr	Altera Corp.
> >=20
> > In the context of Marvel(?) wanting to change between a longer and
> > stock-ticker vendor name, there was some discussion re: whether we had
> > decided not to use stock tickers any more. Is there still consensus that
> > we should? If so, I have no problem with this patch, but I wanted to
> > make sure everyone was on the same page.
>=20
> Stock ticker names are just fine by me. But once set they should not
> change.

The old recommendation from OF working group was that vendor prefixes
could be either ticker symbols in all caps (e.g. "AAPL"), or some
other string in lower case.

We've mostly only used the second option.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GoZzJvFfKjxI3RhA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iEYEARECAAYFAlH3WNQACgkQaILKxv3ab8Y8pgCeLCNCxWIYpBhwiYrdM4qMh6NT
XZEAmwSsKTq/1pKlW2LN6p60LhGLMDLA
=u1Ue
-----END PGP SIGNATURE-----

--GoZzJvFfKjxI3RhA--
