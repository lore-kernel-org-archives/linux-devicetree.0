From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/panel: simple: Add Sharp LQ035Q7DB03 panel support
Date: Wed, 11 Jul 2018 18:44:43 +0200
Message-ID: <20180711164443.GA12951@ulmo>
References: <20180706185101.31186-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1758991881=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180706185101.31186-1-vz@mleia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1758991881==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 06, 2018 at 09:51:01PM +0300, Vladimir Zapolskiy wrote:
> The change adds support for Sharp LQ035Q7DB03 3.5" QVGA TFT panel.
>=20
> Note that this aged panel is already found in the kernel sources,
> for instance in board mach files mach-mx21ads.c, mach-mx27ads.c,
> mach-pcm043.c, lpd270.c and imx27-phytec-phycore-rdk.dts.
>=20
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
> Changes from v1 to v2:
> * added description of power-supply, enable-gpios and backlight properties
>=20
>  .../bindings/display/panel/sharp,lq035q7db03.txt   | 12 ++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++=
++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp=
,lq035q7db03.txt

Applied, thanks.

Thierry

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltGM/gACgkQ3SOs138+
s6FjohAAhHuDSu4/G7sogO97cWIuU+PaxyzgSqKEcPT2KDFxLSEVjkT3Wck5VZCY
hCnCTkD8SAysvYMy8JrLpDnM9wpHdQ1a5ROLHT20qJuyvGsG8RxLtQpNRBzek9qW
nBEa/kGzbwwNJJLaz8JkjZOH5sOBkKUJzfUmDL29pZhm9/g+xOfwXqfnJ+wH23jC
TAQuxV8589tfLUT5K0H7nxaLJrO/zu7wdwjzOgw6mNlWnFoGrk7Kiz1btUjSRVXI
rFv+xRUNALrRaGedFzYoZA4M0pkMiQoS9LcJLHtxbr/NP4W1+lBALAVdTpCkNDnt
zFDtwVEB89zqjsnghhEgQhOCFcCBmfCMbfnh9yVD4XgcZh+XuVZqFiBz0BIsq14S
G2KRXlqkib3/o22jsCuMZArXTo+m4Bo2HPynnPixvQRe/6i8MDrBL8elwT0YmNKC
UzvkDlepjBuCAWstZntHj4VEuZnG8CWRgXteraG3iVf7/QsvpTw1W5K4Gm2YCZQs
bw1YHBDxESIJDayKaE/B5eNHELb63pgwkA8Cy2PHUa+dawFFQkl7iVoc8HAgiBkU
u/IoBMgo3cOia9ymHsjAOf0zBsGqb0zpzm3nc63XXv4+yBY+4vorAhoG0xjxH16C
Wc5JYBJUyXmL7iX1Vy3ccJKkrGmUiVswNeyCqWPrzzJUYaggO50=
=rTbv
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

--===============1758991881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1758991881==--
