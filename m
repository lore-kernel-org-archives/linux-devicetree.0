From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add ddc i2c reference to veyron
Date: Fri, 04 Sep 2015 00:01:35 +0200
Message-ID: <5450060.vCTDljrI7r@phil>
References: <1441229148-12095-1-git-send-email-dianders@chromium.org> <CAD=FV=WkFPitTsagQa+94DAWujzYECVqk7fO+OUdrfFq3bWTuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=WkFPitTsagQa+94DAWujzYECVqk7fO+OUdrfFq3bWTuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?utf-8?B?5aea5pm65oOF?= <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 3. September 2015, 14:00:26 schrieb Doug Anderson:
> Hi,
> 
> On Wed, Sep 2, 2015 at 2:25 PM, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> 
wrote:
> > The ddc-i2c-bus property was missing from the veyron dtsi file since
> > downstream the ddc-i2c-bus was still being specified in rk3288.dtsi and
> > nobody noticed when the veyron dtsi was sent upstream.  Add it.
> > 
> > Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> > Note: I noticed that this was wrong but I don't currently have
> > graphics up and running on upstream on veyron.  Posting this anyway
> > since it's pretty clear that it's needed.  If someone else wants to
> > try it out that'd be nice, otherwise I'll put it on my list to figure
> > out how to get myself setup for graphics upstream.  ;)
> 
> OK, I've used Heiko's "somewhat stable" branch to test this against
> something very close to mainline.

for people playing along, that is [0]. Essentially bleeding edge mainline + 
some backports from other maintainer trees +the last bits in the works, like 
the eDP support.

> Without my patch I can't read the HDMI EDID.  With my patch I can.  :)

The change follows the current dt-binding in the kernel for the (rockchip-
variant of the) dw_hdmi, so if nobody keeps protesting loudly, I'd like to 
pick this up to get the hdmi on Veyron devices going.

And I guess we'll remove this again (also in the other boards), once the 
dw_hdmi-internal i2c stuff is included - so this should be temporary as Rob 
hoped.


Heiko


[0] https://github.com/mmind/linux-rockchip/tree/v4.2-rockchip-somewhat-stable

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
