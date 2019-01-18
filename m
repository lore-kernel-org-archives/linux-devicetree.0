From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v4] arm64: dts: marvell: Add device tree for uDPU board
Date: Fri, 18 Jan 2019 16:45:36 +0100
Message-ID: <87d0oum0kf.fsf@FE-laptop>
References: <20190111172055.30451-1-vladimir.vid@sartura.hr>
 <20190115173842.30367-1-vladimir.vid@sartura.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190115173842.30367-1-vladimir.vid@sartura.hr> (Vladimir Vid's
 message of "Tue, 15 Jan 2019 18:38:43 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Vid <vladimir.vid@sartura.hr>
Cc: devicetree@vger.kernel.org, Luis Torres <luis.torres@methode.com>, Jason Cooper <jason@lakedaemon.net>, Paul Arola <paul.arola@telus.com>, Andrew Lunn <andrew@lunn.ch>, Scott Roberts <scott.roberts@telus.com>, Luka Perkov <luka.perkov@sartura.hr>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,
 
 On mar., janv. 15 2019, Vladimir Vid <vladimir.vid@sartura.hr> wrote:

> This adds initial support for micro-DPU (uDPU) board which is based on
> Armada-3720 SoC.  micro-DPU is the single-port FTTdp distribution point
> unit made by Methode Electronics which offers complete modularity with
> replaceable SFP modules both for uplink and downlink (G.hn over
> twisted-pair, G.hn over coax, 1G and 2.5G Ethernet over Cat-5e cable).
>
> On-board features:
> - 512 MiB DDR3
> - 2 x 2.5G SFP via HSGMII SERDES interface to the A3720 SoC
> - USB 2.0 Type-C connector
> - 4GB eMMC
> - ETSI TS 101548 reverse powering via twisted pair (RJ45) or coax (F Type)
>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Luis Torres <luis.torres@methode.com>
> Cc: Scott Roberts <scott.roberts@telus.com>
> Cc: Paul Arola <paul.arola@telus.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Vladimir Vid <vladimir.vid@sartura.hr>
> ---
>
> v2:
> - add compatible string for the uDPU board
> - add names and labels for the LEDs
> - remove unused mdio node
> - remove eeprom nodes
>
> v3:
> - update copyright year for Methode and Telus
> - fix Methode copyright (use Methode Electornics instead of Methode)
> - sort compatible string by relevance, remove armada-3720-db and
> armada3710 to keep it generic
>
> v4:
> - add generic names for LEDs since they don't use regs
> - add 'partitions' section to standarize with other A37xx/A7K/A8K dts's
> - remove usb3 phandle because of the broken usb_phy (previously used on
> Marvell linux repo) and since usb support is still work in progress
>
> ---
>  MAINTAINERS                                   |   5 +
>  arch/arm64/boot/dts/marvell/Makefile          |   1 +
>  .../boot/dts/marvell/armada-3720-uDPU.dts     | 163 ++++++++++++++++++
>  3 files changed, 169 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d04cebb4a71..4ba06bfc1a1e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9852,6 +9852,11 @@ F:	drivers/media/platform/meson/ao-cec.c
>  F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
>  T:	git git://linuxtv.org/media_tree.git
>  
> +METHODE UDPU SUPPORT
> +M:	Vladimir Vid <vladimir.vid@sartura.hr>
> +S:	Maintained
> +F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> +
>  MICROBLAZE ARCHITECTURE
>  M:	Michal Simek <monstr@monstr.eu>
>  W:	http://www.monstr.eu/fdt/
> diff --git a/arch/arm64/boot/dts/marvell/Makefile b/arch/arm64/boot/dts/marvell/Makefile
> index 2eff1f927471..caed4334f27d 100644
> --- a/arch/arm64/boot/dts/marvell/Makefile
> +++ b/arch/arm64/boot/dts/marvell/Makefile
> @@ -2,6 +2,7 @@
>  # Mvebu SoC Family
>  dtb-$(CONFIG_ARCH_MVEBU) += armada-3720-db.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) += armada-3720-espressobin.dtb
> +dtb-$(CONFIG_ARCH_MVEBU) += armada-3720-uDPU.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) += armada-7040-db.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) += armada-8040-clearfog-gt-8k.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) += armada-8040-db.dtb
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> new file mode 100644
> index 000000000000..1d7e6c82d3ec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device tree for the uDPU board.
> + * Based on Marvell Armada 3720 development board (DB-88F3720-DDR3)
> + * Copyright (C) 2016 Marvell
> + * Copyright (C) 2019 Methode Electronics
> + * Copyright (C) 2019 Telus
> + *
> + * Vladimir Vid <vladimir.vid@sartura.hr>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "armada-372x.dtsi"
> +
> +/ {
> +	model = "Methode uDPU Board";
> +	compatible = "methode,udpu", "marvell,armada3720";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x00000000 0x00000000 0x00000000 0x20000000>;
> +	};
> +
> +	leds {
> +		pinctrl-names = "default";
> +		compatible = "gpio-leds";
> +
> +		power1 {
> +			label = "power:green:led1";
> +			gpios = <&gpionb 11 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		power2 {
> +			label = "power:red:led1";
> +			gpios = <&gpionb 12 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		network1 {
> +			label = "network:green:led2";
> +			gpios = <&gpionb 13 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		network2 {
> +			label = "network:red:led2";
> +			gpios = <&gpionb 14 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		alarm1 {
> +			label = "alarm:green:led3";
> +			gpios = <&gpionb 15 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		alarm2 {
> +			label = "alarm:red:led3";
> +			gpios = <&gpionb 16 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	sfp_eth0: sfp-eth0 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c0>;
> +		los-gpio = <&gpiosb 2 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpio = <&gpiosb 3 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpio = <&gpiosb 4 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpio = <&gpiosb 5 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sfp_eth1: sfp-eth1 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c1>;
> +		los-gpio = <&gpiosb 7 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpio = <&gpiosb 8 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpio = <&gpiosb 9 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpio = <&gpiosb 10 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&sdhci0 {
> +	non-removable;
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs400-1_8v;
> +	marvell,pad-type = "fixed-1-8v";
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	marvell,xenon-phy-type = "emmc 5.0 phy";

You have a GPIO for a card detect here:
> +	cd-gpios = <&gpiosb 2 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	marvell,pad-type = "fixed-1-8v";
> +	status = "okay";

But here you say that the card is not removable:
> +	non-removable;
> +	no-sd;
> +	no-sdio;

Can you explain what do you expect to be connected here?

Thanks,

Gregory


> +};
> +
> +&spi0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi_quad_pins>;
> +
> +	m25p80@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <54000000>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			/* only bootloader is located on the SPI */
> +			partition@0 {
> +				label = "uboot";
> +				reg = <0 0x400000>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +};
> +
> +&eth0 {
> +	phy-mode = "sgmii";
> +	status = "okay";
> +	managed = "in-band-status";
> +	sfp = <&sfp_eth0>;
> +};
> +
> +&eth1 {
> +	phy-mode = "sgmii";
> +	status = "okay";
> +	managed = "in-band-status";
> +	sfp = <&sfp_eth1>;
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> -- 
> 2.19.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
