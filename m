From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: add Asus Tinker board
Date: Sat, 21 Jan 2017 14:42:17 -0600
Message-ID: <20170121204217.y54lup7wkm7y7iwp@rob-hp-laptop>
References: <1484791919-4665-1-git-send-email-eddie.cai@rock-chips.com>
 <1484791919-4665-2-git-send-email-eddie.cai@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484791919-4665-2-git-send-email-eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 10:11:58AM +0800, Eddie Cai wrote:
> Tinker board is a credit card size develop board designed by Asus.
> Powered by RK3288.
> 
> Signed-off-by: Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
> index cc4ace6..ce1f04a 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> @@ -1,5 +1,8 @@
>  Rockchip platforms device tree bindings
>  ---------------------------------------
> +- Asus Tinker board
> +    Required root node properties:
> +      - compatible = "rockchip,rk3288-tinker", "rockchip,rk3288";

This should be asus,tinker if that's specific enough. At least the board 
manufacturer should be the vendor.

>  
>  - Kylin RK3036 board:
>      Required root node properties:
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
