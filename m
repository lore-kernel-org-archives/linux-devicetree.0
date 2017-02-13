From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/8] ARM: sun4i: Add display blocks for the sun4i dtsi.
Date: Mon, 13 Feb 2017 10:16:12 +0100
Message-ID: <20170213091612.d5ifc4oi63xf7boi@lukather>
References: <20170211174405.28395-1-plaes@plaes.org>
 <20170211174405.28395-3-plaes@plaes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0866787963=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170211174405.28395-3-plaes@plaes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Priit Laes <plaes@plaes.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jonathan Liu <net147@gmail.com>, Quentin Schulz <quentin.schulz@free-electrons.com>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0866787963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5fucayz6j7cqntzj"
Content-Disposition: inline


--5fucayz6j7cqntzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 11, 2017 at 07:43:59PM +0200, Priit Laes wrote:
> Added basic display pipeline consisting of tcon, display backend and
> frontend blocks.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi | 104 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 104 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a=
10.dtsi
> index ba20b48..70991c9 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -779,6 +779,45 @@
>  			#size-cells =3D <0>;
>  		};
> =20
> +		tcon0: lcd-controller@1c0c000 {
> +			compatible =3D "allwinner,sun5i-a13-tcon";

There's a few bits here and there that need to be setup differently in
A10, so you cannot reuse that compatible (same thing for the other).

Also, I'd really like to have all the blocks listed here, and not only
the first pipeline. Ideally, on the A10, the two pipelines should be
enabled too.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5fucayz6j7cqntzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYoXlXAAoJEBx+YmzsjxAg7PcP/2E1CBxT4DcH9uwHRmUSxm5N
elIywIQs8HUEtgO7ZVLBDIk8vWVjZlnLs10dVtIa2vvGMHU6Ubg0NJiQCwhItaT8
SIgkZTV1V5rPIo/pnT4resHvyIMdXBgKzK3mintY2c9zN5TSW1+XVA2cWtW1zaKo
OTa4a1qT7uJ6CjMb2gaCu/3dQj78MRvBEGyl7pxbhYIMrRT/aHR+jXR3WykboaEp
ylLkrPjt13YYAFRwWNZXI5b18H5YsnvCsP9/bJuH69gFtQA0T1Ymsp0T6F8yaEgZ
bZYckdTVSNWY9xBhTx/4YcafjFyurZRrNr/rRj8MucXMagtUI321fkygCP/lMHsJ
ZnkKZY28ZxiLbW31m31ZyjPDPiP8B8WpkxaPNnXg/ZdGNDZIu2DxBgI1hsmfomtO
5bZj6Ws5QJ871kPoZcaA7wJiKXfO9shxUpNqxnap3KrnvLGT5Z1v/FuTsTcMrES5
42M/uV/Bg2uSzSvljU4NM6aipHSdV1q9MDikYcpHHQWmuEYH1U720h0iyaQe3KKy
Y3JBE2b4j3IFAzWN9/q2qRI+v43mz3ZiF/f6yLEbYYwgD41iTadY/Hf4/Zim+ldI
7DeWZFKiGMXlhrk4HZNETf0N7KS3lcPmX0s5u4MWc50IXXeVK4PJQvwUIu7ucX1B
019c/xNBOK+tsTenU5Sz
=vNDx
-----END PGP SIGNATURE-----

--5fucayz6j7cqntzj--

--===============0866787963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0866787963==--
