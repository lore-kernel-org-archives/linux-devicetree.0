From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/25] arm: imx: dts: Remove leading 0x and 0s from
 bindings notation
Date: Fri, 15 Dec 2017 10:51:05 -0200
Message-ID: <CAOMZO5BrxG6RZWa0_LOUyjN2VyhiyKGiRXCPiOBNHQ-Fb4kCgQ@mail.gmail.com>
References: <20171215124631.30132-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215124631.30132-1-malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mathieu,

On Fri, Dec 15, 2017 at 10:46 AM, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
                 reg = <0x6C>;
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index 4d308d17f040..369d5a166b3e 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -129,7 +129,7 @@
>                 status = "disabled";
>         };
>
> -       pcie: pcie@0x33800000 {
> +       pcie: pcie@33800000 {

I have already sent a fix for this one.


>                 compatible = "fsl,imx7d-pcie", "snps,dw-pcie";
>                 reg = <0x33800000 0x4000>,
>                       <0x4ff00000 0x80000>;
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 82ad26e766eb..a00ba897e58d 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -583,7 +583,7 @@
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
>
> -                                       pgc_pcie_phy: pgc-power-domain@IMX7_POWER_DOMAIN_PCIE_PHY {
> +                                       pgc_pcie_phy: pgc-power-domain@imx7_power_domain_pcie_phy {


Original code was correct.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
