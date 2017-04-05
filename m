From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/3] arm64: allwinner: a64: add USB0 OHCI/EHCI related
 devicetree parts
Date: Wed, 5 Apr 2017 09:15:08 +0200
Message-ID: <20170405071508.yaur35xuli4jgkfb@lukather>
References: <20170404184518.33610-1-icenowy@aosc.io>
 <20170404184518.33610-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="khvcsmbqyjd45pgs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170404184518.33610-2-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--khvcsmbqyjd45pgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 02:45:17AM +0800, Icenowy Zheng wrote:
> As we added USB0 route auto switching support for A64, add related
> device tree parts to the A64 DTSI file (EHCI0/OHCI0 controllers and the
> pmu0 memory area for PHY).
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 24 +++++++++++++++++++++=
+++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index 1c64ea2d23f9..a8916df99048 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -179,8 +179,10 @@
>  		usbphy: phy@01c19400 {
>  			compatible =3D "allwinner,sun50i-a64-usb-phy";
>  			reg =3D <0x01c19400 0x14>,
> +			      <0x01c1a800 0x4>,
>  			      <0x01c1b800 0x4>;
>  			reg-names =3D "phy_ctrl",
> +				    "pmu0",

This breaks the older DTs, and that property isn't documented.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--khvcsmbqyjd45pgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY5Jl4AAoJEBx+YmzsjxAgwUkP/3eijL2CH4wdwLTVfsgvFjw0
b10GRPjoq0ACDx3EZMqE2rTtiYGgBmX5VC2Qr8WFjc6irNbU1fJew64px6tms4Gd
GxB9qNqRkZJlTuEYVjT/iA+Xg+IJEq9ibVkV/JVs4rA8VePy3I90BjRRyLd2UXbJ
M9zPttxuM2RGDVXvQlXu+lzaKCH0mzq3BkCqPVovv7k32zDg7yBkyJtsBARfQBl3
IZ6LMWQhm0UNYV26Q4UMOCWiO43lN1PDFLAQFAxbEW22zsQZAsvf9K6EyZTVS97B
VDtV+OgGyQWEqeKINl/UUYUQiFkauVl2DD4hbhfUm7dgig3qZyZE/UHsOmJUeNUj
QKKo0a8ACLZJYDPCiTYVjx2i+mqv14kaXH2HTpWMSfrJcfAXkCI8kerOBPJICls4
3HmMnDEzP8q9kcP21jTNHUd+RZINbuXGiP/DTZVzAFUGHYTnBs2luvGJleGzcqux
yk9L//GJ9rYSVKrUYN2Tig5tUwKXt3YV8qPZQb7DBcZSVt1k2S6Ujl9c0SOx6CET
qe6dDVBhiJ4yxQY+W70p55Rdoti/1HygqAXmSaXTHcVcYuQe+8n/BqKcSdHZ44mX
Q+g7oS4VoVk2ZbILYrRtFF1v9TkNBzFPLoIISmx2phoasmes2Ysh3KUAwPoO40CW
6ED7mfNb86AnSC5iZGm1
=/Zfv
-----END PGP SIGNATURE-----

--khvcsmbqyjd45pgs--
