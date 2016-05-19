From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] spi/rockchip: add rk3036/rk3228/rk3368 socs for spi document
Date: Thu, 19 May 2016 17:51:54 +0200
Message-ID: <3685935.dKdIbE8hXb@phil>
References: <1463672824-15367-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463672824-15367-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 19. Mai 2016, 23:47:02 schrieb Caesar Wang:
> We had supported the rk3036/rk3066/rk3188/rk3228/rk3288/rk3368/rk3399
> family SoCs in linux kernel.
> 
> Let's add the other SoCs, in order to a better understanding from the
> rockchip spi document.
> 
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> ---
> 
>  Documentation/devicetree/bindings/spi/spi-rockchip.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.txt
> b/Documentation/devicetree/bindings/spi/spi-rockchip.txt index
> 1b14d69..305b542 100644
> --- a/Documentation/devicetree/bindings/spi/spi-rockchip.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-rockchip.txt
> @@ -6,9 +6,12 @@ and display controllers using the SPI communication
> interface. Required Properties:
> 
>  - compatible: should be one of the following.
> +    "rockchip,rk3036-spi" for rk3036.

shouldn't the rk3036 also get the rk3066 fallback. Looking at the driver 
part (patch2) the rk3036 still is the same IP as for every other soc in 
here.

>      "rockchip,rk3066-spi" for rk3066.
>      "rockchip,rk3188-spi", "rockchip,rk3066-spi" for rk3188.
> +    "rockchip,rk3228-spi", "rockchip,rk3066-spi" for rk3228.
>      "rockchip,rk3288-spi", "rockchip,rk3066-spi" for rk3288.
> +    "rockchip,rk3368-spi", "rockchip,rk3066-spi" for rk3368.
>      "rockchip,rk3399-spi", "rockchip,rk3066-spi" for rk3399.
>  - reg: physical base address of the controller and length of memory
> mapped region.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
