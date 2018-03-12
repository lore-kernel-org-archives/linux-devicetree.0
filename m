From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/panel: Add support for AUO G104SN02 V2 panel
Date: Mon, 12 Mar 2018 10:08:43 +0100
Message-ID: <20180312090843.GB15972@ulmo>
References: <1513173656.2322.16.camel@googlemail.com>
 <20171215230754.cnepbs34t5gp2rsf@rob-hp-laptop>
 <1513430016.1930.4.camel@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1177335203=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1513430016.1930.4.camel@googlemail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Stefan =?utf-8?Q?Riedm=C3=BCller?= <S.Riedmueller@phytec.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1177335203==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2017 at 02:13:36PM +0100, Christoph Fritz wrote:
> This patch adds support for AUO G104SN02 V2 800x600 10.4" panel to DRM
> simple panel driver.
>=20
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> Changes since v1:
>  - be explicit as to which properties apply
>  - adapt indenting
>=20
>  .../bindings/display/panel/auo,g104sn02.txt        | 12 ++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g=
104sn02.txt

Applied, thanks.

Thierry

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmQ5sACgkQ3SOs138+
s6Hx+Q/+OwpvwJswgUj/5Bd+Ac1+I356IFYJ1ER3hXrXru05GCV7zucxqLFPZYDv
eAgnsBfXr143NgMJEGc6Qrcfd5Vwj2ngDdN3LlwPcZl+GfWG2u5ks2ZtjUKgJu1A
ZWu5+pP83HUxvXsX7O6xZiGmH5Qw+IPS2uTNCxRByv6NWhiOacm/4TaenYfmbB74
yVjXL+HpAJuMUsUZ1xRIe9HXNVyoyvto8TpgJqDeHFkloL77IMRSTc13iBNuZYPI
LpOjtC7eozphSsH6oq1awd2saL99aQ70vY6oe8Y2j0jcF4ZExbBZxdCostoF39wB
BVsLppo1JA8q27bYkRuIDTXazz52cnfvP2boSxf58zBwo99AdtU73zkcS1UDxwvH
J17YwBciz6fDgPW1fk1O27bX5Dt7YpwBafLMlXKVq2xf1NQy+qNcisRvzYjaGN41
9xF86yT/F5Ddc73f+cePsXQCBb5lAUh+2lVDllxuv4THCjQJnHtRuCYdAXyRimM5
ge27jttrT3XNQRUy5Y+FSD7Ot0ukjbETYozbiW38oWktqLMbkBUUgYRmvPGQSgxq
IWJ+3NRNKaSEVIY+8KVI4luPHHagbBuVEvjNwrt+qwDjt4AtkM1OZM9bSAmy0cGN
vzSS8mtw6E/iMriSXqvqLikDyBbpR6uYCYdece4Ui4aCQXU6qNQ=
=PDY2
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

--===============1177335203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1177335203==--
