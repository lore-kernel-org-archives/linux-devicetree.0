From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 4/4] dt-bindings: display: Convert innolux,ee101ia-01
 panel to DT schema
Date: Thu, 20 Jun 2019 11:07:20 +0200
Message-ID: <20190620090720.GE26689@ulmo>
References: <20190619215156.27795-1-robh@kernel.org>
 <20190619215156.27795-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619215156.27795-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 03:51:56PM -0600, Rob Herring wrote:
> Convert the innolux,ee101ia-01 LVDS panel binding to DT schema.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/panel/innolux,ee101ia-01d.txt     |  7 -------
>  .../display/panel/innolux,ee101ia-01d.yaml    | 21 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 7 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innol=
ux,ee101ia-01d.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innol=
ux,ee101ia-01d.yaml

Acked-by: Thierry Reding <treding@nvidia.com>

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LTMgACgkQ3SOs138+
s6HTnA//XpMRpvIzlsj6bjRvDhdgl8TvPHw+KHstPrkShJJAVgRtW2KVQLdY5nTm
24C05Hn72m0VpcFpczml93ye6xWbctMc2fTEVXEEoA9sSi3n0MPPP07qoun+aDHk
gA+NM90RqQVW68KAckevmejVJxzhlN8IsmvLuZLxx4x2EcbEqFO5z9yt199zvItU
M41Xi2lWdLvDJplQHd5kKPYPHVYxyXNVd5mZA/LbFbWjVxp3RpcHOGDSIwLchLIP
exole/KJ1H7RECQyShMq1FRkL8I7cxQKF39b1SA8qY0zsUo+t49247jZrCJgkU8u
dvIRdNsT4mEVpIAuPIUTLeRxZigihvqbz2Ay00C6eGU7iL8HQX97dQKhn1/MImxe
ck662ma0pZHNNgCkcN3Bf+4fxvHVsBt1a2X3V0MM3cDLc8Bu0TiIuIpH3H9Bh44h
PbQzzH+1052oizKdXIiFtmoyGfJpZ5jHRuNQGbzE4ykAy6lb7uey8epWmDql9B14
kBUOHgAOdF+LKKZZMH02p5ISXGMAJ4Pe6HoHL/ox5DfosyMUnUGRIflYpUenliZe
Mgwr3ThVkTKeLwOpyhQdMvJStL1I3WafYH9vGYDgju0Vqn9jLCrf9+GonIj8NKVV
vsn6jEkuy9AQi56DWl3YRFUyv8J8lJyIHkcTWYxGe60cYnkbQeU=
=wPVf
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
