From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] regulator: Add coupled regulator
Date: Thu, 21 Jan 2016 16:28:02 +0000
Message-ID: <20160121162802.GL6588@sirena.org.uk>
References: <1452605842-9317-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452605842-9317-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160112143100.GA14628@rob-hp-laptop>
 <20160115085734.GG4581@lukather>
 <20160117000434.GB7774@rob-hp-laptop>
 <20160118162538.GH6588@sirena.org.uk>
 <20160121154649.GE3997@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="boHZdxlSbghjKFo0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160121154649.GE3997@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--boHZdxlSbghjKFo0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 21, 2016 at 04:46:49PM +0100, Maxime Ripard wrote:

> I guess a separate driver would make it easier to deal with cases like
> the one you suggested (shutting down when the load is going to be
> lower). I don't see how we could have a good DT representation of that
> if we're going to use lists.

We can have a driver regardless of what the DT looks like, it's a
question of how things get instantiated.

> Anyway, I'm fine with both approaches, just let me know what you
> prefer.

Without seeing an implementation of the lists it's hard to say.

--boHZdxlSbghjKFo0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWoQcRAAoJECTWi3JdVIfQ0WwH/ie8Jsrj02xCh+AvVoygbMRD
Kbxl5hORPDiEGOtoWawhkV3jXKJEoDoB3/8dt8sxupSTcjGyf4aP9r1aSbHWUUyp
7YHD2Jm0B/nbgKwy542iH5gGmnfkwrqAaH8Fe5v3Yj6adkVFImfCrngFPeKEmnuY
nYqsnbyydfT0y0M33f2t2RVMrQU+N3fAsuKD3Th3T8lIH/TAzVBxwpLm+pm5Y+fg
n3/qSo4v1gs0tecORc71pQHKWQ/lptjHpsY0UXn9hRPDjOLLVEEBC/HQ+E3Sd3cJ
R0Eg/PQx8EpfLwEc82tS1+NVrqKUtp5c09McB3kaLQEou6RXtKeg7v2tU9sW1Yw=
=EAMn
-----END PGP SIGNATURE-----

--boHZdxlSbghjKFo0--
