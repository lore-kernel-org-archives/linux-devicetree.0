From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: phy-rockchip-typec: add usb3 otg reset
Date: Sat, 10 Feb 2018 20:55:45 +0100
Message-ID: <1907466.pgqOKPpIkg@phil>
References: <1515751704-13213-1-git-send-email-william.wu@rock-chips.com> <20180119214916.fegrzgcmbbdiesyz@rob-hp-laptop> <d05fb977-cd6c-4875-25be-9212e75b7e39@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d05fb977-cd6c-4875-25be-9212e75b7e39-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wlf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, lin.huang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Wulf,

Am Montag, 22. Januar 2018, 12:33:05 CET schrieb wlf:
> 在 2018年01月20日 05:49, Rob Herring 写道:
> > On Thu, Jan 18, 2018 at 09:47:50AM -0800, Brian Norris wrote:
> >> On Thu, Jan 18, 2018 at 06:20:09PM +0100, Enric Balletbo Serra wrote:
> >>> As Brian said commit 06c47e6286d5 'usb: dwc3: of-simple: Add support
> >>> to get resets for the device' introduced the support to get the resets
> >>> from dwc3-of-simple and the queued commit 'b7e63d95c14d arm64: dts:
> >>> rockchip: add reset property for dwc3 controllers on rk3399' started
> >>> using it. Without the latest I get errors like this doing bind/unbind
> >>> tests.
> >>>
> >>>     dwc3: probe of fe900000.dwc3 failed with error -110
> >>>
> >>> I just tested these series on top of mainline, I reverted my patch
> >>> because otherwise two drivers are requesting the same reset and fails,
> >>> and I did some of the bind/unbind test. They just worked fine, and
> >>> seems that this is right way, so this makes me think some questions.
> >> Actually, this was intended to coexist with DWC3 optionally controlling
> >> the same reset. It was written before the reset framework was rewritten
> >> to have shared and exclusive resets. Should this be rewritten to use
> >> shared resets? We'd have to modify both dwc3 core and the PHY driver.
> > Seems like abuse of DT to me. If you need to control the controller's
> > reset from the phy driver, then get the reset out of the controller
> > node. The phy node should describe the connections to the phy.
> I try to get the reset out of the controller, but I don't find a good
> way to get the reset ofthe controller associated with the given phy
> device node.  Is there an API like theof_usb_get_dr_mode_by_phy() to
> get 'dr_mode' of the controller?

I guess the easiest way would be taking the of_usb_get_dr_mode_by_phy()
function move the part above the "finish" label into a separate function
like of_usb_get_node_by_phy (or possibly move that to an even more general
place as it is not usb-related at all) and use that function in
of_usb_get_dr_mode_by_phy() and also use it to get the reset you want via
something like:

node = of_usb_get_node_by_phy(...);
rst = of_reset_control_get(node, ...);

> And we're trying to find another method to fix the RK3399 tcphy power
> on fail issue.If we get another proper method, we may not need these
> phy patch series.

Did you find any different solution for that yet?

Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
