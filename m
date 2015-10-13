From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: dts: add .dts for GICv3 Foundation model
Date: Tue, 13 Oct 2015 11:44:40 +0100
Message-ID: <561CE098.2030906@arm.com>
References: <1444729069-27922-1-git-send-email-andre.przywara@arm.com> <1444729069-27922-5-git-send-email-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444729069-27922-5-git-send-email-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/10/15 10:37, Andre Przywara wrote:
> The ARMv8 Foundation model sports a command line parameter to use
> a GICv3 emulation instead of the default GICv2 interrupt controller.
> Add a new .dts file which reuses most of the definitions of the
> existing model while just adding the required properties for the
> GICv3 node.
> This allows the public Foundation model to run with a GICv3.
> 
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/Makefile                |  2 +-
>  arch/arm64/boot/dts/arm/foundation-v8-gicv3.dts | 30 +++++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/arm/foundation-v8-gicv3.dts
> 
> diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
> index bb3c072..46d342d 100644
> --- a/arch/arm64/boot/dts/arm/Makefile
> +++ b/arch/arm64/boot/dts/arm/Makefile
> @@ -1,4 +1,4 @@
> -dtb-$(CONFIG_ARCH_VEXPRESS) += foundation-v8.dtb
> +dtb-$(CONFIG_ARCH_VEXPRESS) += foundation-v8.dtb foundation-v8-gicv3.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += juno.dtb juno-r1.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
> diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv3.dts b/arch/arm64/boot/dts/arm/foundation-v8-gicv3.dts
> new file mode 100644
> index 0000000..ecdbe98
> --- /dev/null
> +++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv3.dts
> @@ -0,0 +1,30 @@
> +/*
> + * ARM Ltd.
> + *
> + * ARMv8 Foundation model DTS (GICv3 configuration)
> + */
> +
> +#include "foundation-v8.dtsi"
> +
> +/ {
> +	gic: interrupt-controller@2f000000 {
> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		interrupt-controller;
> +		reg =	<0x0 0x2f000000 0x0 0x10000>,
> +			<0x0 0x2f100000 0x0 0x200000>,
> +			<0x0 0x2c000000 0x0 0x2000>,
> +			<0x0 0x2c010000 0x0 0x2000>,
> +			<0x0 0x2c02f000 0x0 0x2000>;
> +		interrupts = <1 9 0xf04>;
> +
> +		its: its@2f020000 {
> +			compatible = "arm,gic-v3-its";
> +			msi-controller;
> +			reg = <0x0 0x2f020000 0x0 0x20000>;
> +		};
> +	};
> +};
> 

Do you know if the ITS has any modelled device connected to it? Not very
useful on its own, but you may want to use it as a way to inject IPIs
(just kidding, don't do that!).

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
