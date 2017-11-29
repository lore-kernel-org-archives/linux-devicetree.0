From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Allow a device to indicate when to force
 a state
Date: Wed, 29 Nov 2017 09:01:02 -0800
Message-ID: <20171129170102.GH28152@atomide.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com>
 <20171102231551.16220-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171102231551.16220-2-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, ckeepax@opensource.cirrus.com, ckeepax@opensource.wolfsonmicro.com, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

* Florian Fainelli <f.fainelli@gmail.com> [171102 23:18]:
> It may happen that a device needs to force applying a state, e.g:
> because it only defines one state of pin states (default) but loses
> power/register contents when entering low power modes. Add a
> pinctrl_dev::flags bitmask to help describe future quirks and define
> PINCTRL_FLG_FORCE_STATE as such a settable flag.

It makes sense to tag the existing state with the context loss
information as otherwise we'll be duplicating the state in the
pinctrl driver potentially for hundreds of pins.

Maybe this patch description should clarify that it's the
pinctrl device restoring the pin state, not the pinctrl
consumer devices?

So maybe just "a pinctrl device needs to force apply a state"
instead of just device above?

Regards,

Tony
