From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 14/15] ARM: dts: sun8i: a711: Reinstate the PMIC
 compatible
Date: Tue, 19 Dec 2017 09:57:11 +0100
Message-ID: <20171219085711.r7rh6qgnah4gsygr@flea.lan>
References: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
 <80711a93a5e49166a26ade747687d8ba4ef7a6f3.1512662253.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2012883644=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <80711a93a5e49166a26ade747687d8ba4ef7a6f3.1512662253.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, plaes@plaes.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org


--===============2012883644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4e2cdu3phwqdfw5d"
Content-Disposition: inline


--4e2cdu3phwqdfw5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2017 at 04:58:59PM +0100, Maxime Ripard wrote:
> When we added the regulator support in commit 90c5d7cdae64 ("ARM: dts:
> sun8i: a711: Add regulator support"), we also dropped the PMIC's
> compatible. Since it's not in the PMIC DTSI, unlike most other PMIC
> DTSI, it obviously wasn't probing anymore.
>=20
> Re-add it so that everything works again.
>=20
> Fixes: 90c5d7cdae64 ("ARM: dts: sun8i: a711: Add regulator support")
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied this one as a fix.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4e2cdu3phwqdfw5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo41GYACgkQ0rTAlCFN
r3TArQ/+MwWQCB+Opu1/s1Oymjw1RAKUNgwV7LI+OaVvDReI/N5ShIjbpeK3Ttii
KNq72WPtey+cXoj0Dkx7Ly489ZJanfHBrRTPDLTj+aclNb7+db4xGNJhvooZmehU
Iig6jAvyXWcWWyahU8I15pQm0lsEBsn6bsTZqitl/WAdeYqGgPVk4W+pFJ/eg8oQ
7i/sQU3uA35iNZAdESwzNQEZ+wmYDOALs/tpYSt3thf3sRDA8GEkWsAqrDZZMY7N
2RBKcZiBqbLATuNnUbxggXWGk1NbQocXPXlfVOOI4R+iQg74LQ2gcIdJNSuK6UOK
lAocj5YnsVuZGky5qFf/qc7glK3UP1HNhffynosRrZY614/cyITpcn8Geg9pqaKB
ZF1QzqtrlNqhLQ3V3b4QpQsBjPP4i39N3AYtpHU6ceMkhtA8RxzQNUISdEY5sJMY
jZQMm2FvaweemEz9V9vpZD14Hb+Hyc4T+3qe083zTsQgvyF2ZSz6nZkd3N6TKQb2
qgD1z9ZiCDqo9zrSoqL3mwF384mazp+tZcVeNIuEg2IxAQ2PjLbnxM31iTS4En4i
5ZjmPC18+mxc0pCqd3rSlEBdOys9gPVEb9n4L+A5xFy+r/SP6zm4Fv4xMEbFJbBZ
Nevghif/89TAV/LFhQmN5M/a1xie9MYA1xy/2Hz5DIaVGosTc7Y=
=+kt8
-----END PGP SIGNATURE-----

--4e2cdu3phwqdfw5d--

--===============2012883644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2012883644==--
