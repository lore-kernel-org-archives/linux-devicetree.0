From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: Add KINGDISPLAY KD097D04 panel
 bindings
Date: Tue, 10 Jul 2018 13:05:12 +0200
Message-ID: <20180710110512.GP1504@ulmo>
References: <20180702103229.3952-1-heiko@sntech.de>
 <20180702103229.3952-3-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1245122638=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180702103229.3952-3-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, hl@rock-chips.com, briannorris@chromium.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nickey.yang@rock-chips.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============1245122638==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wg9FEZT+WCTrEXgJ"
Content-Disposition: inline


--wg9FEZT+WCTrEXgJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2018 at 12:32:28PM +0200, Heiko Stuebner wrote:
> From: Nickey Yang <nickey.yang@rock-chips.com>
>=20
> The KINGDISPLAY KD097D04 is a 9.7" panel with a 1536x2048
> resolution and connected to DSI using 8 lanes.
>=20
> Signed-off-by: Nickey Yang <nickey.yang@rock-chips.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../display/panel/kingdisplay,kd097d04.txt    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/kingd=
isplay,kd097d04.txt

Applied, thanks.

Thierry

--wg9FEZT+WCTrEXgJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEkugACgkQ3SOs138+
s6FLCw/+IW5ycgyk9TiWVBIurrQDhG2/XUgcfQmtRmO0gEvvGKNPLuT4A1bCX3S+
lJp/uRWCyi6utFVYBpr0H9k2kKV+lVq4WSI26cE/A5haCJa/nknjBXfzz6o7nADR
w0/tMxvkJ0/Toj0urFCZUhMx8cpTveOWUVMMXINHKL6wSBGq7+4SlDoJ+hsUx4C9
xm7cDjUex1Y0eCIsksPO7I8YuoFleqEAOlYmp1nbCazKh/pqIcfOJiDaeWcKNAJ2
Xx0tmIPxq+2+8OzgZd08m570iSdn1BffcCkO6OqAddx0b+1vmnmSC4jxDPgaQxEP
ie1rxlSd1IaGP3wS//xmT9xiCd+dF1EJQ8AAv7zis+qQHCBICtKD3Mpb9B53/36v
r4CUN/OYsR3s7GgMWX8KFoYjFrD0zsS4hz+uAH1d85pLX/hFjyAlpz30b9KbaEVM
5DlruZZuLGSewW2XAM7xeuPHXPzdlNlErSnPCu92qywmIJekM6g0Q8nueVnf0egh
hMLBgTbdhO8SD83vL6xdl+uEN93hwID/G1Tr0ZzlKAp0GU2cHPlsYbkyU8Pr4aFU
Fi3fGBxxhljE2VlJiSACnioSNmR2BANBGx96SEE3CX7mHATOnZyVBj9FDFxfWjit
y1Ook6PrD3qsLM/kiILorkw0+djSUgWSJ+6ptd3tT95/qbgCZDw=
=WVH9
-----END PGP SIGNATURE-----

--wg9FEZT+WCTrEXgJ--

--===============1245122638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1245122638==--
