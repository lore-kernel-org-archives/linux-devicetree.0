From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 04/11] drm/sun4i: Add support for A64 mixers
Date: Wed, 5 Sep 2018 09:21:04 +0200
Message-ID: <20180905072104.n2v54om6lc4hylf4@flea>
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-5-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0668443172=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180904044053.15425-5-icenowy@aosc.io>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0668443172==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gqzvseqdskkuquks"
Content-Disposition: inline


--gqzvseqdskkuquks
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 12:40:46PM +0800, Icenowy Zheng wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
>=20
> Mixers in Allwinner have similar capabilities as others SoCs with DE2.
>=20
> Add support for them.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> [Icenowy: Add mixer1]
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--gqzvseqdskkuquks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluPg98ACgkQ0rTAlCFN
r3TKAQ//ZtxhtHf+V1D9/0wEn+/6lO6xD62DDNIAT0l7KUHEx+Sz7EWFm5kyuGX9
kMmjV1TqKK0a35pMaiH/HZcgxr7vCtK+JkgKKy30rx2NCeszVHm5GVMXBTzHsPqF
saDB2ULWRbcfYKE/arPljmj7cI4Qjk7z/kVwnedvwLi4NcNWd4M27FmhzDFnH+wU
Mq/fvzCMbUb8Acsr7TyY5jgO9c/O4GXV/W5tTKGANo+YuU6NJBZPjJxWl/YLH5qd
e48CdfOIMOpdvGXWXRj4PMUXft0eR/JtzKXp9FqvogdbgGRXuqBFawmv1Vv6QlX6
ZRmqxh7LGcV+dDyt6HG/NE/Aljvo9Bqu1azCWG+RXWKeYnKaQ5kQhG6ALwMSXz32
4na6PyLbN9T3ZYrB6rNMqBK6PpGNcD+hEEqMPHsul9wk6NY8q3m8QW+6p/AuGbqZ
HP1QEQrzNynTWE51C1MGBdhjBGlj920jc687g1T5CgW+H7AfIFeD8FxDHI8BbEn7
OrwQn2q6HXg+NDsI8QA/pqLNZI3QbTCTXLsmRDNX2rFFiOTmfEdg0LiyNeAMMZKJ
7ftw+zkMPIYwUbMiAxD3+cnIBTW7CcluFyX0kG+q6ejfgV1AI1P7P/p00zskTeTH
ShZ2hsblcKo78DLGHRF7Nw6TRnAwMhfHjtobMOcOGfQFz4NO+Mc=
=arh9
-----END PGP SIGNATURE-----

--gqzvseqdskkuquks--

--===============0668443172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0668443172==--
