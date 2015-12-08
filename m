From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: Add SolidRun Armada 388 Clearfog A1 DT file
Date: Tue, 08 Dec 2015 17:57:45 +0100
Message-ID: <87egew98ty.fsf@free-electrons.com>
References: <E1a5hDy-0002rC-Oe@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1a5hDy-0002rC-Oe-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org> (Russell King's
	message of "Sun, 06 Dec 2015 21:52:06 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,
=20
 On dim., d=C3=A9c. 06 2015, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>=
 wrote:

> Add support for the SolidRun Armada 388 Clearfog A1 board.  This boar=
d
> has an Armada 388 microsom, dedicated gigabit ethernet, six switched
> gigabit ethernet ports, SFP cage, two Mini-PCIe/mSATA slots, a m.2 SA=
TA
> slot, and a MikroBUS connector to allow MikroBUS modules to be added.
>
> This DT file adds support for all board facilities with the exception
> of full SFP support.
>
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

I made some tests it on the Clearfog v2.0 I have: Ethernet (CON8 and
J11), i2c (using i2cdetect), USB stick on CON7.

=46or this one I tried to use an USB3 stick, but it was enumerated usin=
g
the High Speed profile and not the Super Speed one. But I think it is
because of the Serdes configuration done in U-Boot.


so Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
and applied on mvebu/dt.

Thanks,

Gregory

> ---
> v2, without the mac-address properties.
>
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/armada-388-clearfog.dts          | 456 +++++++++++=
++++++++++
>  .../arm/boot/dts/armada-38x-solidrun-microsom.dtsi | 115 ++++++
>  3 files changed, 572 insertions(+)
>  create mode 100644 arch/arm/boot/dts/armada-388-clearfog.dts
>  create mode 100644 arch/arm/boot/dts/armada-38x-solidrun-microsom.dt=
si
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 30bbc3746130..7e6a0532c656 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -748,6 +748,7 @@ dtb-$(CONFIG_MACH_ARMADA_38X) +=3D \
>  	armada-385-db-ap.dtb \
>  	armada-385-linksys-caiman.dtb \
>  	armada-385-linksys-cobra.dtb \
> +	armada-388-clearfog.dtb \
>  	armada-388-db.dtb \
>  	armada-388-gp.dtb \
>  	armada-388-rd.dtb
> diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boo=
t/dts/armada-388-clearfog.dts
> new file mode 100644
> index 000000000000..c6e180eb3b11
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-388-clearfog.dts
> @@ -0,0 +1,456 @@
> +/*
> + * Device Tree file for SolidRun Clearfog revision A1 rev 2.0 (88F68=
28)
> + *
> + *  Copyright (C) 2015 Russell King
> + *
> + * This board is in development; the contents of this file work with
> + * the A1 rev 2.0 of the board, which does not represent final
> + * production board.  Things will change, don't expect this file to
> + * remain compatible info the future.
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License
> + *     version 2 as published by the Free Software Foundation.
> + *
> + *     This file is distributed in the hope that it will be useful
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentatio=
n
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom th=
e
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall b=
e
> + *     included in all copies or substantial portions of the Softwar=
e.
> + *
> + *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "armada-388.dtsi"
> +#include "armada-38x-solidrun-microsom.dtsi"
> +
> +/ {
> +	model =3D "SolidRun Clearfog A1";
> +	compatible =3D "solidrun,clearfog-a1", "marvell,armada388",
> +		"marvell,armada385", "marvell,armada380";
> +
> +	aliases {
> +		/* So that mvebu u-boot can update the MAC addresses */
> +		ethernet1 =3D &eth0;
> +		ethernet2 =3D &eth1;
> +		ethernet3 =3D &eth2;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3P3V";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	soc {
> +		internal-regs {
> +			ethernet@30000 {
> +				phy-mode =3D "sgmii";
> +				status =3D "okay";
> +
> +				fixed-link {
> +					speed =3D <1000>;
> +					full-duplex;
> +				};
> +			};
> +
> +			ethernet@34000 {
> +				phy-mode =3D "sgmii";
> +				status =3D "okay";
> +
> +				fixed-link {
> +					speed =3D <1000>;
> +					full-duplex;
> +				};
> +			};
> +
> +			i2c@11000 {
> +				/* Is there anything on this? */
> +				clock-frequency =3D <100000>;
> +				pinctrl-0 =3D <&i2c0_pins>;
> +				pinctrl-names =3D "default";
> +				status =3D "okay";
> +
> +				/*
> +				 * PCA9655 GPIO expander, up to 1MHz clock.
> +				 *  0-CON3 CLKREQ#
> +				 *  1-CON3 PERST#
> +				 *  2-CON2 PERST#
> +				 *  3-CON3 W_DISABLE
> +				 *  4-CON2 CLKREQ#
> +				 *  5-USB3 overcurrent
> +				 *  6-USB3 power
> +				 *  7-CON2 W_DISABLE
> +				 *  8-JP4 P1
> +				 *  9-JP4 P4
> +				 * 10-JP4 P5
> +				 * 11-m.2 DEVSLP
> +				 * 12-SFP_LOS
> +				 * 13-SFP_TX_FAULT
> +				 * 14-SFP_TX_DISABLE
> +				 * 15-SFP_MOD_DEF0
> +				 */
> +				expander0: gpio-expander@20 {
> +					/*
> +					 * This is how it should be:
> +					 * compatible =3D "onnn,pca9655",
> +					 *	 "nxp,pca9555";
> +					 * but you can't do this because of
> +					 * the way I2C works.
> +					 */
> +					compatible =3D "nxp,pca9555";
> +					gpio-controller;
> +					#gpio-cells =3D <2>;
> +					reg =3D <0x20>;
> +
> +					pcie1_0_clkreq {
> +						gpio-hog;
> +						gpios =3D <0 GPIO_ACTIVE_LOW>;
> +						input;
> +						line-name =3D "pcie1.0-clkreq";
> +					};
> +					pcie1_0_w_disable {
> +						gpio-hog;
> +						gpios =3D <3 GPIO_ACTIVE_LOW>;
> +						output-low;
> +						line-name =3D "pcie1.0-w-disable";
> +					};
> +					pcie2_0_clkreq {
> +						gpio-hog;
> +						gpios =3D <4 GPIO_ACTIVE_LOW>;
> +						input;
> +						line-name =3D "pcie2.0-clkreq";
> +					};
> +					pcie2_0_w_disable {
> +						gpio-hog;
> +						gpios =3D <7 GPIO_ACTIVE_LOW>;
> +						output-low;
> +						line-name =3D "pcie2.0-w-disable";
> +					};
> +					usb3_ilimit {
> +						gpio-hog;
> +						gpios =3D <5 GPIO_ACTIVE_LOW>;
> +						input;
> +						line-name =3D "usb3-current-limit";
> +					};
> +					usb3_power {
> +						gpio-hog;
> +						gpios =3D <6 GPIO_ACTIVE_HIGH>;
> +						output-high;
> +						line-name =3D "usb3-power";
> +					};
> +					m2_devslp {
> +						gpio-hog;
> +						gpios =3D <11 GPIO_ACTIVE_HIGH>;
> +						output-low;
> +						line-name =3D "m.2 devslp";
> +					};
> +					sfp_los {
> +						/* SFP loss of signal */
> +						gpio-hog;
> +						gpios =3D <12 GPIO_ACTIVE_HIGH>;
> +						input;
> +						line-name =3D "sfp-los";
> +					};
> +					sfp_tx_fault {
> +						/* SFP laser fault */
> +						gpio-hog;
> +						gpios =3D <13 GPIO_ACTIVE_HIGH>;
> +						input;
> +						line-name =3D "sfp-tx-fault";
> +					};
> +					sfp_tx_disable {
> +						/* SFP transmit disable */
> +						gpio-hog;
> +						gpios =3D <14 GPIO_ACTIVE_HIGH>;
> +						output-low;
> +						line-name =3D "sfp-tx-disable";
> +					};
> +					sfp_mod_def0 {
> +						/* SFP module present */
> +						gpio-hog;
> +						gpios =3D <15 GPIO_ACTIVE_LOW>;
> +						input;
> +						line-name =3D "sfp-mod-def0";
> +					};
> +				};
> +
> +				/* The MCP3021 is 100kHz clock only */
> +				mikrobus_adc: mcp3021@4c {
> +					compatible =3D "microchip,mcp3021";
> +					reg =3D <0x4c>;
> +				};
> +
> +				/* Also something at 0x64 */
> +			};
> +
> +			i2c@11100 {
> +				/*
> +				 * Routed to SFP, mikrobus, and PCIe.
> +				 * SFP limits this to 100kHz, and requires
> +				 *  an AT24C01A/02/04 with address pins tied
> +				 *  low, which takes addresses 0x50 and 0x51.
> +				 * Mikrobus doesn't specify beyond an I2C
> +				 *  bus being present.
> +				 * PCIe uses ARP to assign addresses, or
> +				 *  0x63-0x64.
> +				 */
> +				clock-frequency =3D <100000>;
> +				pinctrl-0 =3D <&clearfog_i2c1_pins>;
> +				pinctrl-names =3D "default";
> +				status =3D "okay";
> +			};
> +
> +			mdio@72004 {
> +				pinctrl-0 =3D <&mdio_pins>;
> +				pinctrl-names =3D "default";
> +
> +				phy_dedicated: ethernet-phy@0 {
> +					/*
> +					 * Annoyingly, the marvell phy driver
> +					 * configures the LED register, rather
> +					 * than preserving reset-loaded setting.
> +					 * We undo that rubbish here.
> +					 */
> +					marvell,reg-init =3D <3 16 0 0x101e>;
> +					reg =3D <0>;
> +				};
> +			};
> +
> +			pinctrl@18000 {
> +				clearfog_dsa0_clk_pins: clearfog-dsa0-clk-pins {
> +					marvell,pins =3D "mpp46";
> +					marvell,function =3D "ref";
> +				};
> +				clearfog_dsa0_pins: clearfog-dsa0-pins {
> +					marvell,pins =3D "mpp23", "mpp41";
> +					marvell,function =3D "gpio";
> +				};
> +				clearfog_i2c1_pins: i2c1-pins {
> +					/* SFP, PCIe, mSATA, mikrobus */
> +					marvell,pins =3D "mpp26", "mpp27";
> +					marvell,function =3D "i2c1";
> +				};
> +				clearfog_sdhci_cd_pins: clearfog-sdhci-cd-pins {
> +					marvell,pins =3D "mpp20";
> +					marvell,function =3D "gpio";
> +				};
> +				clearfog_sdhci_pins: clearfog-sdhci-pins {
> +					marvell,pins =3D "mpp21", "mpp28",
> +						       "mpp37", "mpp38",
> +						       "mpp39", "mpp40";
> +					marvell,function =3D "sd0";
> +				};
> +				clearfog_spi1_cs_pins: spi1-cs-pins {
> +					marvell,pins =3D "mpp55";
> +					marvell,function =3D "spi1";
> +				};
> +				mikro_pins: mikro-pins {
> +					/* int: mpp22 rst: mpp29 */
> +					marvell,pins =3D "mpp22", "mpp29";
> +					marvell,function =3D "gpio";
> +				};
> +				mikro_spi_pins: mikro-spi-pins {
> +					marvell,pins =3D "mpp43";
> +					marvell,function =3D "spi1";
> +				};
> +				mikro_uart_pins: mikro-uart-pins {
> +					marvell,pins =3D "mpp24", "mpp25";
> +					marvell,function =3D "ua1";
> +				};
> +				rear_button_pins: rear-button-pins {
> +					marvell,pins =3D "mpp34";
> +					marvell,function =3D "gpio";
> +				};
> +			};
> +
> +			sata@a8000 {
> +				/* pinctrl? */
> +				status =3D "okay";
> +			};
> +
> +			sata@e0000 {
> +				/* pinctrl? */
> +				status =3D "okay";
> +			};
> +
> +			sdhci@d8000 {
> +				bus-width =3D <4>;
> +				cd-gpios =3D <&gpio0 20 GPIO_ACTIVE_LOW>;
> +				no-1-8-v;
> +				pinctrl-0 =3D <&clearfog_sdhci_pins
> +					     &clearfog_sdhci_cd_pins>;
> +				pinctrl-names =3D "default";
> +				status =3D "okay";
> +				vmmc =3D <&reg_3p3v>;
> +				wp-inverted;
> +			};
> +
> +			serial@12100 {
> +				/* mikrobus uart */
> +				pinctrl-0 =3D <&mikro_uart_pins>;
> +				pinctrl-names =3D "default";
> +				status =3D "okay";
> +			};
> +
> +			spi@10680 {
> +				/*
> +				 * We don't seem to have the W25Q32 on the
> +				 * A1 Rev 2.0 boards, so disable SPI.
> +				 * CS0: W25Q32 (doesn't appear to be present)
> +				 * CS1:
> +				 * CS2: mikrobus
> +				 */
> +				pinctrl-0 =3D <&spi1_pins
> +					     &clearfog_spi1_cs_pins
> +					     &mikro_spi_pins>;
> +				pinctrl-names =3D "default";
> +				status =3D "okay";
> +
> +				spi-flash@0 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					compatible =3D "w25q32", "jedec,spi-nor";
> +					reg =3D <0>; /* Chip select 0 */
> +					spi-max-frequency =3D <3000000>;
> +					status =3D "disabled";
> +				};
> +			};
> +
> +			usb@58000 {
> +				/* CON3, nearest  power. */
> +				status =3D "okay";
> +			};
> +
> +			usb3@f0000 {
> +				/* CON2, nearest CPU, USB2 only. */
> +				status =3D "okay";
> +			};
> +
> +			usb3@f8000 {
> +				/* CON7 */
> +				status =3D "okay";
> +			};
> +		};
> +
> +		pcie-controller {
> +			status =3D "okay";
> +			/*
> +			 * The two PCIe units are accessible through
> +			 * the mini-PCIe connectors on the board.
> +			 */
> +			pcie@2,0 {
> +				/* Port 1, Lane 0. CON3, nearest power. */
> +				reset-gpios =3D <&expander0 1 GPIO_ACTIVE_LOW>;
> +				status =3D "okay";
> +			};
> +			pcie@3,0 {
> +				/* Port 2, Lane 0. CON2, nearest CPU. */
> +				reset-gpios =3D <&expander0 2 GPIO_ACTIVE_LOW>;
> +				status =3D "okay";
> +			};
> +		};
> +	};
> +
> +	dsa@0 {
> +		compatible =3D "marvell,dsa";
> +		dsa,ethernet =3D <&eth1>;
> +		dsa,mii-bus =3D <&mdio>;
> +		pinctrl-0 =3D <&clearfog_dsa0_clk_pins &clearfog_dsa0_pins>;
> +		pinctrl-names =3D "default";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;
> +
> +		switch@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <4 0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +				label =3D "lan1";
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +				label =3D "lan2";
> +			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +				label =3D "lan3";
> +			};
> +
> +			port@3 {
> +				reg =3D <3>;
> +				label =3D "lan4";
> +			};
> +
> +			port@4 {
> +				reg =3D <4>;
> +				label =3D "lan5";
> +			};
> +
> +			port@5 {
> +				reg =3D <5>;
> +				label =3D "cpu";
> +			};
> +
> +			port@6 {
> +				/* 88E1512 external phy */
> +				reg =3D <6>;
> +				label =3D "lan6";
> +				fixed-link {
> +					speed =3D <1000>;
> +					full-duplex;
> +				};
> +			};
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-0 =3D <&rear_button_pins>;
> +		pinctrl-names =3D "default";
> +
> +		button_0 {
> +			/* The rear SW3 button */
> +			label =3D "Rear Button";
> +			gpios =3D <&gpio1 2 GPIO_ACTIVE_LOW>;
> +			linux,can-disable;
> +			linux,code =3D <BTN_0>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi b/ar=
ch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
> new file mode 100644
> index 000000000000..3f792a563c05
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
> @@ -0,0 +1,115 @@
> +/*
> + * Device Tree file for SolidRun Armada 38x Microsom
> + *
> + *  Copyright (C) 2015 Russell King
> + *
> + * This board is in development; the contents of this file work with
> + * the A1 rev 2.0 of the board, which does not represent final
> + * production board.  Things will change, don't expect this file to
> + * remain compatible info the future.
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License
> + *     version 2 as published by the Free Software Foundation.
> + *
> + *     This file is distributed in the hope that it will be useful
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentatio=
n
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom th=
e
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall b=
e
> + *     included in all copies or substantial portions of the Softwar=
e.
> + *
> + *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x10000000>; /* 256 MB */
> +	};
> +
> +	soc {
> +		ranges =3D <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
> +			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000
> +			  MBUS_ID(0x09, 0x19) 0 0xf1100000 0x10000
> +			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000>;
> +
> +		internal-regs {
> +			ethernet@70000 {
> +				pinctrl-0 =3D <&ge0_rgmii_pins>;
> +				pinctrl-names =3D "default";
> +				phy =3D <&phy_dedicated>;
> +				phy-mode =3D "rgmii-id";
> +				status =3D "okay";
> +			};
> +
> +			mdio@72004 {
> +				/*
> +				 * Add the phy clock here, so the phy can be
> +				 * accessed to read its IDs prior to binding
> +				 * with the driver.
> +				 */
> +				pinctrl-0 =3D <&mdio_pins &microsom_phy_clk_pins>;
> +				pinctrl-names =3D "default";
> +
> +				phy_dedicated: ethernet-phy@0 {
> +					/*
> +					 * Annoyingly, the marvell phy driver
> +					 * configures the LED register, rather
> +					 * than preserving reset-loaded setting.
> +					 * We undo that rubbish here.
> +					 */
> +					marvell,reg-init =3D <3 16 0 0x101e>;
> +					reg =3D <0>;
> +				};
> +			};
> +
> +			pinctrl@18000 {
> +				microsom_phy_clk_pins: microsom-phy-clk-pins {
> +					marvell,pins =3D "mpp45";
> +					marvell,function =3D "ref";
> +				};
> +			};
> +
> +			rtc@a3800 {
> +				/*
> +				 * If the rtc doesn't work, run "date reset"
> +				 * twice in u-boot.
> +				 */
> +				status =3D "okay";
> +			};
> +
> +			serial@12000 {
> +				pinctrl-0 =3D <&uart0_pins>;
> +				pinctrl-names =3D "default";
> +				status =3D "okay";
> +			};
> +		};
> +	};
> +};
> --=20
> 2.1.0
>

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
