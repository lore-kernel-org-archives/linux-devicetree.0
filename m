From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: da850: Add basic DTS for the L138/C6748 Dev Kit
Date: Thu, 4 Aug 2016 13:29:02 -0500
Message-ID: <20160804182902.GA22499@rob-hp-laptop>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160804144332.4841-1-kbeldan@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Karl Beldan <kbeldan@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, karl.beldan+oss@gmail.com, Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2016 at 02:43:32PM +0000, Karl Beldan wrote:
> The LCDK is the successor to the late Hawkboard and has the same machine
> number.
> Among the differences are the flash (16bits vs 8bits) and some pins
> (MMC, LEDs, buttons, some external connectors), however the main
> components remain the same (eth. PHY, Audio Codec, Video decoder and
> DAC) except for the main PMIC, different and hard-wired on the LCDK (the
> LDOs and DCDCs are always ON).
> A DT-only boot with this addition gives functional uart, reboot via
> watchdog, rtc, ethernet and MMC (I added the CD gpio for the MMC
> although davinci_mmc doesn't call yet the mmc core OF facilities).
> 
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/davinci.txt |  4 ++
>  arch/arm/boot/dts/Makefile                        |  1 +
>  arch/arm/boot/dts/omapl138-lcdk.dts               | 71 +++++++++++++++++++++++
>  arch/arm/mach-davinci/da8xx-dt.c                  |  1 +
>  4 files changed, 77 insertions(+)
>  create mode 100644 arch/arm/boot/dts/omapl138-lcdk.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/davinci.txt b/Documentation/devicetree/bindings/arm/davinci.txt
> index cfaeda4..1482c74 100644
> --- a/Documentation/devicetree/bindings/arm/davinci.txt
> +++ b/Documentation/devicetree/bindings/arm/davinci.txt
> @@ -5,6 +5,10 @@ DA850/OMAP-L138/AM18x Evaluation Module (EVM) board
>  Required root node properties:
>      - compatible = "ti,da850-evm", "ti,da850";
>  
> +DA850/OMAP-L138/AM18x L138/C6748 Development Kit (LCDK) board
> +Required root node properties:
> +    - compatible = "ti,omapl138-lcdk", "ti,da850";
> +
>  EnBW AM1808 based CMC board
>  Required root node properties:
>      - compatible = "enbw,cmc", "ti,da850;
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 414b427..da3f69b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -105,6 +105,7 @@ dtb-$(CONFIG_ARCH_BERLIN) += \
>  dtb-$(CONFIG_ARCH_BRCMSTB) += \
>  	bcm7445-bcm97445svmb.dtb
>  dtb-$(CONFIG_ARCH_DAVINCI) += \
> +	omapl138-lcdk.dtb \
>  	da850-enbw-cmc.dtb \
>  	da850-evm.dtb
>  dtb-$(CONFIG_ARCH_DIGICOLOR) += \
> diff --git a/arch/arm/boot/dts/omapl138-lcdk.dts b/arch/arm/boot/dts/omapl138-lcdk.dts
> new file mode 100644
> index 0000000..fad3b6d
> --- /dev/null
> +++ b/arch/arm/boot/dts/omapl138-lcdk.dts
> @@ -0,0 +1,71 @@
> +/*
> + * Copyright (c) 2016 BayLibre, Inc.
> + *
> + * Licensed under GPLv2 or later.
> + */
> +/dts-v1/;
> +#include "da850.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "DA850/AM1808/OMAP-L138 LCDK";
> +	compatible = "ti,omapl138-lcdk", "ti,da850";
> +
> +	aliases {
> +		serial2 = &serial2;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS2,115200n8 earlycon";

You don't need console with stdout-path set. And really, earlycon should 
not be the default.

> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0xc0000000 0x08000000>;
> +	};
> +};
> +
> +&pmx_core {
> +	status = "okay";
> +};
> +
> +&serial2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&serial2_rxtx_pins>;
> +	status = "okay";
> +};
> +
> +&wdt {
> +	status = "okay";
> +};
> +
> +&rtc0 {
> +	status = "okay";
> +};
> +
> +&gpio {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mdio_pins>;
> +	bus_freq = <2200000>;
> +	status = "okay";
> +};
> +
> +&eth0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mii_pins>;
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	max-frequency = <50000000>;
> +	bus-width = <4>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	cd-gpios = <&gpio 64 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +};
> diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
> index 754f478..d5f710c 100644
> --- a/arch/arm/mach-davinci/da8xx-dt.c
> +++ b/arch/arm/mach-davinci/da8xx-dt.c
> @@ -49,6 +49,7 @@ static void __init da850_init_machine(void)
>  
>  static const char *const da850_boards_compat[] __initconst = {
>  	"enbw,cmc",
> +	"ti,omapl138-lcdk",
>  	"ti,da850-evm",
>  	"ti,da850",
>  	NULL,
> -- 
> 2.9.0.rc1
> 
