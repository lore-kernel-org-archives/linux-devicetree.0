From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/8] ARM: dts: sun6i: Fix endpoint IDs in second display
 pipeline
Date: Fri, 8 Sep 2017 15:29:32 +0200
Message-ID: <20170908132932.rfz4hxab4tgntioo@flea.lan>
References: <20170908075016.18657-1-wens@csie.org>
 <20170908075016.18657-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1077176311=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170908075016.18657-2-wens@csie.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1077176311==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="boiord233u4nq2qs"
Content-Disposition: inline


--boiord233u4nq2qs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 08, 2017 at 03:50:09PM +0800, Chen-Yu Tsai wrote:
> When the second display pipeline device nodes for the A31/A31s were
> added, it was not known that the TCONs could (through either DRCs)
> select either backend as their input. Thus in the endpoints connecting
> these components together, the endpoint IDs were set to 0, while in
> fact they should have been set to 1.
>=20
> Fixes: 9a26882a7378 ("ARM: dts: sun6i: Add second display pipeline device
> 		      nodes")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Should we CC stable on this one?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--boiord233u4nq2qs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZsps8AAoJEBx+YmzsjxAgl4MQAIAf8dVZzAp+cCXKl2lSzf/B
7gz/mmr4P1SGLfHSjDPIKLmef+HiUyHd44EKLVI6yxe+LW1U8iJC4T4dIL+r8HEU
qgVJ91U3LxxAaA/A/2TRwcoiElkt5V58oa7NC/LLMoHK2+TftqXx64bjSMMbmmqI
8IxIb34soEQkIasIk//QDFYmSTh6HIlPQeY4y1J4yavESwy/MtcoyQpeQGrwn+r3
MGkslho4w4AgA5sZI8Lvyb7Rp4eopvufSIvy85nI0SD0XYGBx1mXJUL6+RgC9ijl
46kSy1VUSAihOSGlFQtsP5BSWRxH+lhXvL1CaxEiIB/tWtaB0PXXXUC+/9WkbvGn
3jIq8Wp2ftEzNgJbKn90Ei8VeO8wPlS0pbDuOX0EPsgoRyATQaMWoW6TvHQJAgvt
T21LP/JtKn6Cp74fJwkloG95Ha3+Tbr9ObuIq0Umz2DW7S6Bb/WnRW+Y5ULkFhqJ
u37cS+qOX8kd3k4MI7Ull1NhSDCauek7Y6KR3bxhZjwixsAm9tvhpx2KITxvMxAE
8HFQftVp2mxMMRGcl0NG+3V85L31ktFU+FjPM2hid7MXkwQ6gBGd8zHEfodkh8zq
Zap64ys7kh1+huTWZSHQbJQiH20ZJYI/eXEJtKX4QYHbyYb4bk99HaTTP2A3h7aD
JcklB2qHy0DSnk0vVwUy
=NfdT
-----END PGP SIGNATURE-----

--boiord233u4nq2qs--

--===============1077176311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1077176311==--
