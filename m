From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] leds: add device tree bindings for syscon LEDs
Date: Wed, 13 Aug 2014 11:31:34 +0200
Message-ID: <CACRpkdYrzsBrvW3dSGDS5yT3YLzpoL+sgAgUJaczR09NfohsdQ@mail.gmail.com>
References: <1406294628-16079-1-git-send-email-linus.walleij@linaro.org>
	<1406294628-16079-3-git-send-email-linus.walleij@linaro.org>
	<CAL_Jsq+-G68wjBLDbELHRDFcGYRa65-Hx9WoD6HypXNjJKVDvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+-G68wjBLDbELHRDFcGYRa65-Hx9WoD6HypXNjJKVDvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 25, 2014 at 4:07 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Jul 25, 2014 at 8:23 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> This adds the device tree bindings used by syscon-based LEDs.
(...)
>> +Device Tree Bindings for Syscon LEDs
>> +
>> +Required properties:
>> +- compatible : must be "syscon-leds".
>
> Not really happy with the name... More below.

[copy paste]

> I think the compatible should be something like
> "register-bit-led" (perhaps someone has a better name) as syscon is
> somewhat linux specific term and you could use this binding for any
> LEDs that have a single register bit control.

Hm... this driver:
drivers/gpio/gpio-syscon.c

Has some bindings specific to a certain controller here:
Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.txt

Maybe I should think of something generic for that one
along the same lines then, so we get some consensus on
this.

Documentation/devicetree/bindings/mfd/syscon.txt
Specifies the string "syscon" for such regmap ranges, maybe
it should rather use the compatible string "misc-register-range"
or something.

>> +LED sub-node properties:
>> +- offset : register offset to the register controlling this LED
>> +- mask : bit mask for the bit controlling this LED in the register
>> +  typically 0x01, 0x02, 0x04 ...
>
> This would be a single bit, right? What about inverted bits (i.e. 0 is
> on or 1 is on)?

I can of course add inversion bindings, but cannot add it to
the driver as I can't test it. Just an "active-low;" string would
do I guess.

>> +- label : (optional)
>
> Please group all required and optional properties under those headings.

OK.

>> +Example:
>> +
>> +leds: leds@08 {
>> +       compatible = "syscon-leds";
>> +       regmap = <&syscon>;
>> +
>> +       led@bit0 {
>
> Perhaps we can define a way to express unit address as offset+bit like
> <offset>_<bit> or <offset>.<bit>.

I'll come up with something. We don't really have a place to
document such schemas do we?

> I think we should get rid of the leds node and put this within the
> syscon device node and each node here should have a compatible
> property.

OK. But then I guess you also expect to get rid of the
phandle <&syscon> from the node, so that it implicitly uses
the syscon it's embedded in? Or is it OK to keep? Or should
it be optional, so the (syscon) driver will look upward when
locating the syscon for a node?

Like I need to add a new function
syscon_regmap_lookup_by_hierarchy() to syscon.c...
It already has like three ways to look up syscons, now
we add another one.

I know that is a Linux implementation detail but it reflects the
fact that similar code will be needed in all operating systems
using syscon-type things, if it's a case-by-case question
whether a phandle or hierarchy traversal is to be used for
getting hold of the interface.

Your,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
