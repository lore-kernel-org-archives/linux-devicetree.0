From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/3] MIPS: OCTEON: add DTS for D-Link DSR-500N
Date: Sat, 3 Sep 2016 15:09:58 +0300
Message-ID: <51b74b54-a624-f85e-55bf-a99c4188cd44@cogentembedded.com>
References: <20160902211136.8610-1-aaro.koskinen@iki.fi>
 <20160902211136.8610-3-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160902211136.8610-3-aaro.koskinen@iki.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 9/3/2016 12:11 AM, Aaro Koskinen wrote:

> Add DTS for D-Link DSR-500N.
>
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> ---
>  .../mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts
>
> diff --git a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts
> new file mode 100644
> index 0000000..6cacabb
> --- /dev/null
> +++ b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts
> @@ -0,0 +1,42 @@
> +/*
> + * Device tree source for D-Link DSR-500N.
> + *
> + * Written by: Aaro Koskinen <aaro.koskinen@iki.fi>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +/include/ "dlink_dsr-500n-1000n.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "dlink,dsr-500n";
> +	compatible = "dlink,dsr-500n", "cavium,octeon-3860";
> +
> +	soc@0 {
> +		uart0: serial@1180000000800 {
> +			clock-frequency = <300000000>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		usb {
> +			label = "usb";
> +			gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		wps {
> +			label = "wps";

    You don't need LED labels when the are identical to the node names.

[...]

MBR, Sergei
