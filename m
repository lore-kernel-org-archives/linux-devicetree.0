From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] ARM: sun8i: a33: Mali improvements
Date: Fri, 24 Feb 2017 07:56:18 -0600
Message-ID: <CAL_JsqKYSKnYzddh+utr9BUth60xVM7fGN_6yxk3tuGTNabUmg@mail.gmail.com>
References: <10fd28cb-269a-ec38-ecfb-b7c86be3e716@math.uni-bielefeld.de>
 <20170216184524.cxcy2ux37yrwutla@lukather> <2cecfc48-576f-3888-08aa-1fe2edc3c752@math.uni-bielefeld.de>
 <20170217154219.d4z2gylzcrzntlt3@piout.net> <1c13f7a8-b355-b985-c02f-a50bebfc86a7@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1c13f7a8-b355-b985-c02f-a50bebfc86a7-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Jakobi <tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 17, 2017 at 9:56 AM, Tobias Jakobi
<tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org> wrote:
> Alexandre Belloni wrote:
>> On 17/02/2017 at 13:45:44 +0100, Tobias Jakobi wrote:
>>>> The device tree is a representation of the hardware itself. The state
>>>> of the driver support doesn't change the hardware you're running on,
>>>> just like your BIOS/UEFI on x86 won't change the device it reports to
>>>> Linux based on whether it has a driver for it.
>>> Like Emil already said, the new bindings and the DT entries are solely
>>> introduced to support a proprietary out-of-tree module.
>>>
>>
>> Because device tree describes the hardware, the added binding doesn't
>> support any particular module. The eventually upstreamed drvier will
>> share the same bindings.
> OK, can we then agree that we _only_ merge the bindings and the entries,
> once this driver is upstream?

Absolutely not.

> Driver upstreaming and DT work go hand-in-hand. It's usually after a lot
> of discussion that new bindings get finalised. And for that discussion
> to happen we need to know how the driver uses the information from the
> DT. Otherwise we have no way to evaluate if the description is in any
> way "appropriate".
>
> And no, I don't follow the "DT is a separate/independent thing" thought.
> It maybe is in an ideal world, but we've seen it now often enough that
> bindings turned out to be poorly designed, even though they looked fine
> at first.

Certainly, that happens (though arguably that was more often from lack
of review). But this one is self contained, using standard, existing
properties. I'm not worried about us getting it right. If this was
something new or different, then certainly yes I would want to see the
code.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
