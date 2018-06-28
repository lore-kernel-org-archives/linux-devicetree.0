From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 00/24] Add support for R40 HDMI pipeline
Date: Thu, 28 Jun 2018 10:41:46 +0200
Message-ID: <20180628084146.ttqshyiehjj5by3k@flea>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180627180215.y5kvvdqeriadxwte@flea>
 <20180627195043.hfasvppfm2cbudx7@flea>
 <4275695.oLYl8XEDF6@jernej-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1641877767=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4275695.oLYl8XEDF6@jernej-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1641877767==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4mqqv2i6olj3uyyi"
Content-Disposition: inline


--4mqqv2i6olj3uyyi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2018 at 10:25:37PM +0200, Jernej =C5=A0krabec wrote:
> Dne sreda, 27. junij 2018 ob 21:50:43 CEST je Maxime Ripard napisal(a):
> >=20
> > On Wed, Jun 27, 2018 at 08:02:15PM +0200, Maxime Ripard wrote:
> > > On Mon, Jun 25, 2018 at 02:02:40PM +0200, Jernej Skrabec wrote:
> > > > This series adds support for R40 HDMI pipeline. It is a bit special
> > > > than other already supported pipelines because it has additional un=
it
> > > > called TCON TOP responsible for relationship configuration between
> > > > mixers, TCONs and HDMI. Additionally, it has additional gates for D=
SI
> > > > and TV TCONs, TV encoder clock settings and pin muxing between LCD
> > > > and TV encoders.
> > > >=20
> > > > However, it seems that TCON TOP will become a norm, since newer
> > > > Allwinner SoCs like H6 also have this unit.
> > > >=20
> > > > I tested different possible configurations:
> > > > - mixer0 <> TCON-TV0 <> HDMI
> > > > - mixer0 <> TCON-TV1 <> HDMI
> > > > - mixer1 <> TCON-TV0 <> HDMI
> > > > - mixer1 <> TCON-TV1 <> HDMI
> > > >=20
> > > > Please review.
> > >=20
> > > I just applied it. It didn't apply cleanly, so please make sure it
> > > does next time, or at least state what the dependencies are.
> >=20
> > And it didn't compile either, because of the compile error that was
> > reported to the previous version by kbuild... Those shouldn't be
> > ignored and simply fixed.
>=20
> Sorry about that. I forgot to rebase and had same linux-next base for all=
 3=20
> versions.
>=20
> I actually take a look at that kbuild message, but it just didn't make mu=
ch=20
> sense and it worked for me without issues. Merge conflicts would explain =
that.

This was happening when the driver is compiled as a module, which is
pointed by the config attached to the kbuild mail. And asking is
definitely encouraged when you're confused about such things, ignoring
it on the other hand, not so much.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--4mqqv2i6olj3uyyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAls0n0kACgkQ0rTAlCFN
r3SjEg//XPoaakL1HuR6pou4aBAC3wBTH0xzen/xOcnlwBSrjqVJix2BoYYgTxED
RTIzeQDU3S2r0VWarPej/LDsu0/qk1CLiB5/fVUvNsVDTzcRtaqgRJWCAkFlFcvG
lIphwo1nHZeJPmEBn9DsM/DN1svHIjlpbgiJXTHlpCtX/PgWZOghTKqySAbICCOF
7XBO6OSW/IsG+4QEZzogVYOEbX25x2uzKcZTH3K2MjHoZN3k1tosz34h0BiBrDls
PhJiYCC8UOfXQAHE6ZeA8B2z4F4V8GhE4WbI55voY1hrEWfDGVQySSM3dxrOwsbN
3xkCQgRcMM/0qqR7849AADN4iTo+6HZUEW9qHZA5Wjeu2ua7Qn47mPS2D0tU34ut
YAAR2D+aIHLgX4W8VXy2xBZmmE0CsCmBs6+kXPqQDdGCeJ5oVjoK8Bvfw1Q7bfgU
Gr2L1aXKh7QgIZs3ecc+tm9RJe13wHTMz5o1GgegN0CEiHA1S0rqquRScK+JH2Qm
kjpRiEENkb1u9LTDemOHsnRYHAJTGxpfl7Vfi6HVwIij0uKxrGFWkMvqQXYBviXA
gbBDAyUbyo5osnO+t9RWxfQ0v7yOMN8AZ+5qiB8cccx1Xjl7RLvAFcTThtRv+IUz
R4WLG3/74LLLj1CemxQi2r9In0ammee7VmyoOHrES1vzxUVG4lc=
=sNCe
-----END PGP SIGNATURE-----

--4mqqv2i6olj3uyyi--

--===============1641877767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1641877767==--
