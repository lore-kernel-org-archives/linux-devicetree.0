From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 09/41] Documentation: dt: clock: fix spelling mistakes
Date: Mon, 25 Apr 2016 09:31:34 +0200
Message-ID: <2265117.YTl3hp9ROk@diego>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch> <1461543878-3639-10-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461543878-3639-10-git-send-email-eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 25. April 2016, 01:24:06 schrieb Eric Engestrom:
> Signed-off-by: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt | 2 +-
>  Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt | 2 +-
>  Documentation/devicetree/bindings/clock/st/st,clkgen.txt        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt
> b/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt index
> 0c2bf5e..7f36853 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt
> @@ -16,7 +16,7 @@ Required Properties:
>  Optional Properties:
> 
>  - rockchip,grf: phandle to the syscon managing the "general register files"
> -  If missing pll rates are not changable, due to the missing pll lock
> status. +  If missing pll rates are not changeable, due to the missing pll
> lock status.
> 
>  Each clock is assigned an identifier and client nodes can use this
> identifier to specify the clock which they consume. All available clocks
> are defined as diff --git
> a/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> b/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt index
> c9fbb76..8cb47c3 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> @@ -15,7 +15,7 @@ Required Properties:
>  Optional Properties:
> 
>  - rockchip,grf: phandle to the syscon managing the "general register files"
> -  If missing pll rates are not changable, due to the missing pll lock
> status. +  If missing pll rates are not changeable, due to the missing pll
> lock status.
> 
>  Each clock is assigned an identifier and client nodes can use this
> identifier to specify the clock which they consume. All available clocks
> are defined as

For the Rockchip parts
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
