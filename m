From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dt-bindings: document the concept of GPIO banks
Date: Fri, 8 Apr 2016 11:26:55 +0200
Message-ID: <CACRpkdY+zqyzZv7iy-9B3jp+42D3s==YZu=70DHN6nkzwKhLmg@mail.gmail.com>
References: <1459415459-8107-1-git-send-email-linus.walleij@linaro.org>
	<CAL_JsqK+n-EwHx52=d9-dTJaVsSOzRS+PAmyCYwe6HK=kDoyGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK+n-EwHx52=d9-dTJaVsSOzRS+PAmyCYwe6HK=kDoyGQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 3:22 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Mar 31, 2016 at 4:10 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> We generally avoid indexing blocks in DT.

I am trying to come up with some standard way before I get
even more custom bindings slipping in. We have:

gpio-nmk.txt
   gpio-bank = <n>;

gpio_lpc32xx.txt
   #gpio-cells = <3>; /* bank, pin, flags */

microchip,pic32-gpio.txt
   microchip,gpio-bank = <n>;

The usecase Nicolas describe with aliases used for numbering
the controllers is the same as well.

So we presently have four ways of doing the same thing:

(1) In gpio-controller node:
     gpio-bank = <n>;
     microchip,gpio-bank = <n>;

(2) In the first GPIO specifier cell. (This is a bit special.)

(3) Using alias.

I could also invent something like:

hardware-block-iterator = <n>;
hwid = <n>;
etc

it would have the same effect. Something counting up
from zero.

They could also use (heaven forbid) the order in which
the banks are specified in the device tree. Or, as tz1090
does, the order of bank subnodes in a bigger gpio-controller
node.

>> +A GPIO controller may specify a bank ID. This is a hardware index that
>> +indicate the logical order of the GPIO controller in the hardware architecture,
>> +usually in the sequence 0, 1, 2 .. n.
(...)
> I still don't understand why do you need to know this?

One reason is to (maybe sneakily) get around encoding the
often-proposed linux-gpio-base = <n> property to map the
GPIOs of the bank to the global Linux GPIO numberspace.

By tradition that space begins at 0 and if e.g. each bank
has 32 GPIOs then the driver can calculate
the offset into the global space with:

linux-gpio-base = <gpio-bank> * 32;

So rather than encoding the pointless linux base number,
something less intrusive is encoded: the order of the
banks used when enumerating to a global scope.

Something like this was necessary for DT-ifying some old
systems as they relied on being able to control the
numberspace.

It has some physical counterpart: the pins in a datasheet
are often numbered 0..31, 32..63, 64.. etc corresponding
to the (bank number) * 32 + offset. Also for simple GPIOs
that are not pin control-enabled and not using pin control
as a back-end.

I think many operating systems may be using the same
concept of a fixed numberspace and then they also need
something like this: a hardware index ID starting from zero of
the GPIO bank. It's more neutral, as they can be doing
some other numberspace-slicing if they want.

> If you need
> some mapping of gpio nodes into pin controller, the pin controller
> should have a mapping using phandles.

It actually has the concept of gpio-range that maps a local
GPIO offset on a gpio-controller to a pin offset on a
pin controller, so we have a solution for that.

As Neil Armstrong suggests, it *could* be reused to
enumerate the banks but I'm not too happy about that.

Yours,
Linus Walleij
