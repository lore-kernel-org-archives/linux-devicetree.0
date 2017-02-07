From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/2] drm/panel: Add support for the Sitronix ST7789V
Date: Tue, 7 Feb 2017 16:34:44 +0100
Message-ID: <20170207153444.yc7znfkje7hm4em6@lukather>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <2db19e6e-9857-1c92-dc77-c6b862cc771f@tronnes.org>
 <20170206103938.3yghvugiwpzkij6r@lukather>
 <a4634b34-ee70-449e-74c3-2ede4ea8c569@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1043674174=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <a4634b34-ee70-449e-74c3-2ede4ea8c569@tronnes.org>
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


--===============1043674174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="weq2r653steeqr54"
Content-Disposition: inline


--weq2r653steeqr54
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 12:29:31PM +0100, Noralf Tr=F8nnes wrote:
>=20
> Den 06.02.2017 11.39, skrev Maxime Ripard:
> > Hi Noralf,
> >=20
> > On Fri, Feb 03, 2017 at 07:48:51PM +0100, Noralf Tr=F8nnes wrote:
> > > Den 03.02.2017 10.59, skrev Maxime Ripard:
> > > > Hi,
> > > >=20
> > > > Here is an attempt at supporting the ST7789V LCD controller from Si=
tronix.
> > > What happens if there's another panel driven by ST7789V that needs
> > > a different controller initialization?
> > You know those panels / controllers much better than I do, but why
> > would that be the case?
> >=20
> > > Maybe it's better to name it after the panel, not the controller.
> > I guess you could also use that panel directly without the controller?
>=20
> A controller can drive many different panels that can require different
> initializations. I faced that with staging/fbtft, when I wrote
> controller drivers having initialization code, and then came across
> displays with the same controller but with a different initialization.
>=20
> Trying to write controller drivers for these controllers is very
> difficult with all the possible permutations. On top of that we have
> those undocumented commands/registers.
>=20
> Some panels come with embedded controllers, in which case it makes
> sense to write a driver for the panel.
>=20
> But if the panel and controller are separate, then I don't know. Maybe
> the chance of coming across two uncompatible ST7789V and panel
> combinations in drm/panel is extremly low.

Hmm, I see. If we ever come across that case, I guess we could just
add new optional properties to override the current sequence.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--weq2r653steeqr54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmekPAAoJEBx+YmzsjxAgwcoQALhFnTQ5JPZhF8o1onXRvZLq
K9dn0OhbjzOx0ZeKcz3UpJ4SXA+rr8gJ7fcQAqdtyw6uagVZMObDVV6HGJZqTImz
Em3RXvI90tZaIxpFsEf3BBW1eymyJlNoy93DINVDVJ9H58zGUJDLOYLVVibsSkBf
Pcl+4SVDTEN/httdl8mVNS2XJaGNKB35mLX8UUIs76g1HRnobZx9mnEsZhayNtZa
12eef01liSwXUwAyldiI1n4ppOAVhrCNxDtvpL3L7/ka0cisblxqnxZnW2REG3xu
dAP6KVHBKzXrwWNRRjX4spmS+fJC1T8IJnvhrAAqabHFoChxFe7vvl/x8qAkVxY9
EaSVhTiPQGo67oIyedHsh5TvoaIFhXqGIJiQc92kKkaoLA7GEe02UF9QVVgN4Ogu
GGb3C1wQbqhTdZrdKNYKJOhJQml66W7gzX/ByO3os35cQNiNr9fqLdw0JJ2d7UTa
MI0pJNXVrnBRZpS5Bg1L8SohUss4FZSY5ld0tZMpRDT+3s1qyGCu3yr7F5g+Yy5K
27sPEz9+NJIhjZCDQMJIcBsGsu3+XzlST9P9fuDXPdKgkB1QzRkRLmQg04seWLOD
IeHZqzCCESRSSmXy9f0QZlwbUIdK60TSWcI2vDm/+JdTSmNjpRBYhcx+DGK9OGLk
lnCruFRhpJXKVW44Zf6P
=vSGe
-----END PGP SIGNATURE-----

--weq2r653steeqr54--

--===============1043674174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1043674174==--
