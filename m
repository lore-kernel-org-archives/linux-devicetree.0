Return-Path: <SRS0=LKAu=F5=ozlabs.org=dgibson@kernel.org>
Date: Wed, 7 Mar 2018 14:34:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH/RFC dtc 0/2] Drop unit addresses from overlay fragments
Message-ID: <20180307033450.GG3083@umbus.fritz.box>
References: <1519374917-30171-1-git-send-email-geert+renesas@glider.be>
 <20180305064013.GM2650@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kjpMrWxdCilgNbo1"
Content-Disposition: inline
In-Reply-To: <20180305064013.GM2650@umbus.fritz.box>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jon Loeliger <jdl@jdl.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--kjpMrWxdCilgNbo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 05, 2018 at 05:40:13PM +1100, David Gibson wrote:
> On Fri, Feb 23, 2018 at 09:35:15AM +0100, Geert Uytterhoeven wrote:
> > 	Hi all,
> >=20
> > Using "fragment@N" as node name for overlay fragments violates unit
> > address rules:
> >=20
> >     <stdout>: Warning (unit_address_vs_reg): Node /fragment@0 has a uni=
t name, but no reg property
>=20
> Hm, regardless of this patch, that's really a bug in the checks not to
> handle overlays as a different case.
>=20
> The quick fix would be to just suppress that check if an __overlay__
> subnode exists.  THe more ambitious approach would be to actually
> parse things that look like overlays into their components and apply
> checks separately to each fragment (except for ones that don't make
> sense except on a fully resolved tree).  I had plans for that, but am
> unlikely to get time to work on it any time soon.

Fwiw, I've now made such a change to the checks.  However, I think you
can still get a similar problem in the generated __local_fixups__ node
for similar reasons.  That one's a bit harder to check.

>=20
> > This patch series (for dtc) fixes:
> >   1. generation of node names when using overlay sugar syntax,
> >   2. all documentation and tests.
> >=20
> > If this is accepted, I'll send similar patches for Linux.
> >=20
> > Note that I've been using "fragment-N" in hand-written DT overlays for
> > years, so this is known to work fine with Linux.
>=20
> Existing tools expecting the @ would be my only concern with this.
> You've check Linux is ok, and I've checked libfdt is ok too.  I'm not
> really confident if that's enough to call it everything we care about.
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kjpMrWxdCilgNbo1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqfXdoACgkQbDjKyiDZ
s5L8kxAAlFGUdaI6O5dH/f15uLYWiLMF49HyTECjGdrLjAXT3S/PV2XFwEmMTiRT
YIMGXL5k+uxqjPsYxaz5dSiNdKjptMwhEtUoWE+3JDnIUt55YsfFQ79Xq6TrNEJJ
jb9llXZJ4s7ivZMo2PwAsp0Hab2sBJL8kgFurcemIIMVIHr5FHuFxkIahtYTlf5q
mkj9i6dtB8vwCblsQP0dEXQI9aJfQdXoyX2J4jjN9LsA3jib/SgTr4unaJaumNB1
Kkq+aLY2MI7AezH8NrzhX+MPfQaVpsTzcu04ostEhQRTVPb3Hi7FnMo9Lc09uEcq
xHXsr0Qj1B9JgDSErEC+YqlZpUIblEnBe93PB28SXie9R/wEx0W/GLtv5Poyj02E
wSmUIlSJ0pcJ20aAIcHTajmMqpUGIkakKZj5q8P7WjGLymqT93sun2UjyNuAZB82
M3+VU1sRFGbxRbwobSq7c9YOU6zK0vYTdFELhTAKzsnC+RfnxChEm1KHKzimSnPH
ymhsl81Zf6/g9QINIrq1aMCV3FaadV+sFdynTqT/VxGEVNjkI7EUds4tjrjzApfG
ASBf21mH8bTa3uTlHtuLrcQc6IEKsJZJkmTl5EtvaiC4z8F3oksX2sEmD8pNI4H0
s6TCKkEbNvHvU2FQ1knKvxNHXRE33T5m+DvRpj9fXwmtrp9EMFk=
=yJay
-----END PGP SIGNATURE-----

--kjpMrWxdCilgNbo1--
