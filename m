Return-Path: <SRS0=cI+x=VC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from sauhun.de ([88.99.104.3]:53478 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfGESdC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 5 Jul 2019 14:33:02 -0400
Date: Fri, 5 Jul 2019 20:33:00 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: sun6i-p2wi: Fix the binding example
Message-ID: <20190705183300.GF4717@kunai>
References: <20190703095338.11266-1-maxime.ripard@bootlin.com>
 <20190703095338.11266-2-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Content-Disposition: inline
In-Reply-To: <20190703095338.11266-2-maxime.ripard@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2019 at 11:53:38AM +0200, Maxime Ripard wrote:
> Even though the binding claims that the frequency can go up to 6MHz, the
> common i2c binding sets a limit at 3MHz, which then triggers a warning.
>=20
> Since the only SoC that uses that bus uses a frequency of 100kHz, and that
> this bus hasn't been found in an SoC for something like 5 years, let's ju=
st
> fix the example to have a frequency within the acceptable range for i2c.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Applied to for-next, thanks!


--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0fl9wACgkQFA3kzBSg
Kbb05BAAphN8yqYnjQ4CiPIfWfCmJbbv5Y3lc7hSh8TNGBfRFa0xR64Z7JjnMuV2
lqSfEV/BnmP9X8LRd8oX7J17sNn8YuR9QNrPnMAzg369/qTdDUoc32BaXGVFSCd9
OdTYIKN8mbG9OrmFQPhbtQlxjEyPjjgSusIagNkvpExMIFtEfQDbxqNeu/kYAxxa
i0H3WxJ1WIw/d/kTeVKFwxODHA0zvsETxkZRgNw76fPwm5Yxg1+reDBNQ1XufUMY
G/xRtgW9eDcEXGd9W7i2OaSnpPYKuSMxC0I+DwI7WeGuYGt+cbJPawTGBTJtLElh
SQWciLXbGtgBnu8iGOQBHhDOdNEpo0zKF26ZmwTClewdyQz/woG3ibko0wL1kF7A
hHwOfUpK+kxP3fCMIotqxAGGQz8Rm5aZA6OQaqTgUx4ZdeUz3i/eCVGpb+LmuBSO
50vvXKfWaRE0r4CKk98MmRrKarv4QAUEdWa2pHo3COOR2g1R57PPOYxdewM8Lz3Z
jiFNXoe2+wlKEBrRXmegJJrDy1zgUzw/GyLtoiH4VaBKgrxAAJTjAsDdov06kYLS
a1dpRatayNrt6ej9TCQwv9vF33RWuqGCfjBt0KC9QV6KPviaUDPedA5DgExrABg5
D+DjY/idtbD+uhJA0fUHXCtdb2KzTZjnFGSTknhhTkjN4euP0p8=
=M5Ht
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--
