From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v8 0/9] Initial Allwinner Display Engine 2.0 Support
Date: Wed, 17 May 2017 19:37:39 +0200
Message-ID: <20170517173739.c7mxj6gr2buhaoes@flea.home>
References: <20170517144725.3463-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0273926752=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170517144725.3463-1-icenowy@aosc.io>
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
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0273926752==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6dlbfpq3n2or3v5k"
Content-Disposition: inline


--6dlbfpq3n2or3v5k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2017 at 10:47:16PM +0800, Icenowy Zheng wrote:
> This patchset is the initial patchset for Allwinner DE2 support.
>=20
> As the DE2 CCU support is already applied, this patchset now contains
> only DRM changes and device tree changes.=20
>=20
> The SoC used to develop this patchset is V3s, as V3s is the simplest
> one of the SoCs that have DE2.
>=20
> (Allwinner V3s features only one mixer, and its only video output is
> RGB LCD, which is already supported in our TCON driver)
>=20
> The last patch is only a testing patch, it shouldn't be merged; and
> for the patch to be really usable, the RFC fix of the TCON driver [1]
> is needed.
>=20
> No HDMI, TV encoder or other internal bridges' support is included
> in this patchset, which makes it currently not usable on H3.
>=20
> Thanks to Jean-Francois Moine and Jernej Skrabec for their efforts
> to discover the internal of DE2!
>=20
> [1] https://lists.freedesktop.org/archives/dri-devel/2016-December/126264=
=2Ehtml
>=20
> Icenowy Zheng (9):
>   drm/sun4i: abstract a engine type
>   drm/sun4i: add a dedicated module for sun4i-backend and sun4i-layer
>   drm/sun4i: add a Kconfig option for sun4i-backend
>   drm/sun4i: add support for Allwinner DE2 mixers
>   drm/sun4i: Add compatible string for V3s display engine
>   drm/sun4i: tcon: add support for V3s TCON

Applied all those patches...

>   ARM: sun8i: v3s: add device nodes for DE2 display pipeline

But this one doesn't apply. Please rebase and resend.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6dlbfpq3n2or3v5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHIpjAAoJEBx+YmzsjxAgAmMP/1PwRt2tR3igqRuwcOhGoDsS
dCEZk9YkhlAtcN9u6UFGbpt1atABF473Eq/tGj+RYO4hWH3c+otbdRW6leLFAZb9
KGF3pPM6gV4heQetK8kXOXUjarG0ydC9+cnLZB5zJuXRED628jj4I60HJsVh6GWM
vAHeaIKTIADaxCVD71uFPfz3jpJOaa4S+mnu223CzhyIPCGuJ52izqnz8DEQor7b
PashlAS8jJYyQknjR/RapxeZcb25U8AoBhjIxno0PbPBq/JAuciA+P2fA2Y9AYsK
V+zhVTXnaaWvnlvNujKaTIBxRtSFSnlV5L7lW451cmX1j9hRmSx32xWc3wxsEpEE
+Hp+eR2InG4Chspf0Z/4dw3bTrjneVFgydeF0ia83jF+MA3c6uXdD1zyrkkZwn/d
ca9UuG71HL4ovTYd36aCdxvoM9gbRBdMzEZ0X0uo3qd/VJQcaxz4AgGT+lvZYQQG
IAyOFepk/WmkYJx+ghOTLst7DiB3c2ZEYpfSCd2G/MeXFFjGcdniy7IY+QDNYv/G
XyGrRmXb9tPFsiIbnXZ5taSUMW9Q7xXd9Fy6n0kXnQcUEXarjaHnzh6Vor3ovvhD
FD1fCvFqieix3KE9QMccumzpz9TbaMWP9fVMrrJwK8PMR1Tk9pbG2lmdHJlwXQfF
3DXhAucjghctlLoINu27
=mjXe
-----END PGP SIGNATURE-----

--6dlbfpq3n2or3v5k--

--===============0273926752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0273926752==--
