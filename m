From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Add DMA tx and rx channels in UART
 interfaces for RK3288 SoCs
Date: Tue, 23 Jun 2015 08:53:17 +0200
Message-ID: <CABgxDo+8MafT8hOzpG=gjju=S7bVtNBOKxmi_JPHv1bDZSGeCQ@mail.gmail.com>
References: <1434475166-30338-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434475166-30338-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ping :)

2015-06-16 19:19 GMT+02:00 Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> This enable DMA capability for the corresponding UART interfaces, also it removes
> warning "ttyS%d - Failed to request dma" from kernel logs.
>
> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>
> Changes since v1 ("[PATCH] ARM: dts: rockchip: Add dmac_bus rx and tx for uart2"):
>         - Add DMA tx and rx channels for all UART interfaces
>         - Rename commit summary
>
>  arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 22316d0..1996452 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -359,6 +359,8 @@
>                 clock-names = "baudclk", "apb_pclk";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&uart0_xfer>;
> +               dmas = <&dmac_peri 1>, <&dmac_peri 2>;
> +               dma-names = "tx", "rx";
>                 status = "disabled";
>         };
>
> @@ -372,6 +374,8 @@
>                 clock-names = "baudclk", "apb_pclk";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&uart1_xfer>;
> +               dmas = <&dmac_peri 3>, <&dmac_peri 4>;
> +               dma-names = "tx", "rx";
>                 status = "disabled";
>         };
>
> @@ -385,6 +389,8 @@
>                 clock-names = "baudclk", "apb_pclk";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&uart2_xfer>;
> +               dmas = <&dmac_bus_s 4>, <&dmac_bus_s 5>;
> +               dma-names = "tx", "rx";
>                 status = "disabled";
>         };
>
> @@ -398,6 +404,8 @@
>                 clock-names = "baudclk", "apb_pclk";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&uart3_xfer>;
> +               dmas = <&dmac_peri 7>, <&dmac_peri 8>;
> +               dma-names = "tx", "rx";
>                 status = "disabled";
>         };
>
> @@ -411,6 +419,8 @@
>                 clock-names = "baudclk", "apb_pclk";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&uart4_xfer>;
> +               dmas = <&dmac_peri 9>, <&dmac_peri 10>;
> +               dma-names = "tx", "rx";
>                 status = "disabled";
>         };
>
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
