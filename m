From: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add clk-480m for ehci and ohci
 of rk3399
Date: Thu, 15 Dec 2016 08:34:09 -0800
Message-ID: <CAD=FV=XKQaqRS4jUM7NpN2KEV8USj_cVWbh7q4274n3jBtwORg@mail.gmail.com>
References: <1481710301-1454-1-git-send-email-zhengxing@rock-chips.com>
 <1481710301-1454-4-git-send-email-zhengxing@rock-chips.com>
 <CAD=FV=UU4JdRjRgEvc_wxprvi6bo46+jd=x2m2QzOe4uJmuRPA@mail.gmail.com>
 <5ce521da-119a-2de8-026c-5992fedfef43@rock-chips.com>
 <991221a4-3962-1bcb-7863-72f5553eba40@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <991221a4-3962-1bcb-7863-72f5553eba40-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "daniel.meng" <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Dec 14, 2016 at 10:41 PM, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Hi Brain, Doug and Heiko,
>
> I would like to summarize why this story was constructed.
>
> The ehci/ohci-platform suspend process are blocked due to UTMI clock which
> directly output from usb-phy has been disabled, and why the UTMI clock was
> disabled?
>
> UTMI clock and 480m clock all output from the same internal PLL of usb-phy,
> and there is only one bit can use to control this PLL on or off, which we
> named "otg_commononn"(GRF, offset 0x0e450/0x0e460 bit4 ) in RK3399 TRM.
>
> When system boot up, ehci/ohci-platform probe function invoke
> phy_power_on(), further invoke rockchip_usb2phy_power_on() to enable 480m
> clock, actually, it sets the otg_commononn bit on, and then usb-phy will go
> to (auto)suspend if there is no devices plug-in after 1 minute, the
> rockchip_usb2phy_power_off() will be invoked and the 480m clock may be
> disabled in the (auto)suspend process. As a result, the otg_commononn bit
> may be turned off, and all output clock of usb-phy will be disabled.
> However, ehci/ohci-platform PM suspend operation (read/write controller
> register) are based on the UTMI clock.
>
> So we introduced "clk_usbphy0_480m_src"/"clk_usbphy1_480m_src" as one input
> clock for ehci/ohci-platform, in this way, the otg_commononn bit is not
> turned off until ehci/ohci-platform go to PM suspend.

I still need to digest all of the things that were added to this
thread overnight, but nothing I've seen so far indicates that you need
the post-gated clock.  AKA I still think you need to redo your patch
to replace:

              clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
                       <&cru SCLK_USBPHY0_480M_SRC>;

with:

              clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
                        <&u2phy0>;

Can you please comment on that?

-Doug
