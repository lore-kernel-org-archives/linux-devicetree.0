From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64: renesas: h3ulcb: initial device tree
Date: Thu, 21 Jul 2016 18:14:58 +0100
Message-ID: <20160721171458.GH20559@leverpostej>
References: <1469103962-20378-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1469104067-20451-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469104067-20451-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 21, 2016 at 03:27:47PM +0300, Vladimir Barinov wrote:
> Add the initial device tree for the R8A7795 SoC based H3ULCB low cost
> board.
> 
> This commit supports the following peripherals:
> - SCIF (console), Ethernet, SD, USB Host, Audio, GPIO LEDs
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile           |   2 +-
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 326 +++++++++++++++++++++++++
>  2 files changed, 327 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 17139f7..eb72830 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -1,4 +1,4 @@
> -dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb
> +dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb
>  
>  always		:= $(dtb-y)
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> new file mode 100644
> index 0000000..e4400fb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -0,0 +1,326 @@
> +/*
> + * Device Tree Source for the H3ULCB board
> + *
> + * Copyright (C) 2016 Renesas Electronics Corp.
> + * Copyright (C) 2016 Cogent Embedded, Inc.
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */
> +
> +/*
> + * SSI-AK4613
> + *
> + * This command is required when Playback/Capture
> + *
> + *	amixer set "DVC Out" 10%
> + *	amixer set "DVC In" 10%
> + */

I don't think this comment belongs here. It has nothing to do with the
DT as such.

Why is this necessary? Is this a bug?

> +
> +/dts-v1/;
> +#include "r8a7795.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Renesas H3ULCB board based on r8a7795";
> +	compatible = "renesas,h3ulcb", "renesas,r8a7795";
> +
> +	aliases {
> +		serial0 = &scif2;
> +		ethernet0 = &avb;
> +	};
> +
> +	chosen {
> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";

Please get rid of the bootargs property.

While they may be useful for you specifically, they're usecase
dependent, and you should have your bootloader fill these in instead.

We shouldn't need to have any bootargs for thte in-kernel dts files.

Otherwise this looks fine to me.

Thanks,
Mark.
