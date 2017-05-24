From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip:remove hs200 support for firefly
 reload
Date: Wed, 24 May 2017 16:00:53 +0800
Message-ID: <65c7a442-4b2e-65e4-ea5e-0a723c257397@rock-chips.com>
References: <1495612242-28873-1-git-send-email-eddie.cai.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495612242-28873-1-git-send-email-eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2017/5/24 15:50, Eddie Cai wrote:
> due to layout limitation. not all of the reload board can support hs200.
> so remove hs200 support to make all board can boot up.

You now also remove DDR52, so all reload boards run at high speed mode?

I'm curious about what was the layout limitation that mmc tuning
process could never help?

>
> Signed-off-by: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> index 4cfa109..56ac1e6f 100644
> --- a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> +++ b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> @@ -75,8 +75,6 @@
>  	bus-width = <8>;
>  	cap-mmc-highspeed;
>  	disable-wp;
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
>  	non-removable;
>  	num-slots = <1>;
>  	pinctrl-names = "default";
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
