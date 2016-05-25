From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 5/6] ARM: dts: sun5i: q8-common: Enable audio codec
Date: Wed, 25 May 2016 14:43:36 +0200
Message-ID: <20160525124336.GI9232@lukather>
References: <1463500571-28970-1-git-send-email-wens@csie.org>
 <1463500571-28970-6-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0896573495=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463500571-28970-6-git-send-email-wens@csie.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0896573495==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e5GLnnZ8mDMEwH4V"
Content-Disposition: inline


--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 11:56:10PM +0800, Chen-Yu Tsai wrote:
> The Q8 tablets use the audio codec to provide audio output via a
> headphone jack or a small mono speaker. A GPIO output is used to
> control speaker amp.
>=20
> The tablets may or may not have an internal microphone.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--e5GLnnZ8mDMEwH4V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZ34AAoJEBx+YmzsjxAggvoP/15C//FSWKL2OO6TfOIaFXXi
IOqg2fC/BYhiDOPDCao+zmoi/Hy3d1+7P8J3vNCBJtAAsMOLNfc9OIhPidwsLQM4
O6zN3gKYRRj+uBNyph3BXdQAS5OPRR5qbM5sEAq+WuXM+cm1TNK5aiAPnLO4qjQG
fyPHPQI3ucK8D9+vbLmRbqpkz0e40ccb4qXvF61oxwcVo+EjWtTdxtr1a9J8pgr4
IL4Jy84acMyK+haqCvxkI3i1WJ7Vi8NPDN6lrvObq1V1wJc01xTzswhoXRM0hX0W
UVVi3LUnG3lTBzabMJTk70nDIrK6PV0otHGoosnN3SsLkhFTwFRvWANr/81x9eEs
JWLADImzTjurFIZld6Mtm2/Mrt4IRisGV+IMfSKxrxVl96K5IWQ7+n+m5mUfWRa9
UL2S1aCjnr22ryezbms9WNE9FKv7YHpkZtLjrWfpYsMokNALOdLUHklJeeedCUqO
4hq+aDtKHOFWUrfc8jB/JFG/a785UFRFI0AkZriReCqOVC750pHyO+YgQJPNTrNe
MiJJQVmuLvGx3CDLLEGDdn5A8XQrSxtGf5CdS2/YSqn4CryKbjzTjZru7wEO9fXJ
uD2P8P1Vm9L9ouxRMqqX9LbBf9jMqI6XDy/AlNdsYT6zV/z8JKuHXzXXJvlbSsoC
De6aVXN6NyfPPXoH2j6Y
=1aBa
-----END PGP SIGNATURE-----

--e5GLnnZ8mDMEwH4V--

--===============0896573495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0896573495==--
