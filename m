From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Add dmac_bus rx and tx for uart2
Date: Tue, 16 Jun 2015 13:37:33 +0200
Message-ID: <34159914.9nlETdacuk@phil>
References: <1434390468-27296-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434390468-27296-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Montag, 15. Juni 2015, 17:47:48 schrieb Romain Perier:
> This removes warning "ttyS2 - Failed to request dma" from kernel logs
> 
> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 22316d0..816f40a 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -385,6 +385,8 @@
>  		clock-names = "baudclk", "apb_pclk";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&uart2_xfer>;
> +		dmas = <&dmac_bus_s 4>, <&dmac_bus_s 5>;
> +		dma-names = "tx", "rx";
>  		status = "disabled";
>  	};

The dma channels are a property of the hardware, so we probably should add 
them for all uarts in one go, instead of everytime something complains :-)

in dmac_peri
uart0: tx 1, rx 2
uart1: tx 3, rx 4
uart3: tx 7, rx 8
uart4: tx 9, rx 10


Just for the record and if anybody is interested to work in this, we have an 
issue with the dma implementation [0] that is not yet solved upstream. From 
what I've remember, that mostly got triggered on higher speeds, like higher 
spi-speeds or i2s audio stuff (poping).


Heiko

[0] 
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/93c3b192dca7e8c773c4d28873114c325382b63e%5E%21/#F0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
