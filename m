From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM64: dts: rockchip: add sdhci/emmc for rk3399
Date: Thu, 12 May 2016 15:22:23 -0700
Message-ID: <20160512222223.GA57835@google.com>
References: <1462924975-69072-1-git-send-email-briannorris@chromium.org>
 <3e257ce2-056a-592a-9481-970da1fe0627@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3e257ce2-056a-592a-9481-970da1fe0627-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, h <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 11, 2016 at 09:17:38AM +0800, Shawn Lin wrote:
> How about adding these?
> 
> assigned-clocks = <&cru SCLK_EMMC>;
> assigned-clock-parents = <&cru PLL_CPLL>; //may not need

BTW, even if I assign the parent here, it's not actually taking effect
on my system. Presumably the common clock framework is finding a
"better" way to satisfy 200 MHz through GPLL instead. So I'm dropping
the assigned-clock-parents for v2.

> assigned-clock-rates = <200000000>;

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
