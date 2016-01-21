From: Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ARM: dts: imx7d: add arch timer
Date: Thu, 21 Jan 2016 16:39:14 -0600
Message-ID: <CAHrpEqS2upM1FANu9tjzmwxscOH3Y56S7naj7sPF9dKmn51_zw@mail.gmail.com>
References: <1452014237-12848-1-git-send-email-Frank.Li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452014237-12848-1-git-send-email-Frank.Li-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Li <Frank.Li-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 5, 2016 at 11:17 AM, Frank Li <Frank.Li-3arQi8VN3Tc@public.gmane.org> wrote:
> From: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> Since uboot v2016.01-rc2, which supported basic psci for i.mx7d.
> So imx7d's second core can be enabled by psci.
>
> Without arch timer, every timer event will be boardcasted to each core.
> arch timer has local timer irq for each core.
>
> Signed-off-by: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---

Ping

>
> Change from v1 to v2:
>  * refine commit message show the relationship between smp and arch timer
>
>  arch/arm/boot/dts/imx7d.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index 489604a..a621af6 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -119,6 +119,15 @@
>                 clock-output-names = "osc";
>         };
>
> +       timer {
> +               compatible = "arm,armv7-timer";
> +               interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +               interrupt-parent = <&intc>;
> +       };
> +
>         etr@30086000 {
>                 compatible = "arm,coresight-tmc", "arm,primecell";
>                 reg = <0x30086000 0x1000>;
> --
> 2.5.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
