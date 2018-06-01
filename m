From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: add support for Pinebook
Date: Fri, 1 Jun 2018 11:23:46 +0200
Message-ID: <20180601092346.g2iixqupumn7xo7r@flea>
References: <20180601062901.8052-1-anarsoul@gmail.com>
 <20180601062901.8052-4-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4375594781571520963=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180601062901.8052-4-anarsoul@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4375594781571520963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xmtexxisxezzvgt6"
Content-Disposition: inline


--xmtexxisxezzvgt6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2018 at 11:29:01PM -0700, Vasily Khoruzhick wrote:
> From: Icenowy Zheng <icenowy@aosc.xyz>
>=20
> Pinebook is a A64-based laptop produced by Pine64, with the following
> peripherals:
>=20
> USB:
> - Two external USB ports (one is directly connected to A64's OTG
> controller, the other is under a internal hub connected to the host-only
> controller.)
> - USB HID keyboard and touchpad connected to the internal hub.
> - USB UVC camera connected to the internal hub.
>=20
> Power-related:
> - A DC IN jack connected to AXP803's DCIN pin.
> - A Li-Polymer battery connected to AXP803's battery pins.
>=20
> Storage:
> - An eMMC by Foresee on the main board (in the product revision of the
> main board it's designed to be switchable).
> - An external MicroSD card slot.
>=20
> Display:
> - An eDP LCD panel (1366x768) connected via an ANX6345 RGB-eDP bridge.
> - A mini HDMI port.
>=20
> Misc:
> - A Hall sensor designed to detect the status of lid, connected to GPIO P=
L12.
> - A headphone jack connected to the SoC's internal codec.
> - A debug UART port muxed with headphone jack.
>=20
> This commit adds basical support for it.
>=20
> [vasily: squashed several commits into one, added simplefb node, added us=
bphy
> 	 to ehci0 and ohci0 nodes]
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-a64-pinebook.dts     | 285 ++++++++++++++++++
>  2 files changed, 286 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index 8bebe7da5ed9..a8c6d0c6f2c5 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-nanopi-a64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-olinuxino.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-orangepi-win.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb sun50i-a64-pine=
64.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinebook.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboard.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-teres-i.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch=
/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> new file mode 100644
> index 000000000000..d952db217702
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> @@ -0,0 +1,285 @@
> +/*
> + * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.xyz>
> + * Copyright (C) 2018 Vasily Khoruzhick <anarsoul@gmail.com>
> + *
> + * SPDX-License-Identifier: (GPL-2.0 OR MIT)

The SPDX tag should be the first one.

> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	model =3D "Pinebook";
> +	compatible =3D "pine64,pinebook", "allwinner,sun50i-a64";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		ethernet0 =3D &rtl8723cs;
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm 0 50000 0>;
> +		brightness-levels =3D <0 10 20 30 40 50 60 70 80 90 100>;

The perceived brightness should be increasing linearly. This usually
means that you need an function close to a power of two sequence.

> +		default-brightness-level =3D <2>;
> +		enable-gpios =3D <&pio 3 23 GPIO_ACTIVE_HIGH>; /* PD23 */
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +
> +		framebuffer-lcd {
> +			panel-supply =3D <&reg_dc1sw>;
> +			dvdd25-supply =3D <&reg_dldo2>;
> +			dvdd12-supply =3D <&reg_fldo1>;
> +		};
> +	};
> +
> +	gpio_keys {
> +		compatible =3D "gpio-keys";
> +
> +		lid_switch {
> +			label =3D "Lid Switch";
> +			gpios =3D <&r_pio 0 12 GPIO_ACTIVE_LOW>; /* PL12 */
> +			linux,input-type =3D <EV_SW>;
> +			linux,code =3D <SW_LID>;
> +			linux,can-disable;
> +		};
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +	};
> +};
> +
> +&ehci0 {
> +	phys =3D <&usbphy 0>;
> +	phy-names =3D "usb";
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins>;
> +	vmmc-supply =3D <&reg_dcdc1>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +	cd-inverted;
> +	disable-wp;
> +	bus-width =3D <4>;
> +	status =3D "okay";
> +};
> +
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins>;
> +	vmmc-supply =3D <&reg_dldo4>;
> +	vqmmc-supply =3D <&reg_eldo1>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	rtl8723cs: wifi@1 {
> +		reg =3D <1>;
> +	};
> +};
> +
> +&mmc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_pins>;
> +	vmmc-supply =3D <&reg_dcdc1>;
> +	vqmmc-supply =3D <&reg_eldo1>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	cap-mmc-hw-reset;
> +	mmc-hs200-1_8v;
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	phys =3D <&usbphy 0>;
> +	phy-names =3D "usb";
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&pwm {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pwm_pin>;
> +	status =3D "okay";
> +};
> +
> +&r_rsb {
> +	status =3D "okay";
> +
> +	axp803: pmic@3a3 {
> +		compatible =3D "x-powers,axp803";
> +		reg =3D <0x3a3>;
> +		interrupt-parent =3D <&r_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +/* The ANX6345 eDP-bridge is on r_i2c. There is no linux (mainline)
> + * driver for this chip at the moment, the bootloader initializes it.
> + * However it can be accessed with the i2c-dev driver from user space.
> + */

The comment format is wrong, and the part after r_i2c, about i2c-dev
and the mainline support is not really relevant. The DT describes the
hardware, and is used by several different projects that might or
might not have i2c-dev, an interface similar, or might have or not a
driver for the bridge.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--xmtexxisxezzvgt6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsREKEACgkQ0rTAlCFN
r3T0yQ/6A/6byZ2a9OwX/78jtZ4eQ71eSfo5ZUGh9U/dkK3z7HWsmeVQTZLy3mZ5
xrnhanc7cqmnrlY1YpSXWwVOxdFXzOktI9iItmMXAL8PBXbehubv4HDBBThLBlQH
PEP2pSCg9M2h/NLdYYylPlSf7eMr3/Qyc/JmlPWlpg9ZE7ztzkCx1T8fV5cVTMa4
81jnoFkMNbYKpz8AbwzJ4NUp1U99QVFLZZNa6vOJO9jK72BLFgD1jsH+mny+Fc2s
V1KtLXC0KhkHXG0X//Aoba+lNW07dc9hlgD5FhqM7jkwdMdshLkivcJvM2TS0a3q
3BtVeu4/Fwkej9KVqrHKS1mCnvQP/sHX5c0XKsCMd8mnIp8kzvWpDyj405oInGxx
CCaBs2nSrL0XQF7l4RPc47TBG+aP4NQJFWAB6MAVu4/ygOtKYLuOxB/smzPJD+IM
Ag6SUFLJ/NMuDsQZZsepLN1A6x75Bq0Xhut67XG2kySJMFaIYfF9R1opb5BYL8ZX
6/G9KgRS71h42XTs0AqPVXmR5tuFcG/Z3mE4ELwrjtjuM7wOD70tQi4cTwhwRaVQ
GLbucSW1v4pt7pz8C8830yEt15iR6JC3mVlfLWxocvBi1q8+RWAM6E0jF0hEhyK0
uBLacS0BTEiE75dW7YI7lesunSBBEvc/+i4LZsTP+eriCzeMLdw=
=XOKk
-----END PGP SIGNATURE-----

--xmtexxisxezzvgt6--


--===============4375594781571520963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4375594781571520963==--
