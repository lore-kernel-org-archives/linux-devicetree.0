From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/2]  ARM: dts: sun7i: Fix A20-OLinuXino-MICRO dts for
 LAN8710
Date: Wed, 30 Aug 2017 16:37:28 +0200
Message-ID: <20170830143728.friajjequvioqjpu@flea.lan>
References: <1503901963-9457-1-git-send-email-stefan@olimex.com>
 <1503901963-9457-2-git-send-email-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="peez7wuo3f66wndb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503901963-9457-2-git-send-email-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Mavrodiev <stefan@olimex.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--peez7wuo3f66wndb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 28, 2017 at 09:32:42AM +0300, Stefan Mavrodiev wrote:
> From revision J the board uses new phy chip LAN8710. Compared
> with RTL8201, RA17 pin is TXERR. It has pullup which causes phy
> not to work. To fix this PA17 is muxed with GMAC function. This
> makes the pin output-low.
>=20
> This patch is compatible with earlier board revisions, since this
> pin wasn't connected to phy.
>=20
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> ---
>  arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/b=
oot/dts/sun7i-a20-olinuxino-micro.dts
> index 0b7403e..cb1b081 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
> @@ -102,7 +102,7 @@
> =20
>  &gmac {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&gmac_pins_mii_a>;
> +	pinctrl-0 =3D <&gmac_pins_mii_a>,<&gmac_txerr>;
>  	phy =3D <&phy1>;
>  	phy-mode =3D "mii";
>  	status =3D "okay";
> @@ -229,6 +229,11 @@
>  };
> =20
>  &pio {
> +	gmac_txerr: gmac_txerr@0 {
> +		pins =3D "PA17";
> +		function =3D "gmac";
> +	};
> +

The patch looks fine, I still have one question though.

Can a PHY operate without this signal? My real question is, would it
make sense to mux that pin for all the users, or is it an optional
signal that each board designer can choose to use or not?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--peez7wuo3f66wndb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZps2oAAoJEBx+YmzsjxAg4RYP/1AFveF6n4BUUddh1W54vW42
Rg2VEi1AAn/bJD1ra1ZHo17fT/8A/tnsuRzfgy8CxX8rAG4bFPw4X4ixt/s5s8em
uMUZ4CLTllqjOSAIHGkwYUvzmL4YKUdR/zJUH25fSdNfrFk8KqWu64LafaTWMENo
QHwarOrzopcKVtSM4tS36Bv/cRf5ibU7/Hebqb7UnNSbK+qOT1ALQj95be7QJQuM
ECjD7gQBRS5H6eJ4CadPiuOUMcDtsJmX/nncbJCWteuOopEXDMp15J6VoFDCFwa6
igW5FVyR3FwDg1aattsdtZoDpKuLVBm0mEWZ66/lqKXMgXblqBPpJSSY5WXXZvL1
1B9SB12djvN4g1sbsIM/Ir5/8cAulGUVLMWuvtBLg7c/jGPhSMN5asjZJ5FMoofV
Jwx1axVUYmKfhM1aEHlWnP7wkuCr4FXIdPJI3ybqXgAOFLjkQCGJgK0FN0Feo49a
eP/wlyjhjygVefH2P4m20V2XVqYIMg8GVZv+bSTe07AAeW2J/v4OTGAqAm7bUU7E
qJxny5+txVPugoJDxx0UDrQ9lxGKEHUCcULhFPDsbqFMF/tNEpHwjbnbAH+O2Yo4
Pj9F1CY6AdEEy2Pzka/xIOOFY5RndDh3GmdODoOtup5OYGucBvBwjeoKJarPK1A+
dNCWW1rpLdetDyGCnLRk
=fKWS
-----END PGP SIGNATURE-----

--peez7wuo3f66wndb--
