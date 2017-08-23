From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] dt-bindings: gpio: max3191x: Document new driver
Date: Wed, 23 Aug 2017 08:03:15 -0500
Message-ID: <CAL_JsqJWuCPyiY-mr5kyHfm0QjYn_CzzD=UTZwPgrhcJin1dOA@mail.gmail.com>
References: <cover.1503319573.git.lukas@wunner.de> <7fe7636eecba238d57ab6178cfa3f6b7deca98f1.1503319573.git.lukas@wunner.de>
 <20170823004847.jmkb53xtdmmn6vtf@rob-hp-laptop> <20170823094438.GA12416@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170823094438.GA12416-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 23, 2017 at 4:44 AM, Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> wrote:
> Thanks Rob for the helpful review!
>
> On Tue, Aug 22, 2017 at 07:48:47PM -0500, Rob Herring wrote:
>> On Mon, Aug 21, 2017 at 03:12:00PM +0200, Lukas Wunner wrote:
>> > + - modesel-gpios:  GPIO pins to configure modesel of each chip.
>> > +                   The number of GPIOs must be equal to "maxim,nchips".
>> > + - fault-gpios:    GPIO pins to read undervoltage fault of each chip.
>> > + - db0-gpios:      GPIO pins to configure debounce of each chip.
>> > + - db1-gpios:      GPIO pins to configure debounce of each chip.
>>
>> Perhaps an array db-gpios with 2 entries.
>
> Each of the db0-gpios and db1-gpios is already an array with one pin for
> each chip in the daisy-chain.

Okay.

> So it would have to be a two-dimensional array, which AFAICS is not
> supported by the devicetree spec, or is it?

Not in the sense that the dimensions are encoded into the property,
but the binding doc can define that. You know one dimension is 2, so
you could figure out the other. But it's fine as is.

> However I realize that for clarity I should amend fault-gpios, db0-gpios
> and db1-gpios with the same text as modesel-gpios:
>                         The number of GPIOs must be equal to "maxim,nchips".

Really, this binding should be 1 node per chip instead, but I don't
know how you would describe that. You'd need a parent node with reg
for the chipselect, and then child nodes for each chip.

>> > + - maxim,no-vcc24v:Boolean, whether the chips are powered through
>> > +                   5VOUT instead of VCC24V.
>>
>> Use the regulator binding here?
>
> I'd have to look at the regulator's current voltage to determine through
> which pin the chips in the daisy-chain are powered (5VOUT or VCC24V).

No, the supply properties should correspond to the power pins/rails.
So it would be whichever property is present that tells you if 5V or
24V is hooked up.

> But if the regulator is generating 5V I couldn't discern if it's a
> faulting 24V supply or a non-faulting 5V supply.
>
> So a boolean does seem necessary, however I realize now that "no-vcc24v"
> is misleading, I've changed it to "maxim,ignore-undervoltage" for clarity:
>
> - maxim,ignore-undervoltage:
>                         Boolean, whether to ignore undervoltage alarms signaled
>                         by the "maxim,fault-gpios" and by the status byte
>                         (in 16-bit mode).  Use this if the chips are powered
>                         through 5VOUT instead of VCC24V, in which case they
>                         will constantly signal undervoltage.

But I'm not that concerned with a single property like this if you
feel strongly about it and want to avoid the complexity of the
regulator binding.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
