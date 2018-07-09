From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: Document the EDT et* displays
 in one file.
Date: Mon, 9 Jul 2018 19:27:22 +0200
Message-ID: <20180709172722.GH26651@ulmo>
References: <20180427132445.3458-2-jan.tuerk@emtrion.com>
 <20180619095546.24445-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0590968909=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180619095546.24445-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: jan.tuerk@emtrion.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0590968909==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e5bfZ/T2xnjpUIbw"
Content-Disposition: inline


--e5bfZ/T2xnjpUIbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2018 at 11:55:43AM +0200, jan.tuerk@emtrion.com wrote:
> From: Jan Tuerk <jan.tuerk@emtrion.com>
>=20
> Document the Emerging Display Technology Corp. (EDT) using the
> simple-panel binding in one single file.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
> ---
>  .../bindings/display/panel/edt,et-series.txt  | 39 +++++++++++++++++++
>  .../display/panel/edt,et057090dhu.txt         |  7 ----
>  .../display/panel/edt,et070080dh6.txt         | 10 -----
>  .../display/panel/edt,etm0700g0dh6.txt        | 10 -----
>  4 files changed, 39 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/edt,e=
t-series.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/edt,e=
t057090dhu.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/edt,e=
t070080dh6.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/edt,e=
tm0700g0dh6.txt
>=20
> [Changes from v4 of emCON patch-series]=20
>  - rebased to mainline/master
>  - split as requested by Shawn Guo
>=20
> As requested by Sha

All three patches applied, thanks.

Thierry

--e5bfZ/T2xnjpUIbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDmvgACgkQ3SOs138+
s6GotBAArv++juALZcgUolPimsi98L6/1vFrIO3DWnUFL+TPr8eRUdjFJkxMjN0A
8APTSjoBja5w2baNx7ehDYkVYwJ7S8zod7FtouU1kU0QfRWqCIm0raCiJyIiF/ni
ks/rRyUxMUFXuBbMPEZVegonVMxcQu6Id5xjXTpM800C5PemcgadEfmV3QZZKYqt
ioosmqhzMjaKBJW0HilGqw+to3HiDm2AlcR8zLaZzkwAvHYI+LYsJ4aTqZc5U6ve
Ug07oNVjCVDCntwSsryeB6UG63bmDaCFTn4XSU6Qqs9wSpcyx74msWtnvju3SMqb
zjVoKk79VpUFFo1uFxffUZbH3dhyT8QKs+niQYIaDwUvziwBmH9u3mhzTUCDArnj
gigHtoK62zWCj6m7ytN43jHPClQuv6kXG3n7rqR1G1S9bquUF1k2tBHYHaaJ9NAK
3i1u0PPTxMUZ56xxOrr3J7BQ7pWYMuyaB3wJr2Fejhfd0U9AlwzHi8a9rRq+ymHz
l6JpPPJHtefCe6jW/oUDeUZDs1ovVH5W+Tvhu3c3qhHpbqzXZDysh25FtKDgwRL+
NXDj9bAA4eH7T1zYrc67woS9hgWQX9le13W4/ixguoXiXymWdsYjb+kVjs5cMqaJ
LKWE7eBz3xUsSoTEJqukq1qa29mEIx769wgKnRqhH72tuoRmd/Y=
=ZAa+
-----END PGP SIGNATURE-----

--e5bfZ/T2xnjpUIbw--

--===============0590968909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0590968909==--
