From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add clk-480m for ehci and ohci of rk3399
Date: Sat, 17 Dec 2016 02:20:22 +0100
Message-ID: <9948170.UXsXzrYPRK@phil>
References: <1481710301-1454-1-git-send-email-zhengxing@rock-chips.com> <2526685.VC5cUs58On@phil> <5853903D.8030605@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5853903D.8030605-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 16. Dezember 2016, 14:57:01 CET schrieb Xing Zheng:
> Hi Heiko, Doug,
> 
> On 2016年12月16日 02:18, Heiko Stuebner wrote:
> > Am Donnerstag, 15. Dezember 2016, 08:34:09 CET schrieb Doug Anderson:
> >> I still need to digest all of the things that were added to this
> >> thread overnight, but nothing I've seen so far indicates that you need
> >> the post-gated clock.  AKA I still think you need to redo your patch
> >> 
> >> to replace:
> >>                clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
> >>                
> >>                         <&cru SCLK_USBPHY0_480M_SRC>;
> >> 
> >> with:
> >>                clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
> >>                
> >>                          <&u2phy0>;
> >> 
> >> Can you please comment on that?
> > 
> > Also, with the change, the ehci will keep the clock (and thus the phy)
> > always on. Does the phy-autosuspend even save anything now?
> > 
> > In any case, could we make the clock-names entry sound nicer than
> > usbphy0_480m please? bindings/usb/atmel-usb.txt calls its UTMI clock
> > simply "usb_clk", but something like "utmi" should also work.
> > While at it you could also fix up the other clock names to something like
> > "host" and "arbiter" or so?.
> > 
> > 
> > Heiko
> 
> The usbphy related clock tress like this:
> 
> 
> Actually, at drivers/phy/phy-rockchip-inno-usb2.c, we can only
> enable/disable the master gate via GRF is PHY_PLL, not UTMI_CLK.
> 
> And the naming style of the "hclk_host0" keep the name "hclk_host0" on
> the clcok tree diagram:
> 
> 
> Therefore, could we rename the clock name like this:
> ----
> for usb_host0_ehci and usb_host0_ohci:
>          clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
>               <&cru SCLK_U2PHY0>;
>          clock-names = "hclk_host0", "hclk_host0_arb",
>                    "sclk_u2phy0";
> 
> for usb_host1_ehci and usb_host1_ohci:
>          clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
>               <&cru SCLK_U2PHY1>;
>          clock-names = "hclk_host1", "hclk_host1_arb",
>                    "sclk_u2phy1";
> ----
> 
> BTW, the "arb" is an abbreviation for arbiter.

clock-naming wise, the clock names in devicetree bindings should always 
describe the clock in the context of the peripheral, not the hosts clock-tree.

So if the clock supplies the "arbiter" part, the clock-name should be called 
"arbiter". Same for "utmi" and the host clock that could be named "usbhost" or 
just "host" in the clock-names property.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
