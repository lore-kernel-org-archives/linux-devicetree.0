From: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Subject: Re: [PATCH v3 09/13] dt-bindings: adc: add description for rv1108
 saradc
Date: Sat, 12 Aug 2017 13:39:13 +0100
Message-ID: <20170812133913.5311a274@archlinux>
References: <1502422578-30611-1-git-send-email-andy.yan@rock-chips.com>
        <1502423180-31154-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502423180-31154-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Aug 2017 11:46:20 +0800
Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:

> Add device tree bindings document for saradc on
> rockchip rv1108 soc.
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
I've already applied.  This please drop it from the next version of the
series.

Jonathan
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> index e0a9b9d..c2c50b5 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> @@ -6,6 +6,7 @@ Required properties:
>     - "rockchip,rk3066-tsadc": for rk3036
>     - "rockchip,rk3328-saradc", "rockchip,rk3399-saradc": for rk3328
>     - "rockchip,rk3399-saradc": for rk3399
> +   - "rockchip,rv1108-saradc", "rockchip,rk3399-saradc": for rv1108
>  
>  - reg: physical base address of the controller and length of memory mapped
>         region.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
