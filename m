From: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] phy: rockchip-inno-usb2: correct 480MHz output clock
 stable time
Date: Wed, 9 Nov 2016 12:54:18 -0800
Message-ID: <CAD=FV=VC15_QAs7+DOoqCeWrU6-qqnUku2SSPFLOvLanu8xL3g@mail.gmail.com>
References: <1478523658-9400-1-git-send-email-wulf@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478523658-9400-1-git-send-email-wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?6buE5rab?= <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 7, 2016 at 5:00 AM, William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> We found that the system crashed due to 480MHz output clock of
> USB2 PHY was unstable after clock had been enabled by gpu module.
>
> Theoretically, 1 millisecond is a critical value for 480MHz
> output clock stable time, so we try to change the delay time
> to 1.2 millisecond to avoid this issue.
>
> Signed-off-by: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  drivers/phy/phy-rockchip-inno-usb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/phy-rockchip-inno-usb2.c b/drivers/phy/phy-rockchip-inno-usb2.c
> index ecfd7d1..8f2d2b6 100644
> --- a/drivers/phy/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
> @@ -267,7 +267,7 @@ static int rockchip_usb2phy_clk480m_enable(struct clk_hw *hw)
>                         return ret;
>
>                 /* waitting for the clk become stable */
> -               mdelay(1);
> +               udelay(1200);

Several people who have seen this patch have expressed concern that a
1.2 ms delay is pretty long for something that's supposed to be
"atomic" like a clk_enable().  Consider that someone might call
clk_enable() while interrupts are disabled and that a 1.2 ms interrupt
latency is not so great.

It seems like this clock should be moved to be enabled in "prepare"
and the "enable" should be a no-op.  This is a functionality change,
but I don't think there are any real users for this clock at the
moment so it should be fine.

(of course, the 1 ms latency that existed before this patch was still
pretty bad, but ...)

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
