From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: add usb2-phy otg-port support for rk3399
Date: Tue, 15 Nov 2016 16:43:16 +0100
Message-ID: <3322090.Jd0z3Op9pV@phil>
References: <1478520529-8869-1-git-send-email-wulf@rock-chips.com> <1478520529-8869-3-git-send-email-wulf@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478520529-8869-3-git-send-email-wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 7. November 2016, 20:08:49 CET schrieb William Wu:
> Add otg-port nodes for both u2phy0 and u2phy1. The otg-port can
> be used for USB2.0 part of USB3.0 OTG controller.
> 
> Signed-off-by: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v3:
> - None
> 
> Changes in v2:
> - None
> 
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index b65c193..ea2df51 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1095,6 +1095,17 @@
>  			clock-output-names = "clk_usbphy0_480m";
>  			status = "disabled";
> 
> +			u2phy0_otg: otg-port {
> +				#phy-cells = <0>;
> +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
> +					     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH 0>;
> +				interrupt-names = "otg-bvalid", "otg-id",
> +						  "linestate";
> +				status = "disabled";
> +			};
> +
> +

applied to my dts64 branch after removing that double empty line and also 
switching host and otg sub nodes to get alphabetical sorting.


Thanks
Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
