From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/3] Documentation: dt-bindings: Add snps,need-phy-for-wake
 for dwc2 USB
Date: Tue, 23 Jun 2015 08:12:05 -0700
Message-ID: <CAD=FV=Xpp7GsycBTneJ07vVbh3qaOWtdDVMoS7oh=eqo8CYDrA@mail.gmail.com>
References: <1435017144-2971-1-git-send-email-dianders@chromium.org>
	<1435017144-2971-3-git-send-email-dianders@chromium.org>
	<CAL_JsqJT42GhY45FWY5G=450zxSRVLHu36_O1tPkTdH39JeEcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJT42GhY45FWY5G=450zxSRVLHu36_O1tPkTdH39JeEcw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Gregory Herrero <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob,

On Tue, Jun 23, 2015 at 7:17 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Jun 22, 2015 at 6:52 PM, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> Some SoCs with a dwc2 USB controller may need to keep the PHY on to
>> support remote wakeup.  Allow specifying this as a device tree
>> property.
>
> I find it hard to believe that any host can support wake-up without
> the PHY.

I am told by Andrew Bresticker that on tegra there is complicated
logic in the PMU that allows USB wakeup while powering off the PHY.
If I hadn't been aware of such a feature I probably would have called
the property "wakeup-supported" or something like that.

> Does this really need to be conditional? Perhaps other cases
> are just always-on or remote wake-up has not been tested.

When I worked on exynos products I was told by Samsung that USB wakeup
was simply not possible.  True that they have a different USB
controller, but I can certainly believe that someone could design a
system with dwc2 where USB wakeup was not possible.

Specifically, in order to get USB wakeup we had to switch on the 24MHz
clock at suspend time.  Had that not been possible (or had the 24MHz
clock not been able to be a clock source for the USB controller) then
USB wakeup would not be possible on rk3288 even if we left the phy on.

So to me the three states are:
1. USB wake not possible
2. USB wake possible, don't need PHY
3. USB wake possible, do need PHY

I don't know of any dwc2 users that are in #2 (so I didn't add a
property now), but I figure that when they exist someone should add a
property then.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
