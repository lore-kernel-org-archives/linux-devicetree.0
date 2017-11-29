From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Allow a device to indicate when to force
 a state
Date: Wed, 29 Nov 2017 10:27:29 -0800
Message-ID: <20171129182729.GK28152@atomide.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com>
 <20171102231551.16220-2-f.fainelli@gmail.com>
 <20171129170102.GH28152@atomide.com>
 <d1695f25-a795-cbda-bee4-47c0b16050f8@gmail.com>
 <20171129174500.GJ28152@atomide.com>
 <ff2e6268-4738-4858-5cf0-368a23c81ccc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ff2e6268-4738-4858-5cf0-368a23c81ccc@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, ckeepax@opensource.cirrus.com, ckeepax@opensource.wolfsonmicro.com, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

* Florian Fainelli <f.fainelli@gmail.com> [171129 18:17]:
> On 11/29/2017 09:45 AM, Tony Lindgren wrote:
> > * Florian Fainelli <f.fainelli@gmail.com> [171129 17:37]:
> >> On 11/29/2017 09:01 AM, Tony Lindgren wrote:
> >>> * Florian Fainelli <f.fainelli@gmail.com> [171102 23:18]:
> >>>> It may happen that a device needs to force applying a state, e.g:
> >>>> because it only defines one state of pin states (default) but loses
> >>>> power/register contents when entering low power modes. Add a
> >>>> pinctrl_dev::flags bitmask to help describe future quirks and define
> >>>> PINCTRL_FLG_FORCE_STATE as such a settable flag.
> >>>
> >>> It makes sense to tag the existing state with the context loss
> >>> information as otherwise we'll be duplicating the state in the
> >>> pinctrl driver potentially for hundreds of pins.
> >>>
> >>> Maybe this patch description should clarify that it's the
> >>> pinctrl device restoring the pin state, not the pinctrl
> >>> consumer devices?
> >>>
> >>> So maybe just "a pinctrl device needs to force apply a state"
> >>> instead of just device above?
> >>
> >> It's a bit more involved than that, the pinctrl consumer device might
> >> want to restore a particular state by calling pinctrl_select_state(),
> >> however, because of the (p->state == state)check, the pinctrl provider
> >> driver has no chance of making that call do the actual HW programming.
> > 
> > Hmm but isn't it the pinctrl provider device losing context here?
> 
> It is the pinctrl provider indeed.
> 
> > I think the restore of the pin state should somehow happen automatically
> > by the pinctrl provider driver without a need for the pinctrl consumer
> > drivers to do anything.
> 
> Correct.

OK thanks for confirming that.

> > Or what's the use case for pinctrl consumer driver wanting to store
> > a pin?
> 
> I actually meant that a consumer driver could aalso call
> pinctrl_select_state() in one of its resume callback for instance, but
> if the pinctrl provider driver does nothing (or rather the core, on
> behalf of the provider), this would be an issue. This was not super
> clear, so I will stop using that example from now on :)

OK yeah that's probably where the confusion comes from :)

Tony
