From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: dts: Add support for Turris Omnia
Date: Wed, 23 Nov 2016 09:19:23 +0100
Message-ID: <20161123081923.p5eqgxf33mtqiqza@perseus.defre.kleine-koenig.org>
References: <1479851991.26813.2@smtp.gmail.com>
 <1479859770-9375-1-git-send-email-tmshlvck@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d2yc7np2dspmto2k"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479859770-9375-1-git-send-email-tmshlvck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomas Hlavacek <tmshlvck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--d2yc7np2dspmto2k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Tomas,

calling it v4 would be nice.

On Wed, Nov 23, 2016 at 01:09:20AM +0100, Tomas Hlavacek wrote:
> Turris Omnia board by CZ.NIC:
>=20
>   * Marvell Armada 385 SoC
>   * 1 or 2 GB DDR3
>   * eMMC
>   * 8 MB SPI flash (U-Boot and rescue Linux image)
>   * 88E1514 PHY
>   * 88E6176 Ethernet switch (not supported)
>=20
> Supported board revision: CZ11NIC13 (production board).
>=20
> Signed-off-by: Tomas Hlavacek <tmshlvck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

As you picked my v3, you should keep my S-o-b.

> ---
> Changes since Uwe's version:
>=20
> - add MBUS regions (needed for Marvell CESA)
> - remove rtc disable (WFM with CZ11NIC13 =3D production board)

If I do

	mw 0xf10184a0 0xfd4d4cfa

in the boot loader, it seems to work for me, too. You don't need that?

> - cleanup comments
>=20
> Unsupported peripherals:
> - MV88E7176 switch
> - SFP
> - LEDs

LEDs is not that bad IMHO, because they work. You just cannot change
their function, but they blink according to their default trigger.
=20
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/armada-385-turris-omnia.dts | 279 ++++++++++++++++++++=
++++++
>  2 files changed, 280 insertions(+)
>  create mode 100644 arch/arm/boot/dts/armada-385-turris-omnia.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index befcd26..f1d3b9ff 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -920,6 +920,7 @@ dtb-$(CONFIG_MACH_ARMADA_38X) +=3D \
>  	armada-385-db-ap.dtb \
>  	armada-385-linksys-caiman.dtb \
>  	armada-385-linksys-cobra.dtb \
> +	armada-385-turris-omnia.dtb \
>  	armada-388-clearfog.dtb \
>  	armada-388-db.dtb \
>  	armada-388-gp.dtb \
> diff --git a/arch/arm/boot/dts/armada-385-turris-omnia.dts b/arch/arm/boo=
t/dts/armada-385-turris-omnia.dts
> new file mode 100644
> index 0000000..5ef3d62
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> @@ -0,0 +1,279 @@
> +/*
> + * Device Tree file for the Turris Omnia
> + * Schematic available at https://www.turris.cz/doc/_media/rtrom01-schem=
a.pdf
> + *
> + * Copyright (C) 2016 Uwe Kleine-K=F6nig <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> + * Copyright (C) 2016 Tomas Hlavacek <tmshlvkc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is licensed under the terms of the GNU General Public
> + *     License version 2.  This program is licensed "as is" without
> + *     any warranty of any kind, whether express or implied.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "armada-385.dtsi"
> +
> +/ {
> +	model =3D "Turris Omnia";
> +	compatible =3D "cznic,turris-omnia", "marvell,armada385", \
> +			"marvell,armada380";

You don't need a \ here AFAIK.

> +
> +	chosen {
> +		stdout-path =3D &uart0;
> +	};
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x40000000>; /* 1024 MB */
> +	};
> +
> +	soc {
> +		ranges =3D <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
> +			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000
> +			  MBUS_ID(0x09, 0x19) 0 0xf1100000 0x10000
> +			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000>;
> +
> +		internal-regs {
> +
> +			/* USB part of the PCIe2/USB 2.0 port */
> +			usb@58000 {
> +				status =3D "okay";
> +			};
> +
> +			sata@a8000 {
> +				status =3D "okay";
> +			};
> +
> +			sdhci@d8000 {
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&sdhci_pins>;
> +				status =3D "okay";
> +
> +				bus-width =3D <8>;
> +				no-1-8-v;
> +				non-removable;
> +			};
> +
> +			usb3@f0000 {
> +				status =3D "okay";
> +			};
> +
> +			usb3@f8000 {
> +				status =3D "okay";
> +			};
> +		};
> +
> +		pcie-controller {
> +			status =3D "okay";
> +
> +			pcie@1,0 {
> +				/* Port 0, Lane 0 */
> +				status =3D "okay";
> +			};
> +
> +			pcie@2,0 {
> +				/* Port 1, Lane 0 */
> +				status =3D "okay";
> +			};
> +
> +			pcie@3,0 {
> +				/* Port 2, Lane 0 */
> +				status =3D "okay";
> +			};
> +		};
> +	};
> +};
> +
> +/* Connected to 88E6176 switch, port 6 */
> +&eth0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ge0_rgmii_pins>;
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-id";
> +
> +	fixed-link {
> +		speed =3D <1000>;
> +		full-duplex;
> +	};
> +};
> +
> +/* Connected to 88E6176 switch, port 5 */
> +&eth1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ge1_rgmii_pins>;
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-id";
> +
> +	fixed-link {
> +		speed =3D <1000>;
> +		full-duplex;
> +	};
> +};
> +
> +/* WAN port */
> +&eth2 {
> +	status =3D "okay";
> +	phy-mode =3D "sgmii";
> +	phy =3D <&phy1>;
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins>;
> +	status =3D "okay";
> +
> +	i2cmux@70 {
> +		compatible =3D "nxp,pca9547";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x70>;
> +		status =3D "okay";
> +
> +		i2c@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0>;
> +			status =3D "okay";
> +
> +			/* STM32F0 command interface at address 0x2a.
> +			 * STM32F0 LED interface at address 0x2b.
> +			 */

Should this better be:

			/*
			 * STM32F0 command interface at address 0x2a.
			 * STM32F0 LED interface at address 0x2b.
			 */

As is recommended for comments in .c?

> +
> +			eeprom@54 {
> +				compatible =3D "at,24c64";
> +				reg =3D <0x54>;
> +
> +				/* The EEPROM contains data for bootloader.
> +				 * Contents:
> +				 *	struct omnia_eeprom {
> +				 *		u32 magic; (=3D0x0341a034)
> +				 *		u32 ramsize;
ramsize in GiB?

> +				 *		char region[4] (=3D0x0);
This is for the WLAN regdomain, right?

> +				 *		u32 crc32;
> +				 *	};
> +				 */
ditto for the comment format.

> +			};
> +		};
> +
> +		/* Channel 1: Routed to PCIe0/mSATA connector (CN7A).
> +		 * Channel 2: Routed to PCIe1/USB2 connector (CN61A).
> +		 * Channel 3: Routed to PCIe2 connector (CN62A).
> +		 * Channel 4: Routed to SFP+.
> +		 * Channel 5: ATSHA204A at address 0x64.
> +		 * Channel 6: Routed to user pin header CN11.
> +		 */
I'd like to keep the busses as Andrew already pointed out. For example
this might make it possible to use i2c-tools to read out the mac address
=66rom the ATSHA.

> +		i2c@7 {
> +			/* GPIO expander for SFP+ signals */
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <7>;
> +
> +			wangpio: gpio@71 {
> +				compatible =3D "nxp,pca9538";
> +				reg =3D <0x71>;
> +				interrupt-parent =3D <&gpio1>;
> +				interrupts =3D <14 IRQ_TYPE_LEVEL_LOW>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mdio_pins>;
> +	status =3D "okay";
> +
> +	phy1: phy@1 {
> +		status =3D "okay";
> +		compatible =3D "ethernet-phy-id0141.0DD1", \
> +				"ethernet-phy-ieee802.3-c22";

Drop the \

> +		reg =3D <1>;
> +		/* IRQ is connected to PCA9538 pin 7. Currently it
> +		 * can not be utilized.
> +		 */
> +	};
> +
> +	/* Switch MV88E7176 at address 0x10. */
> +};
> +
> +&pinctrl {
> +	spi0cs1_pins: spi0-pins-0cs1 {
> +		marvell,pins =3D "mpp26";
> +		marvell,function =3D "spi0";
> +	};

Why did you drop the pcawan pinctrl?

> +};
> +
> +&spi0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi0_pins &spi0cs1_pins>;

Oh, this is wrong (already in my patch): this is cs0 not cs1.

> +	status =3D "okay";
> +
> +	spi-nor@0 {
> +		compatible =3D "spansion,s25fl164k", "jedec,spi-nor";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		reg =3D <0>;
> +		spi-max-frequency =3D <40000000>;
> +
> +		partition@0 {
> +			reg =3D <0x0 0x00100000>;
> +			label =3D "U-Boot";
> +		};
> +
> +		partition@1 {
> +			reg =3D <0x00100000 0x00700000>;
> +			label =3D "Rescue system";
> +		};
> +	};
> +
> +	/* SPI0 + CS1 (MPP26) is routed to a pin header CN11. */

Looks strange. What about

	/* MISO, MOSI, SCLK and CS1 are routed to pin header CN11 */

Maybe also add the node for this pin to &pinctrl, but don't use it in
&spi0.pinctrl-0? This would nicely document the MPP26 part.

> +};
> +
> +&uart0 {
> +	/* Pin header CN10. */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins>;
> +	status =3D "okay";
> +};
> +
> +&uart1 {
> +	/* Pin header CN11. */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart1_pins>;
> +	status =3D "okay";
> +};
> +

Trailing new line

Best regards
Uwe

--d2yc7np2dspmto2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAlg1UQgACgkQwfwUeK3K
7AlfuQf6As4q4sgZTvvj/2JP0fXqfvM6ZVYe7Eiv6SQUdtsc1S7dL1bXwnU6YAuF
vTo+JyHelW3NzsRUiQkIZEfZKb6zv50ivQ22ZUZ5XG0YPAMeH/LYhCKFqNl/DbV/
2aNSi7wsfW2QSKd2s71dxjU2AHdlcyNSdXATE1XPJFm1APR6Y/u6a7HTnMHTkFbQ
pFa6JNeZJWhOnaLe8IC/VG059PRqfxrgf0dayEvuz6gepY3IEEgHW2jIKryuUW0o
f0IiG+QKInmI75J+YixHDLAxBW2fYDwlHyIwS5OWg3vRs9ElDm2yEiw6KoCg8dqu
YheP7zQDRo8fEYE5o/cFyGNhphIxRg==
=taWq
-----END PGP SIGNATURE-----

--d2yc7np2dspmto2k--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
