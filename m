From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/6] drm: sun4i: do cleanup if RGB output init fails
Date: Wed, 25 May 2016 14:38:08 +0200
Message-ID: <20160525123808.GE9232@lukather>
References: <1463500571-28970-1-git-send-email-wens@csie.org>
 <1463500571-28970-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uCPdOCrL+PnN2Vxy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463500571-28970-2-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org


--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 11:56:06PM +0800, Chen-Yu Tsai wrote:
> sun4i_rgb_init() can fail, which results in TCON failing to bind.
> In this case we need to do cleanup, specificly unregistering the
> dotclock, which is regmap based, and the regmap is registered as
> part of the sun4i_tcon_bind().
>=20
> Failing to do so results in a NULL pointer reference when the CCF
> tries to turn off unused clocks.
>=20
> Fixes: 29e57fab97fc ("drm: sun4i: Add RGB output")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--uCPdOCrL+PnN2Vxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZywAAoJEBx+YmzsjxAg4pIP/jNV7pbX0Onw8fn4ESoG89BX
D3jbxvFFRL+Cso1Wn/GeCmci+R2CAejnzsiYI+oasvGVtkdngdoCR8zmJDvMWtAk
oLg0+wWgUJVknEww5sEOuHEULkxBqu1V2fAP09Uvk2ykMRWkOqz7vIdQZ9MpNL4x
jTaq5Ts/7WUt4zJDAZUGMyMYjRT6RdC41scW5Y3uZZ3pXGSzzv5h6oF78coCO5EF
A0s3S+oqcZ32TCa57vj6uhzHr8lwO4TBfqCN+LhvWoFnDOXG67GYjtF7wSBfXfXp
M3ZD3SbvyQdfUFulFOKHshV9LbCwKd+OxSQ3grCyiMC+EloA+gqf84pbKiW73RLV
VKDMDJ72B+RPHxUwR29sew2Tjcae8GXNsJ08pBg9TCl+iuJ0ecV3OzgKj1uj1Lec
PBlCSUT0CL+hTsv5+38oBtDWaHiS3uuFeuwf0BS7E2y5sTSpt77NqB2pMKemReK8
kLW81jyLa6OmPqUkzDcNfcLowOyJrpaFJDcWDrVJGFpw/f9wh0OhDasfHWwwwXSH
VrgzN/97pcNkCWzwm/cKNq+n3AqRLYIKq6Vu41IgNH3BIauDilUOppEakFqyBQH/
qXeN3Mm8o27TfuAXqbSaY0B0/ugrdc5oRyh/DZofz1Cp+UmNLJQdkDHRf/3B1C9x
aLecWMWiGeMksKeHYpN4
=z4I7
-----END PGP SIGNATURE-----

--uCPdOCrL+PnN2Vxy--
