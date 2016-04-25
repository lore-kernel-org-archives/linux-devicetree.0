From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH 09/41] Documentation: dt: clock: fix spelling mistakes
Date: Sun, 24 Apr 2016 20:00:51 -0700
Message-ID: <571D8863.3030202@infradead.org>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-10-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1461543878-3639-10-git-send-email-eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/24/16 17:24, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt | 2 +-
>  Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt | 2 +-
>  Documentation/devicetree/bindings/clock/st/st,clkgen.txt        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt
> index 0c2bf5e..7f36853 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt
> @@ -16,7 +16,7 @@ Required Properties:
>  Optional Properties:
>  
>  - rockchip,grf: phandle to the syscon managing the "general register files"
> -  If missing pll rates are not changable, due to the missing pll lock status.
> +  If missing pll rates are not changeable, due to the missing pll lock status.
>  
>  Each clock is assigned an identifier and client nodes can use this identifier
>  to specify the clock which they consume. All available clocks are defined as
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> index c9fbb76..8cb47c3 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
> @@ -15,7 +15,7 @@ Required Properties:
>  Optional Properties:
>  
>  - rockchip,grf: phandle to the syscon managing the "general register files"
> -  If missing pll rates are not changable, due to the missing pll lock status.
> +  If missing pll rates are not changeable, due to the missing pll lock status.
>  
>  Each clock is assigned an identifier and client nodes can use this identifier
>  to specify the clock which they consume. All available clocks are defined as
> diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
> index 78978f1..426bdda 100644
> --- a/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
> +++ b/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
> @@ -40,7 +40,7 @@ address is common of all subnode.
>  	};
>  
>  This binding uses the common clock binding[1].
> -Each subnode should use the binding discribe in [2]..[7]
> +Each subnode should use the binding describe in [2]..[7]

described ?

>  
>  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>  [2] Documentation/devicetree/bindings/clock/st,clkgen-divmux.txt
> 


-- 
~Randy
