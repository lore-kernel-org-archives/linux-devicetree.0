From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173-evb: Add PMIC support
Date: Mon, 6 Jul 2015 15:43:57 +0800
Message-ID: <1436168637.6986.6.camel@mtksdaap41>
References: <1434979177-7575-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434979177-7575-1-git-send-email-henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Mon, 2015-06-22 at 21:19 +0800, Henry Chen wrote:
> From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> The MT8173 eval board contains a MT6397 PMIC. This adds the
> corresponding device node to the dts file.
> 
> Signed-off-by: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
> Base on 4.1-rc1 and commit as following,
> ARM64: dts: Mediatek: MT8173 updates [1] and 
> clk: Add common clock support for Mediatek MT8135 and MT8173 [2] patch
> 
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/344751.html
> [2] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-April/338763.html
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 174 ++++++++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 43d5401..b967914 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -33,6 +33,180 @@
>  	chosen { };
>  };
>  
> +&pwrap {
> +	pmic: mt6397 {
> +		compatible = "mediatek,mt6397";
> +		interrupt-parent = <&pio>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		mt6397regulator: mt6397regulator {
> +			compatible = "mediatek,mt6397-regulator";
> +			mt6397_vpca15_reg: buck_vpca15 {
> +				regulator-compatible = "buck_vpca15";
> +				regulator-name = "vpca15";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;

I see you pull da9211 regulator dts patch, but not this one. How about
this patch ?

Thanks
Eddie


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
