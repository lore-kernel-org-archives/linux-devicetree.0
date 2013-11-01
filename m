From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: i.MX53: dts for Voipac x53-dmm-668 module
Date: Fri, 1 Nov 2013 15:58:00 -0700
Message-ID: <20131101225759.GA3224@kartoffel>
References: <1381874609-14464-1-git-send-email-lisovy@gmail.com>
 <1381874609-14464-4-git-send-email-lisovy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381874609-14464-4-git-send-email-lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org" <pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 15, 2013 at 11:03:28PM +0100, Rostislav Lisovy wrote:
> Enable UART1 and FEC
> 
> Signed-off-by: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
>  create mode 100644 arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
> 
> diff --git a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
> new file mode 100644
> index 0000000..04695c9
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
> @@ -0,0 +1,195 @@
> +/*
> + * Copyright 2013 Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, PiKRON s.r.o.
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +#include "imx53.dtsi"
> +
> +/ {
> +	model = "Voipac i.MX53 X53-DMM-668";
> +	compatible = "vp,imx53-dmm-668", "fsl,imx53";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x70000000 0x20000000>;
> +	};
> +
> +	memory@1 {
> +		device_type = "memory";
> +		reg = <0xb0000000 0x20000000>;
> +	};

This looks wrong. Any unit-address should match the first reg entry, and I've
not seen memory nodes with unit addresses anywhere else.

Why not:

memory {
	device_type = "memory";
	reg = <0x70000000 0x20000000>,
	      <0xb0000000 0x20000000>;
};

> +
> +	regulators {
> +		compatible = "simple-bus";
> +
> +		reg_3p3v: 3p3v {
> +			compatible = "regulator-fixed";
> +			regulator-name = "3P3V";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +		};
> +	};
> +};

Is there any reason for placing these under a simple-bus rather than under the
root?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
