From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something better?
Date: Wed, 23 Oct 2013 21:14:17 -0400
Message-ID: <CAF6AEGtt_2sStiZCNBp9btxevWghSwLZZBdN6ir8eUpX1FXrCQ@mail.gmail.com>
References: <52644A9E.3060007@wwwdotorg.org>
	<20131020231134.GR25034@n2100.arm.linux.org.uk>
	<20131021083242.GB30088@pengutronix.de>
	<20131021084854.GV25034@n2100.arm.linux.org.uk>
	<20131021092730.GF30088@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131021092730.GF30088-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 21, 2013 at 5:27 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> If a subsystem doesn't work well with DT, then the choices are either:
>>
>> (a) don't use DT with the subsystem
>
> The underlying problem has nothing to do with DT. Multi component
> hardware does exist and won't vanish when we stop using DT.
>
>> (b) fix the subsystem
>
> I'd love to do that. Step one to this seems to be to increase the
> awareness that there's something wrong with DRM.


Note that I suspect your idea of "fixing drm" is going to break some
userspace assumptions about the hw (ie. userspace isn't expecting
crtcs/encoders/connectors to suddenly appear/disappear.  And the funny
thing is, on all of this hw, that isn't going to happen anyways.

In whatever is done, we need some way to know all the devices in hw
that comprise the "graphics card", so that we can -EPROBE_DEFER until
we have all the bits and pieces.

BR,
-R
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
