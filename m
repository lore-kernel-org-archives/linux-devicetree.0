Return-Path: <SRS0=SZgs=WY=bootlin.com=gregory.clement@kernel.org>
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH mvebu-dt64 3/3] arm64: dts: marvell: add DTS for Turris Mox
In-Reply-To: <20190827151644.12532-4-marek.behun@nic.cz>
References: <20190827151644.12532-1-marek.behun@nic.cz> <20190827151644.12532-4-marek.behun@nic.cz>
Date: Wed, 28 Aug 2019 12:26:08 +0200
Message-ID: <8736hlziv3.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Marek =?utf-8?Q?Beh=C3=BAn?= <marek.behun@nic.cz>, arm@kernel.org, Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Marek,

> This adds support for the Turris Mox board from CZ.NIC.
>
> Turris Mox is as modular router based on the Armada 3720 SOC (same as
> EspressoBin).
>
> The basic board can be extended by different modules.
> If those are connected, U-Boot lets the kernel know via device-tree.
>
> Since modules can be connected in different order and some modules can
> be connected multiple times (up to three modules containing 8-port
> ethernet switch in DSA configuration can be connected) we decided
> against using device-tree overlays, because it got complicated rather
> quickly. (For example the SFP module can be connected directly to the
> CPU, or after a switch module. There are four cases and all would need
> different SFP overlay. There are two types of switch modules (8-port
> with pass-through and 4-port with no pass-through). For those we would
> again need at least 6 more overlays.)
>
> We therefore decided to put all the possibly connected devices in one
> device-tree and disable them by default. When U-Boot finds out which
> modules are connected, it fixes the loaded device-tree accordingly just
> before boot. By Rob Herring's suggestion we also made it so that U-Boot
> completely removes nodes which are disabled after this fixup.
>

This device tree looks sane for me I didn't see any issue, however I
would like to have the review from Andrew who know better all the switch
part.

Thanks,

Gregory

> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/arm64/boot/dts/marvell/Makefile          |   1 +
>  .../dts/marvell/armada-3720-turris-mox.dts    | 841 ++++++++++++++++++
>  2 files changed, 842 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
>
> diff --git a/arch/arm64/boot/dts/marvell/Makefile b/arch/arm64/boot/dts/m=
arvell/Makefile
> index caed4334f27d..243338c914a4 100644
> --- a/arch/arm64/boot/dts/marvell/Makefile
> +++ b/arch/arm64/boot/dts/marvell/Makefile
> @@ -2,6 +2,7 @@
>  # Mvebu SoC Family
>  dtb-$(CONFIG_ARCH_MVEBU) +=3D armada-3720-db.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) +=3D armada-3720-espressobin.dtb
> +dtb-$(CONFIG_ARCH_MVEBU) +=3D armada-3720-turris-mox.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) +=3D armada-3720-uDPU.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) +=3D armada-7040-db.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) +=3D armada-8040-clearfog-gt-8k.dtb
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arc=
h/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> new file mode 100644
> index 000000000000..32ed2bbdab27
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> @@ -0,0 +1,841 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree file for CZ.NIC Turris Mox Board
> + * 2019 by Marek Behun <marek.behun@nic.cz>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/bus/moxtet.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "armada-372x.dtsi"
> +
> +/ {
> +	model =3D "CZ.NIC Turris Mox Board";
> +	compatible =3D "cznic,turris-mox", "marvell,armada3720",
> +		     "marvell,armada3710";
> +
> +	aliases {
> +		spi0 =3D &spi0;
> +		ethernet1 =3D &eth1;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x00000000 0x00000000 0x20000000>;
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		red {
> +			gpios =3D <&gpiosb 21 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "default-on";
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		reset {
> +			label =3D "reset";
> +			linux,code =3D <BTN_MISC>;
> +			gpios =3D <&gpiosb 20 GPIO_ACTIVE_LOW>;
> +			debounce-interval =3D <60>;
> +		};
> +	};
> +
> +	exp_usb3_vbus: usb3-vbus {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb3-vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		enable-active-high;
> +		regulator-always-on;
> +		gpio =3D <&gpiosb 0 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	usb3_phy: usb3-phy {
> +		compatible =3D "usb-nop-xceiv";
> +		vcc-supply =3D <&exp_usb3_vbus>;
> +	};
> +
> +	vsdc_reg: vsdc-reg {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "vsdc";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-boot-on;
> +
> +		gpios =3D <&gpiosb 23 GPIO_ACTIVE_HIGH>;
> +		gpios-states =3D <0>;
> +		states =3D <1800000 0x1
> +			  3300000 0x0>;
> +		enable-active-high;
> +	};
> +
> +	vsdio_reg: vsdio-reg {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "vsdio";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-boot-on;
> +
> +		gpios =3D <&gpiosb 22 GPIO_ACTIVE_HIGH>;
> +		gpios-states =3D <0>;
> +		states =3D <1800000 0x1
> +			  3300000 0x0>;
> +		enable-active-high;
> +	};
> +
> +	sdhci1_pwrseq: sdhci1-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&gpionb 19 GPIO_ACTIVE_HIGH>;
> +		status =3D "okay";
> +	};
> +
> +	sfp: sfp {
> +		compatible =3D "sff,sfp+";
> +		i2c-bus =3D <&i2c0>;
> +		los-gpio =3D <&moxtet_sfp 0 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpio =3D <&moxtet_sfp 1 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpio =3D <&moxtet_sfp 2 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpio =3D <&moxtet_sfp 4 GPIO_ACTIVE_HIGH>;
> +		rate-select0-gpio =3D <&moxtet_sfp 5 GPIO_ACTIVE_HIGH>;
> +
> +		/* enabled by U-Boot if SFP module is present */
> +		status =3D "disabled";
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_pins>;
> +	status =3D "okay";
> +
> +	rtc@6f {
> +		compatible =3D "microchip,mcp7940x";
> +		reg =3D <0x6f>;
> +	};
> +};
> +
> +&pcie_reset_pins {
> +	function =3D "gpio";
> +};
> +
> +&pcie0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie_reset_pins &pcie_clkreq_pins>;
> +	status =3D "okay";
> +	max-link-speed =3D <2>;
> +	reset-gpios =3D <&gpiosb 3 GPIO_ACTIVE_LOW>;
> +	phys =3D <&comphy1 0>;
> +
> +	/* enabled by U-Boot if PCIe module is present */
> +	status =3D "disabled";
> +};
> +
> +&uart0 {
> +	status =3D "okay";
> +};
> +
> +&eth0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rgmii_pins>;
> +	phy-mode =3D "rgmii-id";
> +	phy =3D <&phy1>;
> +	status =3D "okay";
> +};
> +
> +&eth1 {
> +	phy-mode =3D "2500base-x";
> +	managed =3D "in-band-status";
> +	phys =3D <&comphy0 1>;
> +
> +	/* enabled by U-Boot if switch or SFP module is present */
> +	status =3D "disabled";
> +};
> +
> +&sdhci0 {
> +	wp-inverted;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpionb 10 GPIO_ACTIVE_HIGH>;
> +	vqmmc-supply =3D <&vsdc_reg>;
> +	marvell,pad-type =3D "sd";
> +	status =3D "okay";
> +};
> +
> +&sdhci1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdio_pins>;
> +	non-removable;
> +	bus-width =3D <4>;
> +	marvell,pad-type =3D "sd";
> +	vqmmc-supply =3D <&vsdio_reg>;
> +	mmc-pwrseq =3D <&sdhci1_pwrseq>;
> +	status =3D "okay";
> +};
> +
> +&spi0 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi_quad_pins &spi_cs1_pins>;
> +	assigned-clocks =3D <&nb_periph_clk 7>;
> +	assigned-clock-parents =3D <&tbg 1>;
> +	assigned-clock-rates =3D <20000000>;
> +
> +	spi-flash@0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <20000000>;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			partition@0 {
> +				label =3D "secure-firmware";
> +				reg =3D <0x0 0x20000>;
> +			};
> +
> +			partition@20000 {
> +				label =3D "u-boot";
> +				reg =3D <0x20000 0x160000>;
> +			};
> +
> +			partition@180000 {
> +				label =3D "u-boot-env";
> +				reg =3D <0x180000 0x10000>;
> +			};
> +
> +			partition@190000 {
> +				label =3D "Rescue system";
> +				reg =3D <0x190000 0x660000>;
> +			};
> +
> +			partition@7f0000 {
> +				label =3D "dtb";
> +				reg =3D <0x7f0000 0x10000>;
> +			};
> +		};
> +	};
> +
> +	moxtet: moxtet@1 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "cznic,moxtet";
> +		reg =3D <1>;
> +		reset-gpios =3D <&gpiosb 2 GPIO_ACTIVE_LOW>;
> +		spi-max-frequency =3D <10000000>;
> +		spi-cpol;
> +		spi-cpha;
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +		interrupt-parent =3D <&gpiosb>;
> +		interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;
> +		status =3D "okay";
> +
> +		moxtet_sfp: gpio@0 {
> +			compatible =3D "cznic,moxtet-gpio";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			reg =3D <0>;
> +			status =3D "disabled";
> +		};
> +	};
> +};
> +
> +&usb2 {
> +	status =3D "okay";
> +};
> +
> +&usb3 {
> +	status =3D "okay";
> +	phys =3D <&comphy2 0>;
> +	usb-phy =3D <&usb3_phy>;
> +};
> +
> +&mdio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&smi_pins>;
> +	status =3D "okay";
> +
> +	phy1: ethernet-phy@1 {
> +		reg =3D <1>;
> +	};
> +
> +	/* switch nodes are enabled by U-Boot if modules are present */
> +	switch0@10 {
> +		compatible =3D "marvell,mv88e6190";
> +		reg =3D <0x10 0>;
> +		dsa,member =3D <0 0>;
> +		interrupt-parent =3D <&moxtet>;
> +		interrupts =3D <MOXTET_IRQ_PERIDOT(0)>;
> +		status =3D "disabled";
> +
> +		mdio {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			switch0phy1: switch0phy1@1 {
> +				reg =3D <0x1>;
> +			};
> +
> +			switch0phy2: switch0phy2@2 {
> +				reg =3D <0x2>;
> +			};
> +
> +			switch0phy3: switch0phy3@3 {
> +				reg =3D <0x3>;
> +			};
> +
> +			switch0phy4: switch0phy4@4 {
> +				reg =3D <0x4>;
> +			};
> +
> +			switch0phy5: switch0phy5@5 {
> +				reg =3D <0x5>;
> +			};
> +
> +			switch0phy6: switch0phy6@6 {
> +				reg =3D <0x6>;
> +			};
> +
> +			switch0phy7: switch0phy7@7 {
> +				reg =3D <0x7>;
> +			};
> +
> +			switch0phy8: switch0phy8@8 {
> +				reg =3D <0x8>;
> +			};
> +		};
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@1 {
> +				reg =3D <0x1>;
> +				label =3D "lan1";
> +				phy-handle =3D <&switch0phy1>;
> +			};
> +
> +			port@2 {
> +				reg =3D <0x2>;
> +				label =3D "lan2";
> +				phy-handle =3D <&switch0phy2>;
> +			};
> +
> +			port@3 {
> +				reg =3D <0x3>;
> +				label =3D "lan3";
> +				phy-handle =3D <&switch0phy3>;
> +			};
> +
> +			port@4 {
> +				reg =3D <0x4>;
> +				label =3D "lan4";
> +				phy-handle =3D <&switch0phy4>;
> +			};
> +
> +			port@5 {
> +				reg =3D <0x5>;
> +				label =3D "lan5";
> +				phy-handle =3D <&switch0phy5>;
> +			};
> +
> +			port@6 {
> +				reg =3D <0x6>;
> +				label =3D "lan6";
> +				phy-handle =3D <&switch0phy6>;
> +			};
> +
> +			port@7 {
> +				reg =3D <0x7>;
> +				label =3D "lan7";
> +				phy-handle =3D <&switch0phy7>;
> +			};
> +
> +			port@8 {
> +				reg =3D <0x8>;
> +				label =3D "lan8";
> +				phy-handle =3D <&switch0phy8>;
> +			};
> +
> +			port@9 {
> +				reg =3D <0x9>;
> +				label =3D "cpu";
> +				ethernet =3D <&eth1>;
> +				phy-mode =3D "2500base-x";
> +				managed =3D "in-band-status";
> +			};
> +
> +			switch0port10: port@a {
> +				reg =3D <0xa>;
> +				label =3D "dsa";
> +				phy-mode =3D "2500base-x";
> +				managed =3D "in-band-status";
> +				link =3D <&switch1port9 &switch2port9>;
> +				status =3D "disabled";
> +			};
> +
> +			port-sfp@a {
> +				reg =3D <0xa>;
> +				label =3D "sfp";
> +				sfp =3D <&sfp>;
> +				phy-mode =3D "sgmii";
> +				managed =3D "in-band-status";
> +				status =3D "disabled";
> +			};
> +		};
> +	};
> +
> +	switch0@2 {
> +		compatible =3D "marvell,mv88e6085";
> +		reg =3D <0x2 0>;
> +		dsa,member =3D <0 0>;
> +		interrupt-parent =3D <&moxtet>;
> +		interrupts =3D <MOXTET_IRQ_TOPAZ>;
> +		status =3D "disabled";
> +
> +		mdio {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			switch0phy1_topaz: switch0phy1@11 {
> +				reg =3D <0x11>;
> +			};
> +
> +			switch0phy2_topaz: switch0phy2@12 {
> +				reg =3D <0x12>;
> +			};
> +
> +			switch0phy3_topaz: switch0phy3@13 {
> +				reg =3D <0x13>;
> +			};
> +
> +			switch0phy4_topaz: switch0phy4@14 {
> +				reg =3D <0x14>;
> +			};
> +		};
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@1 {
> +				reg =3D <0x1>;
> +				label =3D "lan1";
> +				phy-handle =3D <&switch0phy1_topaz>;
> +			};
> +
> +			port@2 {
> +				reg =3D <0x2>;
> +				label =3D "lan2";
> +				phy-handle =3D <&switch0phy2_topaz>;
> +			};
> +
> +			port@3 {
> +				reg =3D <0x3>;
> +				label =3D "lan3";
> +				phy-handle =3D <&switch0phy3_topaz>;
> +			};
> +
> +			port@4 {
> +				reg =3D <0x4>;
> +				label =3D "lan4";
> +				phy-handle =3D <&switch0phy4_topaz>;
> +			};
> +
> +			port@5 {
> +				reg =3D <0x5>;
> +				label =3D "cpu";
> +				phy-mode =3D "2500base-x";
> +				managed =3D "in-band-status";
> +				ethernet =3D <&eth1>;
> +			};
> +		};
> +	};
> +
> +	switch1@11 {
> +		compatible =3D "marvell,mv88e6190";
> +		reg =3D <0x11 0>;
> +		dsa,member =3D <0 1>;
> +		interrupt-parent =3D <&moxtet>;
> +		interrupts =3D <MOXTET_IRQ_PERIDOT(1)>;
> +		status =3D "disabled";
> +
> +		mdio {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			switch1phy1: switch1phy1@1 {
> +				reg =3D <0x1>;
> +			};
> +
> +			switch1phy2: switch1phy2@2 {
> +				reg =3D <0x2>;
> +			};
> +
> +			switch1phy3: switch1phy3@3 {
> +				reg =3D <0x3>;
> +			};
> +
> +			switch1phy4: switch1phy4@4 {
> +				reg =3D <0x4>;
> +			};
> +
> +			switch1phy5: switch1phy5@5 {
> +				reg =3D <0x5>;
> +			};
> +
> +			switch1phy6: switch1phy6@6 {
> +				reg =3D <0x6>;
> +			};
> +
> +			switch1phy7: switch1phy7@7 {
> +				reg =3D <0x7>;
> +			};
> +
> +			switch1phy8: switch1phy8@8 {
> +				reg =3D <0x8>;
> +			};
> +		};
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@1 {
> +				reg =3D <0x1>;
> +				label =3D "lan9";
> +				phy-handle =3D <&switch1phy1>;
> +			};
> +
> +			port@2 {
> +				reg =3D <0x2>;
> +				label =3D "lan10";
> +				phy-handle =3D <&switch1phy2>;
> +			};
> +
> +			port@3 {
> +				reg =3D <0x3>;
> +				label =3D "lan11";
> +				phy-handle =3D <&switch1phy3>;
> +			};
> +
> +			port@4 {
> +				reg =3D <0x4>;
> +				label =3D "lan12";
> +				phy-handle =3D <&switch1phy4>;
> +			};
> +
> +			port@5 {
> +				reg =3D <0x5>;
> +				label =3D "lan13";
> +				phy-handle =3D <&switch1phy5>;
> +			};
> +
> +			port@6 {
> +				reg =3D <0x6>;
> +				label =3D "lan14";
> +				phy-handle =3D <&switch1phy6>;
> +			};
> +
> +			port@7 {
> +				reg =3D <0x7>;
> +				label =3D "lan15";
> +				phy-handle =3D <&switch1phy7>;
> +			};
> +
> +			port@8 {
> +				reg =3D <0x8>;
> +				label =3D "lan16";
> +				phy-handle =3D <&switch1phy8>;
> +			};
> +
> +			switch1port9: port@9 {
> +				reg =3D <0x9>;
> +				label =3D "dsa";
> +				phy-mode =3D "2500base-x";
> +				managed =3D "in-band-status";
> +				link =3D <&switch0port10>;
> +			};
> +
> +			switch1port10: port@a {
> +				reg =3D <0xa>;
> +				label =3D "dsa";
> +				phy-mode =3D "2500base-x";
> +				managed =3D "in-band-status";
> +				link =3D <&switch2port9>;
> +				status =3D "disabled";
> +			};
> +
> +			port-sfp@a {
> +				reg =3D <0xa>;
> +				label =3D "sfp";
> +				sfp =3D <&sfp>;
> +				phy-mode =3D "sgmii";
> +				managed =3D "in-band-status";
> +				status =3D "disabled";
> +			};
> +		};
> +	};
> +
> +	switch1@2 {
> +		compatible =3D "marvell,mv88e6085";
> +		reg =3D <0x2 0>;
> +		dsa,member =3D <0 1>;
> +		interrupt-parent =3D <&moxtet>;
> +		interrupts =3D <MOXTET_IRQ_TOPAZ>;
> +		status =3D "disabled";
> +
> +		mdio {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			switch1phy1_topaz: switch1phy1@11 {
> +				reg =3D <0x11>;
> +			};
> +
> +			switch1phy2_topaz: switch1phy2@12 {
> +				reg =3D <0x12>;
> +			};
> +
> +			switch1phy3_topaz: switch1phy3@13 {
> +				reg =3D <0x13>;
> +			};
> +
> +			switch1phy4_topaz: switch1phy4@14 {
> +				reg =3D <0x14>;
> +			};
> +		};
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@1 {
> +				reg =3D <0x1>;
> +				label =3D "lan9";
> +				phy-handle =3D <&switch1phy1_topaz>;
> +			};
> +
> +			port@2 {
> +				reg =3D <0x2>;
> +				label =3D "lan10";
> +				phy-handle =3D <&switch1phy2_topaz>;
> +			};
> +
> +			port@3 {
> +				reg =3D <0x3>;
> +				label =3D "lan11";
> +				phy-handle =3D <&switch1phy3_topaz>;
> +			};
> +
> +			port@4 {
> +				reg =3D <0x4>;
> +				label =3D "lan12";
> +				phy-handle =3D <&switch1phy4_topaz>;
> +			};
> +
> +			port@5 {
> +				reg =3D <0x5>;
> +				label =3D "dsa";
> +				phy-mode =3D "2500base-x";
> +				managed =3D "in-band-status";
> +				link =3D <&switch0port10>;
> +			};
> +		};
> +	};
> +
> +	switch2@12 {
> +		compatible =3D "marvell,mv88e6190";
> +		reg =3D <0x12 0>;
> +		dsa,member =3D <0 2>;
> +		interrupt-parent =3D <&moxtet>;
> +		interrupts =3D <MOXTET_IRQ_PERIDOT(2)>;
> +		status =3D "disabled";
> +
> +		mdio {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			switch2phy1: switch2phy1@1 {
> +				reg =3D <0x1>;
> +			};
> +
> +			switch2phy2: switch2phy2@2 {
> +				reg =3D <0x2>;
> +			};
> +
> +			switch2phy3: switch2phy3@3 {
> +				reg =3D <0x3>;
> +			};
> +
> +			switch2phy4: switch2phy4@4 {
> +				reg =3D <0x4>;
> +			};
> +
> +			switch2phy5: switch2phy5@5 {
> +				reg =3D <0x5>;
> +			};
> +
> +			switch2phy6: switch2phy6@6 {
> +				reg =3D <0x6>;
> +			};
> +
> +			switch2phy7: switch2phy7@7 {
> +				reg =3D <0x7>;
> +			};
> +
> +			switch2phy8: switch2phy8@8 {
> +				reg =3D <0x8>;
> +			};
> +		};
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@1 {
> +				reg =3D <0x1>;
> +				label =3D "lan17";
> +				phy-handle =3D <&switch2phy1>;
> +			};
> +
> +			port@2 {
> +				reg =3D <0x2>;
> +				label =3D "lan18";
> +				phy-handle =3D <&switch2phy2>;
> +			};
> +
> +			port@3 {
> +				reg =3D <0x3>;
> +				label =3D "lan19";
> +				phy-handle =3D <&switch2phy3>;
> +			};
> +
> +			port@4 {
> +				reg =3D <0x4>;
> +				label =3D "lan20";
> +				phy-handle =3D <&switch2phy4>;
> +			};
> +
> +			port@5 {
> +				reg =3D <0x5>;
> +				label =3D "lan21";
> +				phy-handle =3D <&switch2phy5>;
> +			};
> +
> +			port@6 {
> +				reg =3D <0x6>;
> +				label =3D "lan22";
> +				phy-handle =3D <&switch2phy6>;
> +			};
> +
> +			port@7 {
> +				reg =3D <0x7>;
> +				label =3D "lan23";
> +				phy-handle =3D <&switch2phy7>;
> +			};
> +
> +			port@8 {
> +				reg =3D <0x8>;
> +				label =3D "lan24";
> +				phy-handle =3D <&switch2phy8>;
> +			};
> +
> +			switch2port9: port@9 {
> +				reg =3D <0x9>;
> +				label =3D "dsa";
> +				phy-mode =3D "2500base-x";
> +				managed =3D "in-band-status";
> +				link =3D <&switch1port10 &switch0port10>;
> +			};
> +
> +			port-sfp@a {
> +				reg =3D <0xa>;
> +				label =3D "sfp";
> +				sfp =3D <&sfp>;
> +				phy-mode =3D "sgmii";
> +				managed =3D "in-band-status";
> +				status =3D "disabled";
> +			};
> +		};
> +	};
> +
> +	switch2@2 {
> +		compatible =3D "marvell,mv88e6085";
> +		reg =3D <0x2 0>;
> +		dsa,member =3D <0 2>;
> +		interrupt-parent =3D <&moxtet>;
> +		interrupts =3D <MOXTET_IRQ_TOPAZ>;
> +		status =3D "disabled";
> +
> +		mdio {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			switch2phy1_topaz: switch2phy1@11 {
> +				reg =3D <0x11>;
> +			};
> +
> +			switch2phy2_topaz: switch2phy2@12 {
> +				reg =3D <0x12>;
> +			};
> +
> +			switch2phy3_topaz: switch2phy3@13 {
> +				reg =3D <0x13>;
> +			};
> +
> +			switch2phy4_topaz: switch2phy4@14 {
> +				reg =3D <0x14>;
> +			};
> +		};
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@1 {
> +				reg =3D <0x1>;
> +				label =3D "lan17";
> +				phy-handle =3D <&switch2phy1_topaz>;
> +			};
> +
> +			port@2 {
> +				reg =3D <0x2>;
> +				label =3D "lan18";
> +				phy-handle =3D <&switch2phy2_topaz>;
> +			};
> +
> +			port@3 {
> +				reg =3D <0x3>;
> +				label =3D "lan19";
> +				phy-handle =3D <&switch2phy3_topaz>;
> +			};
> +
> +			port@4 {
> +				reg =3D <0x4>;
> +				label =3D "lan20";
> +				phy-handle =3D <&switch2phy4_topaz>;
> +			};
> +
> +			port@5 {
> +				reg =3D <0x5>;
> +				label =3D "dsa";
> +				phy-mode =3D "2500base-x";
> +				managed =3D "in-band-status";
> +				link =3D <&switch1port10 &switch0port10>;
> +			};
> +		};
> +	};
> +};
> --=20
> 2.21.0
>

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
