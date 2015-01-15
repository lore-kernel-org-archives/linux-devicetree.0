From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: add vendor prefix and root compatible property for Rockchip boards
Date: Thu, 15 Jan 2015 15:12:13 +0100
Message-ID: <35535970.XLZHSuqDIg@phil>
References: <1421289659-16627-1-git-send-email-naobsd@gmail.com> <1421289659-16627-2-git-send-email-naobsd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421289659-16627-2-git-send-email-naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 15. Januar 2015, 11:40:57 schrieb FUKAUMI Naoki:
> this adds vendor prefix and root compatible property for following boards
> 
> - Firefly, Firefly-RK3288 board
> - ChipSPARK, Rayeager PX2 board
> 
> PX2 SoC is fully compatible with RK3066.
> 
> Signed-off-by: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.txt    | 8 ++++++++
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt
> b/Documentation/devicetree/bindings/arm/rockchip.txt index
> eaa3d1a..7cc1cecd 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> @@ -9,6 +9,14 @@ Rockchip platforms device tree bindings
>      Required root node properties:
>        - compatible = "mundoreader,bq-curie2", "rockchip,rk3066a";
> 
> +- ChipSPARK Rayeager PX2 board:
> +    Required root node properties:
> +      - compatible = "chipspark,rayeager-px2", "rockchip,rk3066a";
> +
>  - Radxa Rock board:
>      Required root node properties:
>        - compatible = "radxa,rock", "rockchip,rk3188";
> +
> +- Firefly Firefly-RK3288 board:
> +    Required root node properties:
> +      - compatible = "firefly,firefly-rk3288", "rockchip,rk3288";

you're adding two boards (beta and retail) and as they are not compatible to 
each other (see gpio differences), they should also have their own compatible 
properties, so something like:

- Firefly Firefly-RK3288 board:
    Required root node properties:
      - compatible = "firefly,firefly-rk3288", "rockchip,rk3288";
    or
      - compatible = "firefly,firefly-rk3288-beta", "rockchip,rk3288";

and this differentiation should of course also happen in the dts files themself.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
