From: Ben Whitten <Ben.Whitten@lairdtech.com>
Subject: RE: [PATCH v2 4/6] arm: dts: add support for Laird WB50N cpu module
 and DVK
Date: Wed, 27 Jun 2018 08:42:17 +0000
Message-ID: <BY1PR02MB1114B9B363091FC26668E454E7480@BY1PR02MB1114.namprd02.prod.outlook.com>
References: <1529070055-18701-1-git-send-email-ben.whitten@lairdtech.com>
 <1529070055-18701-4-git-send-email-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529070055-18701-4-git-send-email-ben.whitten@lairdtech.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ben Whitten <ben.whitten@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

As you are planning a clock binding rework and this patch in the series
needs a change to account for that, do you want me to re-submit after
your series or are we good to go as is?

Thanks,
Ben
=20
> This adds support for Lairds CPU module, featuring Atheros wifi, CSR
> Bluetooth and, Atmel SAMA5D3 CPU.
> https://www.lairdtech.com/products/wb50nbt-wi-fi-bluetooth-module
>=20
> Signed-off-by: Ben Whitten <ben.whitten@lairdtech.com>
> ---
>  arch/arm/boot/dts/Makefile        |   1 +
>  arch/arm/boot/dts/at91-wb50n.dts  | 112 +++++++++++++++++++++
>  arch/arm/boot/dts/at91-wb50n.dtsi | 198
> ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 311 insertions(+)
>  create mode 100644 arch/arm/boot/dts/at91-wb50n.dts
>  create mode 100644 arch/arm/boot/dts/at91-wb50n.dtsi
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 04604d2..07823be 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -52,6 +52,7 @@ dtb-$(CONFIG_SOC_SAM_V7) +=3D \
>  	at91-sama5d2_xplained.dtb \
>  	at91-sama5d3_xplained.dtb \
>  	at91-tse850-3.dtb \
> +	at91-wb50n.dtb \
>  	sama5d31ek.dtb \
>  	sama5d33ek.dtb \
>  	sama5d34ek.dtb \
> diff --git a/arch/arm/boot/dts/at91-wb50n.dts b/arch/arm/boot/dts/at91-
> wb50n.dts
> new file mode 100644
> index 0000000..8cecc70
> --- /dev/null
> +++ b/arch/arm/boot/dts/at91-wb50n.dts
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * at91-wb50n.dts - Device Tree file for wb50n evaluation board
> + *
> + *  Copyright (C) 2018 Laird
> + *
> + */
> +
> +/dts-v1/;
> +#include "at91-wb50n.dtsi"
> +
> +/ {
> +	model =3D "Laird Workgroup Bridge 50N - Atmel SAMA5D";
> +	compatible =3D "laird,wb50n", "atmel,sama5d31", "atmel,sama5d3",
> "atmel,sama5";
> +
> +	gpio_keys {
> +		compatible =3D "gpio-keys";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		btn0@10 {
> +			reg =3D <10>;
> +			label =3D "BTNESC";
> +			linux,code =3D <1>; /* ESC button */
> +			gpios =3D <&pioA 10 GPIO_ACTIVE_LOW>;
> +			gpio-key,wakeup =3D <1>;
> +		};
> +
> +		irqbtn@31 {
> +			reg =3D <31>;
> +			label =3D "IRQBTN";
> +			linux,code =3D <99>; /* SysReq button */
> +			gpios =3D <&pioE 31 GPIO_ACTIVE_LOW>;
> +			gpio-key,wakeup =3D <1>;
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led0 {
> +			label =3D "wb50n:blue:led0";
> +			gpios =3D <&pioA 12 GPIO_ACTIVE_LOW>;
> +			default-state =3D "off";
> +		};
> +
> +		led1 {
> +			label =3D "wb50n:green:led1";
> +			gpios =3D <&pioA 24 GPIO_ACTIVE_LOW>;
> +			default-state =3D "off";
> +		};
> +
> +		led2 {
> +			label =3D "wb50n:red:led2";
> +			gpios =3D <&pioA 26 GPIO_ACTIVE_LOW>;
> +			default-state =3D "off";
> +		};
> +	};
> +};
> +
> +&watchdog {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	status =3D "okay";
> +};
> +
> +&macb1 {
> +	status =3D "okay";
> +};
> +
> +&dbgu {
> +	status =3D "okay";
> +};
> +
> +/* On BB40 this port is labeled UART1 */
> +&usart0 {
> +	status =3D "okay";
> +};
> +
> +/* On BB40 this port is labeled UART0 */
> +&usart1 {
> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +};
> +
> +&spi1 {
> +	status =3D "okay";
> +
> +	spidev@0 {
> +		compatible =3D "spidev";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <8000000>;
> +	};
> +};
> +
> +&usb0 {
> +	status =3D "okay";
> +};
> +
> +&usb1 {
> +	status =3D "okay";
> +};
> +
> +&usb2 {
> +	status =3D "okay";
> +};
> +
> diff --git a/arch/arm/boot/dts/at91-wb50n.dtsi b/arch/arm/boot/dts/at91-
> wb50n.dtsi
> new file mode 100644
> index 0000000..85692c8
> --- /dev/null
> +++ b/arch/arm/boot/dts/at91-wb50n.dtsi
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * at91-wb50n.dtsi - Device Tree include file for wb50n cpu module
> + *
> + *  Copyright (C) 2018 Laird
> + *
> + */
> +
> +#include "sama5d31.dtsi"
> +
> +/ {
> +	model =3D "Laird Workgroup Bridge 50N - Atmel SAMA5D";
> +	compatible =3D "laird,wb50n", "atmel,sama5d31", "atmel,sama5d3",
> "atmel,sama5";
> +
> +	chosen {
> +		bootargs =3D "ubi.mtd=3D6 root=3Dubi0:rootfs rootfstype=3Dubifs
> rw";
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	memory {
> +		reg =3D <0x20000000 0x4000000>;
> +	};
> +};
> +
> +&pinctrl {
> +	board {
> +		pinctrl_mmc0_cd: mmc0_cd {
> +			atmel,pins =3D <AT91_PIOC 26 AT91_PERIPH_GPIO
> AT91_PINCTRL_PULL_UP_DEGLITCH>; /* PC26 GPIO with pullup deglitch */
> +		};
> +
> +		pinctrl_usba_vbus: usba_vbus {
> +			atmel,pins =3D <AT91_PIOB 13 AT91_PERIPH_GPIO
> AT91_PINCTRL_DEGLITCH>; /* PB13 GPIO with deglitch */
> +		};
> +	};
> +};
> +
> +&slow_xtal {
> +	clock-frequency =3D <32768>;
> +};
> +
> +&main_xtal {
> +	clock-frequency =3D <12000000>;
> +};
> +
> +&slow_osc {
> +	atmel,osc-bypass;
> +};
> +
> +&usart1_clk {
> +	atmel,clk-output-range =3D <0 132000000>;
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3
> &pinctrl_mmc0_cd>;
> +	cd-gpios =3D <&pioC 26 GPIO_ACTIVE_LOW>;
> +	slot@0 {
> +		reg =3D <0>;
> +		bus-width =3D <4>;
> +	};
> +};
> +
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_mmc1_clk_cmd_dat0 &pinctrl_mmc1_dat1_3>;
> +	status =3D "okay";
> +	atheros@0 {
> +		compatible =3D "atheros,ath6kl";
> +		atheros,board-id =3D "SD32";
> +		reg =3D <0>;
> +		bus-width =3D <4>;
> +	};
> +};
> +
> +&macb1 {
> +	phy-mode =3D "rmii";
> +};
> +
> +&dbgu {
> +	dmas =3D <0>, <0>;	/*  Do not use DMA for dbgu */
> +};
> +
> +/* On BB40 this port is labeled UART1 */
> +&usart0 {
> +	atmel,use-dma-rx;
> +	atmel,use-dma-tx;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usart0 &pinctrl_usart0_rts_cts>;
> +};
> +
> +/* On BB40 this port is labeled UART0 */
> +&usart1 {
> +	atmel,use-dma-rx;
> +	atmel,use-dma-tx;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usart1 &pinctrl_usart1_rts_cts>;
> +	dtr-gpios =3D <&pioD 13 GPIO_ACTIVE_LOW>;
> +	dsr-gpios =3D <&pioD 11 GPIO_ACTIVE_LOW>;
> +	dcd-gpios =3D <&pioD 7 GPIO_ACTIVE_LOW>;
> +	rng-gpios =3D <&pioD 8 GPIO_ACTIVE_LOW>;
> +};
> +
> +/* USART3 is direct-connect to the Bluetooth UART on the radio SIP */
> +&usart3 {
> +	atmel,use-dma-rx;
> +	atmel,use-dma-tx;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usart3 &pinctrl_usart3_rts_cts>;
> +	status =3D "okay";
> +};
> +
> +&spi1 {
> +	cs-gpios =3D <&pioC 25 0>, <0>, <0>, <0>;
> +};
> +
> +&ebi {
> +	pinctrl-0 =3D <&pinctrl_ebi_nand_addr>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&nand_controller {
> +	status =3D "okay";
> +
> +	nand: nand@3 {
> +		reg =3D <0x3 0x0 0x2>;
> +		atmel,rb =3D <0>;
> +		nand-bus-width =3D <8>;
> +		nand-ecc-mode =3D "hw";
> +		nand-ecc-strength =3D <8>;
> +		nand-ecc-step-size =3D <512>;
> +		nand-on-flash-bbt;
> +		label =3D "atmel_nand";
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			at91bootstrap@0 {
> +				label =3D "at91bs";
> +				reg =3D <0x0 0x20000>;
> +			};
> +
> +			uboot@20000 {
> +				label =3D "u-boot";
> +				reg =3D <0x20000 0x80000>;
> +			};
> +
> +			ubootenv@a0000 {
> +				label =3D "u-boot-env";
> +				reg =3D <0xa0000 0x20000>;
> +			};
> +
> +			ubootenv@c0000 {
> +				label =3D "u-boot-env";
> +				reg =3D <0xc0000 0x20000>;
> +			};
> +
> +			kernel-a@e0000 {
> +				label =3D "kernel-a";
> +				reg =3D <0xe0000 0x500000>;
> +			};
> +
> +			kernel-b@5e0000 {
> +				label =3D "kernel-b";
> +				reg =3D <0x5e0000 0x500000>;
> +			};
> +
> +			rootfs-a@ae0000 {
> +				label =3D "rootfs-a";
> +				reg =3D <0xae0000 0x3000000>;
> +			};
> +
> +			rootfs-b@3ae0000 {
> +				label =3D "rootfs-b";
> +				reg =3D <0x3ae0000 0x3000000>;
> +			};
> +
> +			user@6ae0000 {
> +				label =3D "user";
> +				reg =3D <0x6ae0000 0x14e0000>;
> +			};
> +		};
> +	};
> +};
> +
> +&usb0 {
> +	atmel,vbus-gpio =3D <&pioB 13 GPIO_ACTIVE_LOW>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usba_vbus>;
> +};
> +
> +&usb1 {
> +	num-ports =3D <3>;
> +	atmel,vbus-gpio =3D <&pioA 2 GPIO_ACTIVE_LOW>;
> +	atmel,oc-gpio =3D <&pioA 4 GPIO_ACTIVE_LOW>;
> +};
> --
> 2.7.4
