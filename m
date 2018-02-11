From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 6/6] arm64: allwinner: h6: add support
 for Pine H64 board
Date: Sun, 11 Feb 2018 23:26:51 +0000
Message-ID: <3705fc05-f1ec-a6ee-d204-d1f8f0916069@arm.com>
References: <20180203154942.63566-1-icenowy@aosc.io>
 <20180203154942.63566-7-icenowy@aosc.io>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBVVCQPKAKGQES4DKLPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180203154942.63566-7-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03/02/18 15:49, Icenowy Zheng wrote:
> Pine H64 is an Allwinner H6-based SBC from Pine64, with the following
> features:
> 
> - 1GiB/2GiB/4GiB LPDDR3 DRAM (in 4GiB situation only 3GiB is
> accessible)
> - AXP805 PMIC
> - Raspberry-Pi-compatible GPIO header, "Euler" GPIO header (not
> compatible with the "Euler" on Pine A64) and "Expansion" pin header
> - 2 USB 2.0 ports and 1 USB 3.0 ports
> - Audio jack
> - MicroSD slot and eMMC module slot
> - on-board SPI NOR flash
> - 1Gbps Ethernet port (via RTL8211E PHY)
> - HDMI port
> 
> Adds initial support for it, including the UART on the Expansion pin
> header.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

I booted this to the point where the kernel complained about the missing
rootfs, also with an initrd to the prompt. So:

Reviewed-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Tested-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Thanks!
Andre.

> ---
> Changes in v2:
> - Switch to SPDX license identifier.
> 
>  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
>  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      | 30 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index f505227b0250..addf245226f6 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -10,3 +10,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-prime.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-zero-plus2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-nanopi-neo2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-nanopi-neo-plus2.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> new file mode 100644
> index 000000000000..dc850a1c0885
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> @@ -0,0 +1,30 @@
> +/*
> + * Copyright (c) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + *
> + * SPDX-License-Identifier: (GPL-2.0+ or MIT)
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h6.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Pine H64";
> +	compatible = "pine64,pine-h64", "allwinner,sun50i-h6";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_ph_pins>;
> +	status = "okay";
> +};
> 
