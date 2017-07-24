From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM53573: Add Broadcom BCM947189ACDBMR board
 support
Date: Mon, 24 Jul 2017 10:39:54 -0700
Message-ID: <bb5387cf-5d31-3a03-1bb9-1327768271ec@gmail.com>
References: <20170718193740.8610-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170718193740.8610-1-f.fainelli@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, rafal@milecki.pl, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 07/18/2017 12:37 PM, Florian Fainelli wrote:
> Adds support for the Broadcom reference board BCM947189ACDMBR which
> features the following:
> 
> * 128MB of DRAM
> * External MoCA support through a Broadcom BCM6802 chip
> * 1x external Gigabit PHY through the external BCM6802
> * 1x USB 2.0 port
> * 1x PCIE slot
> * Few configurable buttons and LEDs
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Rafal, any feedback on this?

> ---
>  arch/arm/boot/dts/Makefile            |  3 +-
>  arch/arm/boot/dts/bcm947189acdbmr.dts | 97 +++++++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/bcm947189acdbmr.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4b17f35dc9a7..236587e7f07d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -106,7 +106,8 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
>  	bcm953012hr.dtb \
>  	bcm953012k.dtb
>  dtb-$(CONFIG_ARCH_BCM_53573) += \
> -	bcm47189-tenda-ac9.dtb
> +	bcm47189-tenda-ac9.dtb \
> +	bcm947189acdbmr.dtb
>  dtb-$(CONFIG_ARCH_BCM_63XX) += \
>  	bcm963138dvt.dtb
>  dtb-$(CONFIG_ARCH_BCM_CYGNUS) += \
> diff --git a/arch/arm/boot/dts/bcm947189acdbmr.dts b/arch/arm/boot/dts/bcm947189acdbmr.dts
> new file mode 100644
> index 000000000000..ef263412fea5
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm947189acdbmr.dts
> @@ -0,0 +1,97 @@
> +/*
> + * Copyright (C) 2017 Broadcom
> + * Author: Florian Fainelli <f.fainelli@gmail.com>
> + *
> + * Licensed under the ISC license.
> + */
> +
> +/dts-v1/;
> +
> +#include "bcm53573.dtsi"
> +
> +/ {
> +	compatible = "brcm,bcm947189acdbmr", "brcm,bcm47189", "brcm,bcm53573";
> +	model = "Broadcom BCM947189ACDBMR";
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200 earlycon";
> +	};
> +
> +	memory {
> +		reg = <0x00000000 0x08000000>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		wps {
> +			label = "bcm53xx:blue:wps";
> +			gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		5ghz {
> +			label = "bcm53xx:blue:5ghz";
> +			gpios = <&chipcommon 11 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		2ghz {
> +			label = "bcm53xx:blue:2ghz";
> +			gpios = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		restart {
> +			label = "Reset";
> +			linux,code = <KEY_RESTART>;
> +			gpios = <&chipcommon 7 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		wps {
> +			label = "WPS";
> +			linux,code = <KEY_WPS_BUTTON>;
> +			gpios = <&chipcommon 9 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	spi {
> +		compatible = "spi-gpio";
> +		num-chipselects = <1>;
> +		gpio-sck = <&chipcommon 21 0>;
> +		gpio-miso = <&chipcommon 22 0>;
> +		gpio-mosi = <&chipcommon 23 0>;
> +		cs-gpios = <&chipcommon 24 0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* External BCM6802 MoCA chip is connected */
> +	};
> +};
> +
> +&pcie0 {
> +	ranges = <0x00000000 0 0 0 0 0x00100000>;
> +	#address-cells = <3>;
> +	#size-cells = <2>;
> +
> +	bridge@0,0,0 {
> +		reg = <0x0000 0 0 0 0>;
> +		ranges = <0x00000000 0 0 0 0 0 0 0x00100000>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +
> +		wifi@0,1,0 {
> +			reg = <0x0000 0 0 0 0>;
> +			ranges = <0x00000000 0 0 0 0x00100000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
> +};
> +
> +&usb2 {
> +	vcc-gpio = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
> +};
> 


-- 
Florian
