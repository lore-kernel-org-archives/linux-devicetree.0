From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/3] ARM: dts: sun7i: Fix A20-OLinuXino-MICRO dts for use
 with LAN8710
Date: Tue, 22 Aug 2017 22:31:57 +0200
Message-ID: <20170822203157.mvnx224l546vamah@flea.home>
References: <20170822114313.9038-1-stefan@olimex.com>
 <20170822114313.9038-2-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cyescndbqelclbfq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170822114313.9038-2-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Mavrodiev <stefan@olimex.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--cyescndbqelclbfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 02:43:11PM +0300, Stefan Mavrodiev wrote:
> From revision J the board uses new phy chip LAN8710. Compared
> with RTL8201, RA17 pin is TXERR. It has pullup which causes phy
> not to work. To fix this, PA17 must be configured output-low.
>=20
> This patch is compatible with earlier board revisions, since this
> pin wasn't connected to phy.
>=20
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
>
> ---
>  arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/b=
oot/dts/sun7i-a20-olinuxino-micro.dts
> index 0b7403e4d687..578c761b551a 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
> @@ -102,7 +102,7 @@
> =20
>  &gmac {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&gmac_pins_mii_a>;
> +	pinctrl-0 =3D <&gmac_pins_mii_a>,<&gmac_txerr_pin>;
>  	phy =3D <&phy1>;
>  	phy-mode =3D "mii";
>  	status =3D "okay";
> @@ -229,6 +229,11 @@
>  };
> =20
>  &pio {
> +	gmac_txerr_pin: gmac_txerr_pin@0 {
> +		pins =3D "PA17";
> +		function =3D "gpio_out"
> +	};
> +

You're not enforcing any level doing this. If you're using that pin as
TXERR, why not mux it to the gmac function and let the GMAC control it?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cyescndbqelclbfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnJS9AAoJEBx+YmzsjxAg1yYQAIYG70JdlnlsvME475O/0hqc
tAI8egUi2S36WQ787Yzmq1AQt/mb4rcPnexQyugIk6CTDq1WIvfZNs0BtF6l0cAG
cv9hjb5BBjK2ZPMuDYvBAT5SQN9apo+S9KaT+d8gXxTvDSIQCk/tyO/XQtkHzSzp
YIu+7iyBUiGEqR5RNvtv5v+uWvoABX3Nc58jr9ZQfCxNtgIR4X+3Z6d7nRsMRLwV
Kuru8Y8IojCdPe/Lz4SaL9tw2QQ/X5PTAy2uF9kPFLX1azrETykmEFMR9mu6tQSg
jNtfuOb/dh64/JMk8U8dMBi4n0c77OQ2Sofga2/KnYSSg4GgsvXnyBVpIsiiRkDC
BmtmxAYyGG1LgyZ/AXeXPQXf8PQz6LCUTrIDcT5xVP4BGIwZFmO1mFCNcQ1do4tb
3iAR+uqfyVRO6n6ZErUGF1F8ZOrct7l2iLN7JN8mSbZKwdFMEJzXE1FfUZOhEXRX
wKQfQ9zh11ul3zCx+6jSi4ZxB+IW7iGlc7JQDN14dPvp/9wXLZm6KlOj9ZlmzRPX
KKKnzc0ru70mdnHRY6jdTEFsAbeRF1Mufkp1F9ZTprsVOGBtkA8Jr5biR4j8+lcd
uI6SZmgYZVWPjg73y568dSo5KWpqrQQIbBQc1pJ6H17SskfDB3X3AXUMHRtVajLt
iGpKM64L8ZDOhg/T6crs
=tyxa
-----END PGP SIGNATURE-----

--cyescndbqelclbfq--
