From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Tue, 6 Feb 2018 00:13:49 +0100
Message-ID: <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
References: <20180201174923.7385-1-l.stach@pengutronix.de> <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
 <1517825351.3175.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517825351.3175.3.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, linux-imx-3arQi8VN3Tc@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 5, 2018 at 11:09 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

>> > +Optional Properties:
>> > +- drive-strength           Integer: controls Drive Strength
>>
>> I thought drive-strength is supposed to be be in mA. We should not have
>> differing units in common properties.
>>
>> There was an Atmel binding the other day that this came up.
>
> I know it's in the common binding, but it's going to be very hard to
> support. The drive-strength in mA really depends on external loading of
> the pin and the pin voltage, at least for the most widespread
> controllers that only switch between resistors, instead of driving the
> pin by a current regulator.

How does this circuit really look? Can you sketch something so
we understand what is going on electronically here?

The way I imagine most drive strength out there works is by simply
connection more MOS-totempoles after each other and each of them
has a production-technology-related max output current like 4mA, so
by putting two in a series yoy double that to 8 mA.

Is that what you mean with "current regulator"?

If you mean rather "output impedance", that is something else and
something we need a new (generic) property for. I never saw that
before, really.

> I would much prefer if we just remove unit from the common binding and
> let the drivers define it in a way that fits their hardware
> description.

Yeah but is this really the same thing even ...

> It's the same thing with the slew-rate really, but the common binding
> didn't make the mistake to define a single unit there, with many
> pincontrollers being really vague about how fast the slew really is,
> but some may actually define it in uS or whatever else makes sense.

I agree with that. Also for skewrate and output time delays
(skew delay).

It's very unclear how cell libraries really implement this.
But with drive strength I thought we knew it ...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
