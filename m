From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v7 0/2] drm/panel: simple: Add TFC S9700RTWV43TR-01B
 800x480 panel support
Date: Tue, 23 Apr 2019 14:16:26 +0200
Message-ID: <20190423121626.GJ23448@ulmo>
References: <cover.1553243203.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1408575806=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1553243203.git.jsarha@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org


--===============1408575806==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Do4IU1xF/9sod/r6"
Content-Disposition: inline


--Do4IU1xF/9sod/r6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2019 at 10:33:34AM +0200, Jyri Sarha wrote:
> Changes since v6:
> - Make power-supply a mandatory property
> - Split binding to a separate patch
> - Drop Tomi's reviewed-by, since the patch has changed quite a bit since =
his
>   review
>=20
> Previous round:
> https://patchwork.kernel.org/patch/10854851/
>=20
> Jyri Sarha (2):
>   dt-bindings: drm/panel: simple: Add binding for TFC S9700RTWV43TR-01B
>   drm/panel: simple: Add TFC S9700RTWV43TR-01B 800x480 panel support
>=20
>  .../display/panel/tfc,s9700rtwv43tr-01b.txt   | 15 ++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s=
9700rtwv43tr-01b.txt

Applied, thanks.

Thierry

--Do4IU1xF/9sod/r6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly/AhoACgkQ3SOs138+
s6HfSRAAiCQE7bIypboE4Ef2J6oZExrY+dEsnipR9b7AnVockb+YIwFFHyLvdCQM
tZgLJWZ8M7nPefdz2m/0fq4Vf4ygu1YPb9VeFg5XKn5VXrjLA88j+2yzvtT1dc72
EtAh10eBc5Et25S+yYur584cMSbVXPpMo+3LeVWjzjy5pgfpw567MDBSvZqAsLDT
u76++z3hpcsyIGgJkaVxeiqZJFzyhsr6ziQcdJViIyQ+3FVPFvtem1d6Q3kDUmsS
Bqb+PZblL0CaJEcY8E8szP30OBfmMHDHgKmmmBN8f/fv3fMPA+HvHUSuR+FHlOrL
sdZdeFTOcH7fT2WIbdIcnRKpFvh8GRcxvow25xdn4QKG3J26xGM/s8ZpOTvU5wB0
cU843zUJGHHXVyTj6p/uMnnQIEKzqB2JEjIgLUv8j6Bx8+40KDETNJPLeQGgu2fb
ojb73ba06p3Cto81b7MSs+05e7Pm1tr34Giw/oh1efoatcmZNvl8kH0qnZkP6AKr
l1fC5sayaUUGn/kPJdsP8JQDuGWU8+tVEWkLRRp6JDDoKUVf3IjAhYR/gW6jEAkK
lL3RThH/3PsLz/eXiPQ/PfjoTG9D4z35LbsYiivbZP8mYRsW2iqw1VV+rlNaIOwS
DFrNCoScR0xf6urieknAfzXp4wrLULpGiTjE/z5BiyyIBbktZJU=
=Y7X6
-----END PGP SIGNATURE-----

--Do4IU1xF/9sod/r6--

--===============1408575806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1408575806==--
