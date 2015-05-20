From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: dts: mt8173: Add PMIC wrapper device node
Date: Wed, 20 May 2015 16:44:09 +0800
Message-ID: <CAGS+omD2cE9HyyXsV-2+m5Ugj0EC-dmBo1QRsROM3URu+7mhsA@mail.gmail.com>
References: <1432032824-7955-1-git-send-email-s.hauer@pengutronix.de> <1432032824-7955-4-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432032824-7955-4-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sasha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 6:53 PM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> This adds the device node for the PMIC wrapper.
>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index cfdca03..16ec639 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -14,6 +14,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include "mt8173-pinfunc.h"
> +#include <dt-bindings/reset-controller/mt8173-resets.h>
>  #include <dt-bindings/clock/mt8173-clk.h>
>
>  / {
> @@ -154,6 +155,17 @@
>                                                 <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               pwrap: pwrap@1000D000 {
> +                       compatible = "mediatek,mt8173-pwrap";
> +                       reg = <0 0x1000D000 0 0x1000>;

nit: Use lowercase for the hex value 'd' in reg and pwrap@<>.

With that fixed, this one is:
Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


> +                       reg-names = "pwrap";
> +                       interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +                       resets = <&infracfg MT8173_INFRA_PMIC_WRAP_RST>;
> +                       reset-names = "pwrap";
> +                       clocks = <&infracfg CLK_INFRA_PMICSPI>, <&infracfg CLK_INFRA_PMICWRAP>;
> +                       clock-names = "spi", "wrap";
> +               };
> +
>                 sysirq: intpol-controller@10200620 {
>                         compatible = "mediatek,mt8173-sysirq",
>                                         "mediatek,mt6577-sysirq";
> --
> 2.1.4
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
