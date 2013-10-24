From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something better?
Date: Thu, 24 Oct 2013 17:21:54 -0400
Message-ID: <CAF6AEGuEho9Ms7ifTE-EmBoQ-=_AXgvGcJxi5qEC0vsZ+H9C+A@mail.gmail.com>
References: <52644A9E.3060007@wwwdotorg.org>
	<20131020231134.GR25034@n2100.arm.linux.org.uk>
	<20131021083242.GB30088@pengutronix.de>
	<20131021084854.GV25034@n2100.arm.linux.org.uk>
	<20131021092730.GF30088@pengutronix.de>
	<CAF6AEGtt_2sStiZCNBp9btxevWghSwLZZBdN6ir8eUpX1FXrCQ@mail.gmail.com>
	<20131024072811.GS30088@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131024072811.GS30088-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 24, 2013 at 3:28 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Wed, Oct 23, 2013 at 09:14:17PM -0400, Rob Clark wrote:
>> On Mon, Oct 21, 2013 at 5:27 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> >> If a subsystem doesn't work well with DT, then the choices are either:
>> >>
>> >> (a) don't use DT with the subsystem
>> >
>> > The underlying problem has nothing to do with DT. Multi component
>> > hardware does exist and won't vanish when we stop using DT.
>> >
>> >> (b) fix the subsystem
>> >
>> > I'd love to do that. Step one to this seems to be to increase the
>> > awareness that there's something wrong with DRM.
>>
>>
>> Note that I suspect your idea of "fixing drm" is going to break some
>> userspace assumptions about the hw (ie. userspace isn't expecting
>> crtcs/encoders/connectors to suddenly appear/disappear.  And the funny
>> thing is, on all of this hw, that isn't going to happen anyways.
>
> I was talking about all SoC DRM drivers implementing variants of the
> same glue between drm and the multidevice nature of the components.
>
> To make that sure: I never had the intention to implement hotplug for
> drm. Also what the imx-drm driver does is not for hotplug, but only for
> binding different components together.

ahh, ok.  Yeah, we do need some way to make this easier, as it is a
too-common pattern.  I do think we do need a way to know if something
is missing because it isn't there vs it hasn't been probed yet.  Ie.
late_initcall() is not the awesome solution.

BR,
-R

> Sascha
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
