From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] Regulator: mc34708: Add DT binding documentation
Date: Fri, 1 May 2015 15:03:21 +0100
Message-ID: <20150501140321.GZ22845@sirena.org.uk>
References: <20150428141736.16243.57292.stgit@localhost>
 <20150428141738.16243.18377.stgit@localhost>
 <1345809430.776937.1430476461635.JavaMail.open-xchange@oxbaltgw07.schlund.de>
 <20150501110123.GU22845@sirena.org.uk>
 <1816610654.762513.1430483624334.JavaMail.open-xchange@oxbaltgw08.schlund.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cj2v4dTZyK4qpVAb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1816610654.762513.1430483624334.JavaMail.open-xchange@oxbaltgw08.schlund.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Martin Fuzzey <mfuzzey@parkeon.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--cj2v4dTZyK4qpVAb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 02:33:44PM +0200, Stefan Wahren wrote:
> > Mark Brown <broonie@kernel.org> hat am 1. Mai 2015 um 13:01 geschrieben:

> > On Fri, May 01, 2015 at 12:34:21PM +0200, Stefan Wahren wrote:

> > > a commit message would be nice and the subject should specify dt-bind=
ings
> > > instead of regulator subsystem.

> > No, it shouldn't. DT bindings for a subsystem go through the subsystem
> > and the subsystem maintainer needs to see them to read them.

> sorry for my bad expressing.=20

> I tought the subject line should be something like:

> DT: add binding documentation for mc34708 regulator

No, it shouldn't.  The subject line should start "regulator: " like all
other regulator commits.

--cj2v4dTZyK4qpVAb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVQ4eoAAoJECTWi3JdVIfQVtMH/j6LPvdmJ8rJ7H0IXN6uOhNf
zRKTwN1DZiWxs47Y2kNFKXOJQQjZDxZxafAIYcAUIpu4Q9PG2pQrAEpgiGs4MaL0
UcNgD43bUOaeIxABpyE2NCOxxCqVREveGnSWMO/ANq3PpDPrAG9BKI0a9cp76LfL
goaYriuOK9fnnZ4miv/WdAnZc0deWl7IL2H3JvE1POThK6m8Pr7gF1hjmBOK1sj2
C5uYRuxrIoVt0ZtTOUQJWs/AH1rOUzXVryAd8f4fvZsyVDZXXh/Ps4Al/M/rudyO
3Q5w8crBcigl8RU4kpzf611DbwODKRtGVbVV7CgvYSmDqszLSEdVSTA5Dq6B9Yw=
=u0ug
-----END PGP SIGNATURE-----

--cj2v4dTZyK4qpVAb--
