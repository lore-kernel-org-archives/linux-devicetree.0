Return-Path: <SRS0=gSIt=VA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:39126 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfGCMCO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jul 2019 08:02:14 -0400
Date: Wed, 3 Jul 2019 13:02:11 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] dt-bindings: ASoC: tlv320aic32x4: Fix property name
Message-ID: <20190703120211.GW2793@sirena.org.uk>
References: <a1af77a8b6d6832f888e6a55f5732982.squirrel@mail.missinglinkelectronics.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FmwJltL8yKUx7YXQ"
Content-Disposition: inline
In-Reply-To: <a1af77a8b6d6832f888e6a55f5732982.squirrel@mail.missinglinkelectronics.com>
Sender: devicetree-owner@vger.kernel.org
To: David Epping <david.epping@missinglinkelectronics.com>
Cc: devicetree@vger.kernel.org, trivial@kernel.org
List-ID: <devicetree@vger.kernel.org>


--FmwJltL8yKUx7YXQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 02:57:50PM +0200, David Epping wrote:
> From: David Epping <david.epping@missinglinkelectronics.com>
>=20
> dt-bindings: ASoC: tlv320aic32x4: Fix property name
>=20
> The 'supply' string is a suffix to the actual supply name, not a prefix.
> Also extend the example section with required supply properties.

This doesn't apply against current code, please check and resend.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--FmwJltL8yKUx7YXQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0cmUIACgkQJNaLcl1U
h9Bh8wf/Q/DIcXAFBhDzQeByWtuCLjHtWs5ACiWJEb46vUSQ7d0j7zgBOZYgQAr4
I4lzBV+vA/27UlkmC/+zdfC9zu4fR94dkH6zZA4MLAq6WW5BPUKLTvmsZ5R8+FXS
Eenr/PpdA5/yWGSojfBpLU8tYnQbNWm2hzRqhfkygcI/IXT42LwaWD1PgcT77pzS
UiGNnTUE5yso5+P9Tvo8RgpYHYeqWYFM/cVengNB1Bi6skH1bOFd6KnbPknMEXVt
m6KGwyicBj5Y3YqZs5DIN5Tsp1+5NmbxkYUbc8kUih1L2AVHtgyqBTSmpujhFtI5
PFwIIeLfxuPEb1Nd8TDDNW1vcrqCMA==
=2HLO
-----END PGP SIGNATURE-----

--FmwJltL8yKUx7YXQ--
