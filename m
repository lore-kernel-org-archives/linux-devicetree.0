From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Add support for interrupt debouncing
Date: Mon, 7 Nov 2016 10:40:04 +0100
Message-ID: <CACRpkdZ40e03VV_ScKceahG-7jmFmbBmgCqxBv9bGcvS3TnrOA@mail.gmail.com>
References: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard@free-electrons.com>
 <fa022cca9917917ace4af7d5e852c9348ec5b553.1476868462.git-series.maxime.ripard@free-electrons.com>
 <CACRpkdaoEH7OixJDkjuZ0qqYVURLvXwn8b41-OvqjZGJ=neh+Q@mail.gmail.com>
 <20161020135625.vro5cxkf3rxevwyn@lukather> <20161102195106.eazrl5oevykltvzd@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161102195106.eazrl5oevykltvzd@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 2, 2016 at 8:51 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Thu, Oct 20, 2016 at 03:56:25PM +0200, Maxime Ripard wrote:
>> On Thu, Oct 20, 2016 at 03:04:46PM +0200, Linus Walleij wrote:
>> > On Wed, Oct 19, 2016 at 11:15 AM, Maxime Ripard
>> > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> >
>> > > The pin controller found in the Allwinner SoCs has support for interrupts
>> > > debouncing.
>> > >
>> > > However, this is not done per-pin, preventing us from using the generic
>> > > pinconf binding for that,
>> >
>> > How typical.
>> >
>> > > but per irq bank, which, depending on the SoC,
>> > > ranges from one to five.
>> > >
>> > > Introduce a device-wide property to deal with this using a nanosecond
>> > > resolution.
>> > >
>> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > (...)
>> > > +Note: For backward compatibility reasons, the hosc and losc clocks are
>> > > +only required if you need to use the optional
>> > > +allwinner,debounce-time-ns property. Any new device tree should set them.
>> > > +
>> > > +Optional properties:
>> > > +  - allwinner,debounce-time-ns: Array of debouncing periods in
>> > > +    nanoseconds. One period per irq bank found in the controller
>> >
>> > Do you really *need* to specify this with nanosecond resolution?
>> >
>> > Else I would suggest to use microsecond resolution and just use
>> > the generic binding (input-debounce) but on the device node instead
>> > of the specific handler.
>>
>> Theorically, the debouncing clock can be set at 24MHz, which means a
>> 42ns resolution.
>>
>> I've seen that the other bindings usually use microseconds, but in our
>> case, we can really go lower than that.
>>
>> I don't really know if it makes sense though.
>
> Any comments on this?

My first thought: can you atleast support both?

My preference would be to add the standard binding and use that,
and the day you realize that "howli mackarowli, this thingofabob
actually needs to specify with nanosecond precision" then we
could add the nanosecond granularity binding?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
