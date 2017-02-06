From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/2] drm/panel: Add support for the Sitronix ST7789V
Date: Mon, 6 Feb 2017 11:39:38 +0100
Message-ID: <20170206103938.3yghvugiwpzkij6r@lukather>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <2db19e6e-9857-1c92-dc77-c6b862cc771f@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1794479485=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2db19e6e-9857-1c92-dc77-c6b862cc771f@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1794479485==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nr7ulenwk2u6s6e2"
Content-Disposition: inline


--nr7ulenwk2u6s6e2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Fri, Feb 03, 2017 at 07:48:51PM +0100, Noralf Tr=F8nnes wrote:
>=20
> Den 03.02.2017 10.59, skrev Maxime Ripard:
> > Hi,
> >=20
> > Here is an attempt at supporting the ST7789V LCD controller from Sitron=
ix.
>=20
> What happens if there's another panel driven by ST7789V that needs
> a different controller initialization?

You know those panels / controllers much better than I do, but why
would that be the case?

> Maybe it's better to name it after the panel, not the controller.

I guess you could also use that panel directly without the controller?

> > It is controlled through an SPI bus, with a twist, since each byte sent
> > must be prefixed by a bit, which needs an 9-bits-per-word SPI controlle=
r,
> > which is quite rare. Else, you would need to bitbang it.
>=20
> It's possible to support SPI controllers that can't do 9-bit by using
> 8-bit mode and blocks of 9 bytes to send 8x 9-bit words padded with
> zeroes. Zero is MIPI DCS no-op command.

Ah, yes, that makes sense. Thanks for the hint.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nr7ulenwk2u6s6e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmFJlAAoJEBx+YmzsjxAgxVEP/2Yz3Q8faBhC5IuDJ/50SsGa
f3/jSTZnuwrmO+WFAYwMYZ90uaJDA7p0TCYWrRo2HHO7MBzxl0ILNeYCVRb+pQIY
7IlZVbFelzcOne2//9w94BQ/swqPA5OGJ3BqldQOMlzs6jEoW/+kJpTezOtNmIiX
m2K1mgfBAMK9jQePChER4pitL/cPWgyULz/nNkaE2FCxMjAQyvfUmgDAaAtzt2b5
On2sl+io738dyfFWl/QYpg5ee360Rz2TR+HekBbqeAOYlSW9rnWa/BQ5VASUeSwR
hjqtyAKaTqL9ImpWsiduiD1ZiYenjBJLFhb5l1k6NOY+/1L9XxIPLqw9IA3E7X5T
Iex1UNNINT3sOOafkyviJg8LhGi+fsq2VjphrWPBd2tdbJuemT2/xjSB39VtYQ6I
ayNxv0BTi1G1cMjsoq3xoMb3Cp4U4BzH3Srz0VZjxh/6dKK6go7EKPNJKy8S0BYj
MkT4hnzVbrJYsduEvmH+c1eiNJalOgEbtKcdQJdU/W1YcUUsNLoV5vUVqX8h1XV2
Zd0hEVIL8aj6k0hHeRyz2iwOzy2JhVBeNBWuPn4gQ2udJ8SO7+TLzNtjeLhoAezI
dmKKNp/r+XVxTk/3wG4FdbKRtUNqpwx43uhf4ny78ihwofns2N1jzskU+fcZCAZF
6S2tinCOVPzZIO4nVstd
=hBLd
-----END PGP SIGNATURE-----

--nr7ulenwk2u6s6e2--

--===============1794479485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1794479485==--
