From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM64: dts: rockchip: add core dtsi file for rk3399
Date: Wed, 17 Feb 2016 11:27:43 +0000
Message-ID: <56C4592F.4080608@arm.com>
References: <1455673992-16469-1-git-send-email-jay.xu@rock-chips.com>
 <1455674476-16655-1-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455674476-16655-1-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jianqun.xu" <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Xu,

On 17/02/16 02:01, jianqun.xu wrote:
> From: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Add dtsi file for Rockchip rk3399 SoCs, which includes some
> general nodes such as cpu, pmu, cru, gic, amba and so on.
> 
> Change-Id: Ie3b824e8ead967d4cb119d73222b7a198478c29c
> Signed-off-by: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 989 +++++++++++++++++++++++++++++++
>  1 file changed, 989 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> new file mode 100644
> index 0000000..eb671f6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi

[...]

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts =
> +			<GIC_PPI 13
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			<GIC_PPI 14
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			<GIC_PPI 11
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			<GIC_PPI 10
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;

Please drop these GIC_CPU_MASK_SIMPLE from the interrupt specifiers,
they do not mean anything with GICv3.

> +		clock-frequency = <24000000>;

Are you sure you do need this? Can't your firmware be fixed to correctly
program CNTFRQ_EL0?

> +	};
> +
> +	xin24m: xin24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +	};
> +
> +	gic: interrupt-controller@fee00000 {
> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		interrupt-controller;
> +
> +		reg = <0x0 0xfee00000 0 0x10000>, /* GICD */
> +		      <0x0 0xfef00000 0 0xc0000>, /* GICR */
> +		      <0x0 0xfff00000 0 0x10000>, /* GICC */
> +		      <0x0 0xfff10000 0 0x10000>, /* GICH */
> +		      <0x0 0xfff20000 0 0x10000>; /* GICV */
> +		interrupts =
> +			<GIC_PPI 9
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;

Same remark about the mask.

> +		its: interrupt-controller@fee20000 {
> +			compatible = "arm,gic-v3-its";
> +			msi-controller;
> +			reg = <0x0 0xfee20000 0x0 0x20000>;
> +		};

Looks nice. Is there any peripheral capable of generating MSIs on this SoC?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
