From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/8] extcon: gpio: Add DT bindings
Date: Tue, 26 Sep 2017 02:39:37 +0200
Message-ID: <CACRpkdbGA1L7YZNuad7uysf4VAT2bi+PrZyFAKpVy9WUdaj+NA@mail.gmail.com>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
 <20170924145622.4031-2-linus.walleij@linaro.org> <CAL_JsqKth+EHVZEVpT1U7qVvN77i7oZjBJH5bbowXcjJxETuoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKth+EHVZEVpT1U7qVvN77i7oZjBJH5bbowXcjJxETuoA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Lockwood <lockwood-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 24, 2017 at 9:56 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Sep 24, 2017 at 9:56 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Add some reasonable device tree bindings and also add the cable defines
>> to the extcon include in <dt-bindings/extcon/connectors.h> since
>> the GPIO extcon definately need to specify which cable/connector it is
>> detecting.
>>
>> Adding the include file makes the (as it happens) Linux numbers into an
>> ABI, but I do not see any better method. It is possible to define strings
>> for all cable types but it seems like overkill, just reusing Linux'
>> enumerators seems like a good idea.
>>
>> The binding supports any number of GPIOs and connectors, but the driver
>> currently only supports one connector on one GPIO line.
>
> My view of extcon binding is it is fundamentally broken. I've
> expressed this multiple times before.

Sorry, I'm a newcomer in this area, so I was not aware of this.

Since this is a new binding consumer, is it something we can use
as role model to fix it?

If I understand correctly from reading up on the mailing list the root of the
problem is something like this:

"extcon" is a linuxism and ambiguous.

This driver should probe to "gpio-connector" or "gpio-switch" or something
like that if it should be generic. Or use very domain-specific compatible
strings (as you describe below), all supported maybe by the same driver
in the end.

The reason it is its own subsystem and not part of input (IIUC) is that
other drivers need to subscribe to events from these connectors,
they are not intended for userspace input such as keyboard or mice
or similar.

In the DTS file you will find stuff using extcons as resources with
 = <&extcon>; phandles so they can look them up and subscribe
to events.

Input has a whole slew of "events" that correspond to some of these
but a different usecase, but that usecase is just a linuxism in turn, there
is nothing saying another operating system could have a more versatile
defintion of "input".

Maybe from a hardware description PoV these should all move over
to devicetree/bindings/input - they all provice an input signal to the
system. The fact that Linux split a subset of these into "extcon"
is of no concern to the DT bindings.

Analogous with that some of the stuff in input/ should likely be
moved to a new output/ directory. Such as pwm-beeper,
pwm-vibrator etc. The fact that these are in the "input" subsystem
in Linux is just another linuxism.

> TL;DR: Anything extending the existing extcon binding will be NAKed.

That can be a reasonable stance.

I'm just trying to get this into a state where the code does not stand in
the way of kernel clean-up. (Especially I want to get rid of the call
to gpio_to_desc())

As stated in the cover letter the alternative will be to simply delete
the driver. But it's better if I can fix the situation, we can't have it
like this.

>> +External Connector Using GPIO
>
> What kind of connector? All connectors external to something... And
> GPIO is not a kind of connector on its own, but an implementation.

Yeah that is a problem with the whole subsystem I guess. Should
I add a paragraph describing the usecases?

The whole thing is a bit
of Androidism and is named like this because Android named it like
this in their kernel tree.

>> +Required properties:
>> +- compatible: should be "extcon-gpio"
>> +- extcon-gpios: the GPIO lines used for the external connectors
>
> This doesn't tell me what the GPIOs functions are and should. For
> example we have hpd-gpios for HDMI hotplug detect in HDMI connector
> binding.

The idea is that this array corresponds to the extcon-connector-types
right below, I'll clarify that if you think the overall idea is OK.

>> +  See gpio/gpio.txt
>> +- extcon-connector-types: set to an unsigned integer value arrat representing the types
>> +  of this connector, matched to the corresponding GPIO lines in the previous array.
>
> This should be determined by the compatible string.

So a GPIO connector is very versatile. It is "general purpose" by definition,
so it needs to be subclassed.

One possibility is to allow just one GPIO and have one comptible-string per
use case.
compatible = "gpio-usb-connector";
compatible = "gpio-charger-connector";
compatible = "gpio-headphone-connector";
etc etc

These bindings on the other hand, assume that the driver will be able
to handle an array of gpios with an associated array of connector types,
which reflects how many of the existing extcon-type driver hardware works:
a single PMIC providing some 5 misc extcons for example.

For this reason there is a generic compatible string and then the device
is subclassed per-gpio with the per-gpio connector type.

>> +/* USB external connector */
>> +#define EXTCON_USB             1
>> +#define EXTCON_USB_HOST                2
>> +#define EXTCON_CHG_USB_SDP     5       /* Standard Downstream Port */
>> +#define EXTCON_CHG_USB_DCP     6       /* Dedicated Charging Port */
>> +#define EXTCON_CHG_USB_CDP     7       /* Charging Downstream Port */
>> +#define EXTCON_CHG_USB_ACA     8       /* Accessory Charger Adapter */
>> +#define EXTCON_CHG_USB_FAST    9
>> +#define EXTCON_CHG_USB_SLOW    10
>> +#define EXTCON_CHG_WPT         11      /* Wireless Power Transfer */
>> +#define EXTCON_CHG_USB_PD      12      /* USB Power Delivery */
>
> These don't all look to be mutually exclusive.
>
> For USB PD, isn't that discoverable?

Someone else would have to answer, this is based on the current
connector types supported by the Linux kernel.

>> +/* Display external connector */
>> +#define EXTCON_DISP_HDMI       40      /* High-Definition Multimedia Interface */
>> +#define EXTCON_DISP_MHL                41      /* Mobile High-Definition Link */
>> +#define EXTCON_DISP_DVI                42      /* Digital Visual Interface */
>> +#define EXTCON_DISP_VGA                43      /* Video Graphics Array */
>> +#define EXTCON_DISP_DP         44      /* Display Port */
>> +#define EXTCON_DISP_HMD                45      /* Head-Mounted Display */
>
> We already have connector bindings for most of these. Use those as a
> model for whatever you want to do.

I guess they are not in Documentation/devicetree/bindings/extcon/*

Please point me in the right direction and I'll check it out.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
