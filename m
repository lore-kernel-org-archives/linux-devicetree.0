From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] drm/panel: Add support for the Sitronix ST7789V
Date: Tue, 7 Feb 2017 17:46:21 +0100
Message-ID: <20170207164621.GB28522@ulmo.ba.sec>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <2db19e6e-9857-1c92-dc77-c6b862cc771f@tronnes.org>
 <20170206103938.3yghvugiwpzkij6r@lukather>
 <a4634b34-ee70-449e-74c3-2ede4ea8c569@tronnes.org>
 <20170207153444.yc7znfkje7hm4em6@lukather>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0327441170=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170207153444.yc7znfkje7hm4em6@lukather>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0327441170==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 04:34:44PM +0100, Maxime Ripard wrote:
> On Mon, Feb 06, 2017 at 12:29:31PM +0100, Noralf Tr=C3=B8nnes wrote:
> >=20
> > Den 06.02.2017 11.39, skrev Maxime Ripard:
> > > Hi Noralf,
> > >=20
> > > On Fri, Feb 03, 2017 at 07:48:51PM +0100, Noralf Tr=C3=B8nnes wrote:
> > > > Den 03.02.2017 10.59, skrev Maxime Ripard:
> > > > > Hi,
> > > > >=20
> > > > > Here is an attempt at supporting the ST7789V LCD controller from =
Sitronix.
> > > > What happens if there's another panel driven by ST7789V that needs
> > > > a different controller initialization?
> > > You know those panels / controllers much better than I do, but why
> > > would that be the case?
> > >=20
> > > > Maybe it's better to name it after the panel, not the controller.
> > > I guess you could also use that panel directly without the controller?
> >=20
> > A controller can drive many different panels that can require different
> > initializations. I faced that with staging/fbtft, when I wrote
> > controller drivers having initialization code, and then came across
> > displays with the same controller but with a different initialization.
> >=20
> > Trying to write controller drivers for these controllers is very
> > difficult with all the possible permutations. On top of that we have
> > those undocumented commands/registers.
> >=20
> > Some panels come with embedded controllers, in which case it makes
> > sense to write a driver for the panel.
> >=20
> > But if the panel and controller are separate, then I don't know. Maybe
> > the chance of coming across two uncompatible ST7789V and panel
> > combinations in drm/panel is extremly low.
>=20
> Hmm, I see. If we ever come across that case, I guess we could just
> add new optional properties to override the current sequence.

I think if that ever happens it's probably best to split out ST7789V
code into a helper library that has functions which take parameters.
Then we can simply call those functions with parameters specific to
a panel from a panel-specific driver.

Trying to fit all that into device tree properties is likely going to
end up being really messy.

Thierry

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliZ+d0ACgkQ3SOs138+
s6Es3xAAom4HErxHZY8f+7s+BvUIKZ1b91ndc+0bCS81NnDWfvc90j4/cP+YQ8VZ
npT/Fnu/AKc7E7MK6Q3pZmVTVLFXg7rjpWQQS7J8z+JuxUUfB/d/Ae957znT8YOb
jaFegiPellW19RmRPHncGn67yHjt27O4FrhuX4ljnm0cx4OwisPMCjnl6AEWZg0F
2SB3q9GOhL+ksn0YoQdmgrV0j1AHvKx8OFQp1QOQ5b/eXUeJOZT0DU8HIm+3IHAJ
VMrlggbKnmiRu8NGcXzKhiFQa90fkBQRmhLD2mGw81SQNWHcuMTm17kX1dO2Z0Da
dhC/bKENVxushZLlRXB69LERtrDEkDEl+WirY1+zj/KhZ6JR38rc2xmivkZwmLk5
kuHJ8evCfJpD3IFAj6d2F6LsaMidO8cRZfxnNlABzuD/eWAOz7WilkUv/+P9RftR
moiEVhDDkBS5lwMmMDrOr+6khHc6KYOs2f3Aq+jkB6OY3L/ctSQzH21tmcKI9oL3
TLhwAvoBP9sbXaSCp/Y/N5ZIt57DYDPpD4PtuRS39l2kedhpbf3qAII66GZ4K/9N
Kd/0DW5FOfJdRP3Cd+eadOJhOh91zi4hTcxZ50ZEyd+8SNc2b8GxZDQO3yB0k1on
3B97vRKNBaV9peUHcL+omWhcEOkqvug/BECQdcChnG0Tq3Iwr5o=
=sToh
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--

--===============0327441170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0327441170==--
