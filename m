From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 2/5] Documentation: bindings: add dt documentation for
 Rockchip usb PHY
Date: Thu, 11 Dec 2014 10:46:12 -0800
Message-ID: <CAD=FV=URDM5yH-t6kRvq=70v3OM=a7z6TesBrzqGZ9m-oxf+qg@mail.gmail.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>
	<1418291722-25448-3-git-send-email-lyz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418291722-25448-3-git-send-email-lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Chris <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Yunzhi,

On Thu, Dec 11, 2014 at 1:55 AM, Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> This patch adds a binding that describes the Rockchip usb PHYs
> found on Rockchip SoCs usb interface.

Technically the bindings patch is supposed to come before the driver.
So this should be patch #1 and the driver patch #2.


> +Required properties:
> + - compatible: rockchip,rk3288-usb-phy
> + - rockchip,grf : phandle to the syscon managing the "general
> +   register files"
> + - #phy-cells: should be 1
> + - #address-cells: should be 1
> + - #size-cells: should be 0
> +
> +Sub-nodes:
> +Each PHY should be represented as a sub-node.
> +
> +Sub-nodes
> +required properties:
> +- reg: the PHY number
> +               "0" - PHY connect to OTG controller
> +               "1" - PHY connect to HOST0 controller
> +               "2" - PHY connect to HOST1 controller

You don't have any sub nodes and are using the phy-cells.  Seems like
you should get rid of this?  ...or I guess switch to using sub nodes
and set "phy-cells" to 0?

> +
> +Optional Properties:
> +- clocks : phandle + clock specifier for the phy clocks

As per earlier, you should get rid of clocks.  If you really want a
clock here and it's optional:

* Back in the driver it shouldn't be a "warn".  You don't warn when
optional things are missing.

* You really should specify a clock name.  Right now this will pick
the first clock, which makes it hard to later add clocks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
