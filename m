From: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: kirkwood: add Seagate GoFlex Home
Date: Thu, 5 Nov 2015 10:20:55 +0100
Message-ID: <20151105092055.GL4665@kw.sim.vm.gnt>
References: <1446675888-24495-1-git-send-email-luka.perkov@sartura.hr>
 <00000150d49a8745-1c2bc8d4-1333-46bb-bf0e-5508ef988c73-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E6lVPAHcXg6biC3t"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00000150d49a8745-1c2bc8d4-1333-46bb-bf0e-5508ef988c73-000000-p/GC64/jrecnJqMo6gzdpkEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luka Perkov <luka.perkov-RnoqsreqS2Fd2+I6+x7OVA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yoann Sculo <yoann-SEL7PEOQfnBQFI55V6+gNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--E6lVPAHcXg6biC3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luka,

On Wed, Nov 04, 2015 at 10:25:08PM +0000, Luka Perkov wrote:
> Based on dts files from OpenWrt.
>=20
> Signed-off-by: Luka Perkov <luka.perkov-RnoqsreqS2Fd2+I6+x7OVA@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/marvell,kirkwood.txt   |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/kirkwood-goflexhome.dts          | 127 +++++++++++++++=
++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 arch/arm/boot/dts/kirkwood-goflexhome.dts
>=20
> diff --git a/Documentation/devicetree/bindings/arm/marvell,kirkwood.txt b=
/Documentation/devicetree/bindings/arm/marvell,kirkwood.txt
> index ed381a3..37bd190 100644
> --- a/Documentation/devicetree/bindings/arm/marvell,kirkwood.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell,kirkwood.txt
> @@ -72,6 +72,7 @@ board. Currently known boards are:
>  "raidsonic,ib-nas6220-b"
>  "raidsonic,ib-nas62x0"
>  "seagate,dockstar"
> +"seagate,goflexhome"
>  "seagate,goflexnet"
>  "synology,ds109"
>  "synology,ds110jv10"
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ebe5b73..1d6fb0d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -170,6 +170,7 @@ dtb-$(CONFIG_MACH_KIRKWOOD) +=3D \
>  	kirkwood-ds411slim.dtb \
>  	kirkwood-ea3500.dtb \
>  	kirkwood-ea4500.dtb \
> +	kirkwood-goflexhome.dtb \
>  	kirkwood-goflexnet.dtb \
>  	kirkwood-guruplug-server-plus.dtb \
>  	kirkwood-ib62x0.dtb \
> diff --git a/arch/arm/boot/dts/kirkwood-goflexhome.dts b/arch/arm/boot/dt=
s/kirkwood-goflexhome.dts
> new file mode 100644
> index 0000000..5f933d4
> --- /dev/null
> +++ b/arch/arm/boot/dts/kirkwood-goflexhome.dts
> @@ -0,0 +1,127 @@
> +/dts-v1/;
> +
> +#include "kirkwood.dtsi"
> +#include "kirkwood-6281.dtsi"
> +
> +/ {
> +	model =3D "Seagate GoFlex Home";
> +	compatible =3D "seagate,goflexhome", "marvell,kirkwood-88f6281", "marve=
ll,kirkwood";
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x8000000>;
> +	};
> +
> +	chosen {
> +		bootargs =3D "console=3DttyS0,115200n8 earlyprintk root=3D/dev/sda1 ro=
otdelay=3D10";
> +		stdout-path =3D &uart0;
> +	};
> +
> +	ocp@f1000000 {
> +		pinctrl: pin-controller@10000 {
> +			pmx_usb_power_enable: pmx-usb-power-enable {
> +				marvell,pins =3D "mpp29";
> +				marvell,function =3D "gpio";
> +			};
> +			pmx_led_white: pmx-led-white {
> +				marvell,pins =3D "mpp40";
> +				marvell,function =3D "gpio";
> +			};
> +			pmx_led_green: pmx-led_green {
> +				marvell,pins =3D "mpp46";
> +				marvell,function =3D "gpio";
> +			};
> +			pmx_led_orange: pmx-led-orange {
> +				marvell,pins =3D "mpp47";
> +				marvell,function =3D "gpio";
> +			};
> +		};
> +		serial@12000 {
> +			status =3D "ok";
> +		};
> +
> +		sata@80000 {
> +			status =3D "okay";
> +			nr-ports =3D <2>;

I think nr-ports should be set to 1. This device only allows to plug a
single HDD and there is no eSATA connectors.

> +		};
> +
> +	};
> +	gpio-leds {
> +		compatible =3D "gpio-leds";
> +
> +		health {
> +			label =3D "status:green:health";
> +			gpios =3D <&gpio1 14 1>;

It would be better to use GPIO_ACTIVE_LOW instead of 1. The same comment
applies to the other LEDs.

> +			linux,default-trigger =3D "default-on";
> +		};
> +		fault {
> +			label =3D "status:orange:fault";
> +			gpios =3D <&gpio1 15 1>;
> +		};
> +		misc {
> +			label =3D "status:white:misc";
> +			gpios =3D <&gpio1 8 1>;
> +			linux,default-trigger =3D "ide-disk";

ide-disk ? Really ? There is no way this can be correct :)

> +		};
> +	};
> +	regulators {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		pinctrl-0 =3D <&pmx_usb_power_enable>;
> +		pinctrl-names =3D "default";
> +
> +		usb_power: regulator@1 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <1>;
> +			regulator-name =3D "USB Power";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			enable-active-high;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			gpio =3D <&gpio0 29 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +};
> +
> +&nand {
> +	chip-delay =3D <40>;
> +	status =3D "okay";
> +
> +	partition@0 {
> +		label =3D "u-boot";
> +		reg =3D <0x0000000 0x100000>;
> +		read-only;
> +	};
> +
> +	partition@100000 {
> +		label =3D "uImage";
> +		reg =3D <0x0100000 0x400000>;
> +	};
> +
> +	partition@500000 {
> +		label =3D "pogoplug";
> +		reg =3D <0x0500000 0x2000000>;
> +	};
> +
> +	partition@2500000 {
> +		label =3D "root";
> +		reg =3D <0x02500000 0xd800000>;
> +	};
> +};
> +
> +&mdio {
> +	status =3D "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		reg =3D <0>;
> +	};
> +};
> +
> +&eth0 {
> +	status =3D "okay";
> +	ethernet0-port@0 {
> +		phy-handle =3D <&ethphy0>;
> +	};
> +};

Is there a power-off GPIO on this board ?

Regards,

Simon

--E6lVPAHcXg6biC3t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlY7H3cACgkQgtp0PDeOcDq6RwCeIMMJ6eNEWPfbwEDU2LEdivWy
MeoAn28lr7+yVsshm9FPwq/Rlz01X5cC
=zjZY
-----END PGP SIGNATURE-----

--E6lVPAHcXg6biC3t--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
