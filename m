From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 6/8] drm/panel: simple: Add support for the LeMaker
 BL035-RGB-002 3.5" LCD
Date: Mon, 28 Jan 2019 17:01:08 +0100
Message-ID: <20190128160108.GF26200@ulmo>
References: <20181107181843.27628-1-contact@paulk.fr>
 <20181107181843.27628-7-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0060589083=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181107181843.27628-7-contact@paulk.fr>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <contact@paulk.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mark Van den Borre <mark@fosdem.org>, Gerry Demaret <gerry@fosdem.org>, David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0060589083==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Content-Disposition: inline


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 07, 2018 at 07:18:41PM +0100, Paul Kocialkowski wrote:
> This adds support for the 3.5" LCD panel from LeMaker, sold for use with
> BananaPi boards. It comes with a 24-bit RGB888 parallel interface and
> requires an active-low DE signal
>=20
> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Applied to drm-misc-next, thanks.

Thierry

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxPJ0QACgkQ3SOs138+
s6G5CQ//dIsEbrfTLsm7zGTb7L5zbM+zjfqGl43qCtTF8Y0EWBHIgW5fDctrzXlO
pddXxyZiQVGDu4dJv1UXJjLVfSOIVRQW0K1XjnR7d0Gq4o8juSkdO8czCphmZbUM
fDf3F37dIXE0w4ehW4OClzVnoC1EBGSHCLBiVg+gC/viu5mBpN+8WMLM0nq+mwA2
7Yl9yiD6CTa9E8EqM9NbmJN1QoXM8RFIESs9xgRI7Yj4Fu7lTltumYGbu6xNEO2M
qmSlUrJtMWNLHj+XSuxdo8bbZzZIL4Q9sj6oeEDwYUmPuVurzhfZuG3AhwM7t4XD
ropeE/C7ihGTmLIHfuDd8W6nC87kCkk32lGsIQGyQmWEoByDzNhcLccq3pk6hCxb
yIOjhnz/68LtIzxrGVNCbBWBkDXqrYdt74Qo9YJV9+3meKTZyNnggHHWwi5NL1p3
lZDWcqhvvGl27ZB++VvNNGrrxcqyNdWkdlaNV/xwMI0tSvpiq4u1spjf/xjMa+L2
9jdpCBo4LKhGA1IG/70dnH0PwKKEWJVWYFjLUiWODW07Kwelrc77FO8Pdmc9N/PZ
ow3moJNaWFqMDHdaorSWGOLF/Y4HWOK8+3ppxCYQARtn+hCVs9w4EzyrAhuW0Clz
dlUhtndKOchqsoMoosmGoWiPrfNIvA3hgQ5WWCFvfzu9AsAGA5E=
=Ujym
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--

--===============0060589083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0060589083==--
