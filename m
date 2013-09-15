From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: zynq: Enable arm_global_timer
Date: Sun, 15 Sep 2013 13:40:36 +0100
Message-ID: <20130915124036.A66A8C42C3C@trevor.secretlab.ca>
References: <1379004640-15117-1-git-send-email-soren.brinkmann@xilinx.com> <1379004640-15117-3-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379004640-15117-3-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 12 Sep 2013 09:50:40 -0700, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Zynq is based on an ARM Cortex-A9 MPCore, which features the
> arm_global_timer in its SCU. Therefore enable the timer for Zynq.
> 
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi | 8 ++++++++
>  arch/arm/mach-zynq/Kconfig       | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
> index e32b92b..eaacb39 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -92,6 +92,14 @@
>  			};
>  		};
>  
> +		global_timer: global_timer@f8f00200 {

Nit: node names and property names use '-' not '_'. Plus the generic
names principle suggests the node should be names 'timer' not
'global_timer'. The following would be fine:

		global_timer: timer@f8f00200 {

(There's a distinction between node names and labels. '_' is fine in
labels since it doesn't get output into the compiled .dtb.

g.

> +			compatible = "arm,cortex-a9-global-timer";
> +			reg = <0xf8f00200 0x20>;
> +			interrupts = <1 11 0x301>;
> +			interrupt-parent = <&intc>;
> +			clocks = <&clkc 4>;
> +		};
> +
>  		ttc0: ttc0@f8001000 {
>  			interrupt-parent = <&intc>;
>  			interrupts = < 0 10 4 0 11 4 0 12 4 >;
> diff --git a/arch/arm/mach-zynq/Kconfig b/arch/arm/mach-zynq/Kconfig
> index 04f8a4a..6b04260 100644
> --- a/arch/arm/mach-zynq/Kconfig
> +++ b/arch/arm/mach-zynq/Kconfig
> @@ -13,5 +13,6 @@ config ARCH_ZYNQ
>  	select HAVE_SMP
>  	select SPARSE_IRQ
>  	select CADENCE_TTC_TIMER
> +	select ARM_GLOBAL_TIMER
>  	help
>  	  Support for Xilinx Zynq ARM Cortex A9 Platform
> -- 
> 1.8.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
