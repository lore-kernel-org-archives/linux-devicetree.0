From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Wed, 11 Jul 2018 10:30:36 +0200
Message-ID: <20180711083036.7attjq4hm5ay5gmn@flea>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0934681799=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180710203511.18454-1-jernej.skrabec@siol.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0934681799==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yshce36do3zzws6q"
Content-Disposition: inline


--yshce36do3zzws6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2018 at 10:34:53PM +0200, Jernej Skrabec wrote:
> This series fixes several issues found in R40 HDMI patch series after
> it was applied. Conversation can be found here:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/586011.ht=
ml
>=20
> Patches are based on latest linux-next (next-20180710) and are ordered
> in such way that they don't break R40 HDMI at any time. Because of that
> I suggest that whole series goes through drm-misc to preserve that order.
>=20
> I also tested those patches on H3 to make sure it doesn't break other
> platforms. However, it would be nice to test for regressions also on
> older SoCs (with DE1).
>=20
> Best regards,
> Jernej

Applied all patches but the patch 10, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--yshce36do3zzws6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltFwCsACgkQ0rTAlCFN
r3Q4sxAAkIOSDcrUdytnfHPJ0n99IJRimkUTwMFyKEGTrYoyr6ODMxuVnO200zQ2
eudqI2vuHRhxkkDXeSq5LCyYqhI2aYEF6Efyg5k/nX6C1ySgCME2ExXSwCVfDn+u
MHBQn04IXTERwHeZT5RzBOd9Ys33YaYeDBNdzW9EL1sbAz55+wNT6Y7zxyOCeZV0
KDZpbExJY9Sc/FB7gu9XEvEuzsVpzNkaLlupqnTFHSbu8US5eRnRhqhXBFpWrJYH
I1SgzObx1/w7N5427O4QdmA4snjTQzozbWjgU0nnTeCYYAPbWS6uOk/oAGAcCY9c
B1G0s0fLp6EjyFQWj12iubS/6reDhz3Zg2Yov3/YK3SyYv83E91MFg+gg1RLm940
RcYoImg/n0JEHICYhduLKESrT2biwdAlLdUkOTXRckh2tADVByU/9q5cKcoP72KP
rGmMOICBJ3POaKiUcdk2Q8e+1Dy087d3XgbyoHke62Tfe8UUPOLOrttrCEt0J78+
vkCpF/n4stglxAQvXvlBXO3vx1WLHHuGs8R9QLAGV/9bM1cHo1doBirCaRr1i7pK
vTXLhJOarfDK9u6IVBZRY8fv1nREf+F7qBA6wdZOqqCadvtuQFJL9/NbSg8FmPQD
p5G+cfAUnKhENiHqzJy+O36sbIUqJTyejC5ZemhGyKNfLmwpxuM=
=Os8I
-----END PGP SIGNATURE-----

--yshce36do3zzws6q--

--===============0934681799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0934681799==--
