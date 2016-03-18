From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 00/10] ARM: dts: rockchip: enable edp functionality
Date: Fri, 18 Mar 2016 15:40:34 -0700
Message-ID: <CAD=FV=Ua-Xx6hRxT+fkBOYdWAU6Oh+9DCxZmGBUBQ0d8zdU0MA@mail.gmail.com>
References: <1458265206-15733-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458265206-15733-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Thu, Mar 17, 2016 at 6:39 PM, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> This is the companion series to Yakir's rework of the analogix-dp
> driver used both by Exynos and Rockchip.
>
> These patches have been sitting in my tree for some time, and already
> got tested (and thus refined) by a number of people.
>
> So I'll post them now, to get applied after the driver-side gets
> accepted hopefully soonish.
>
>
> Caesar Wang (1):
>   ARM: dts: rockchip: add rk3288-veyron-jaq backlight and panel
>     overrides
>
> Heiko Stuebner (9):
>   ARM: dts: rockchip: add rk3288 edp-phy node
>   ARM: dts: rockchip: add rk3288 displayport controller node
>   ARM: dts: rockchip: move edp-hpd pin definition into common location
>   ARM: dts: rockchip: add startup delay to rk3288-veyron
>     panel-regulators
>   ARM: dts: rockchip: add core rk3288-veyron backlight and panel nodes
>   ARM: dts: rockchip: add rk3288-veyron-minnie backlight and panel
>     settings
>   ARM: dts: rockchip: override edp hpd handling on veyron-pinky and
>     speedy
>   ARM: dts: rockchip: simple panel and backlight supplies on veyron
>     boards
>   ARM: dts: rockchip: enable the eDP on rk3288 veyron devices
>
>  arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 100 ++++++++++++++++++++++++
>  arch/arm/boot/dts/rk3288-veyron-jaq.dts         |  49 ++++++++++--
>  arch/arm/boot/dts/rk3288-veyron-jerry.dts       |   9 +++
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts      |  44 +++++++++++
>  arch/arm/boot/dts/rk3288-veyron-pinky.dts       |   7 ++
>  arch/arm/boot/dts/rk3288-veyron-speedy.dts      |  16 ++++
>  arch/arm/boot/dts/rk3288.dtsi                   |  59 ++++++++++++++
>  7 files changed, 278 insertions(+), 6 deletions(-)

Awesome!  I picked this along with the eDP series and I was able to
use the builtin panel on my veyron-jerry.  :)  I was testing on a
4.4-based tree with backports.

Tested-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
