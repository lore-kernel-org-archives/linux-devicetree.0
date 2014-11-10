From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v7 4/5] ARM: dts: add RK3288 suspend support
Date: Mon, 10 Nov 2014 10:40:14 -0800
Message-ID: <CAD=FV=Uur0za+NX-vKWhPq61JFBwFRHu2MNFeaLQmpsZbs87dg@mail.gmail.com>
References: <1415368177-6637-1-git-send-email-zyw@rock-chips.com>
	<1415368177-6637-5-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415368177-6637-5-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Chris,

On Fri, Nov 7, 2014 at 5:49 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> add pmu sram node for suspend, add global_pwroff pinctrl.
> The pmu sram is used to store the resume code.
> global_pwroff is held low level at work, it would be pull to high
> when entering suspend. reference this in the board DTS file since
> some boards need it.
>
> Signed-off-by: Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> ---
>
> Changes in v7: None
> Changes in v6:
> - change pmu_intmem@ff720000 to sram@ff720000
>
> Changes in v5:
> - change size to 4k
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - put "rockchip,rk3288-pmu-sram" to first
>
>  arch/arm/boot/dts/rk3288.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

I was sorta hoping that when you sent out v7 you'd incorporate the
extra dts bits that you sent me and that I had stashed at
<https://chromium-review.googlesource.com/#/c/226826/>.  Maybe you
could do it if you send out a v8.

If you don't send out a v8 we could always land those bits separately.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
