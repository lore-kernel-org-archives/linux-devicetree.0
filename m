From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v7 0/6] Build and support rk3036 SoC platform
Date: Tue, 24 Nov 2015 01:03:01 +0100
Message-ID: <1518219.zj9d8yfxJz@diego>
References: <1446708840-12038-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446708840-12038-1-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kmixter-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Xing Zheng,

Am Donnerstag, 5. November 2015, 15:33:54 schrieb Xing Zheng:
> Hi,
>   We need to support rk3036 soc platform via upstream, there are
> some primary parts for the initial release of minimum system: dts,
> clk-pll, smp, and clock tree for rk3036, and additional, we can use
> these startup and run to init processs.

[...]

after talking with Mike and agreeing that I'm again taking the regular
clock patches to them, I've applied all of this to appropriate branches.
I did some cosmetics, as explained below.


> Xing Zheng (6):
>   dt-bindings: add documentation of rk3036 clock controller
>   clk: rockchip: add dt-binding header for rk3036
>   clk: rockchip: add new pll-type for rk3036 and similar socs
- wrapped some overly long lines, otherwise this is similar to what
  Stephen already took for the rk3066-pll-type.


>   clk: rockchip: add clock controller for rk3036
>   ARM: dts: rockchip: add core rk3036 dts
- split off the evb into a separate patch
- reordered some nodes (please order by the address (the @xxxxxxxx)
- reordered some properties
- fixed the gic cpu masks


>   ARM: dts: enable smp for rk3036
folded into the core dtsi addition


Please take a final look at [0] to make sure I didn't mess up anything.


Thanks
Heiko


[0]
https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v4.5-clk/next
https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v4.5-armsoc/dts32
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
