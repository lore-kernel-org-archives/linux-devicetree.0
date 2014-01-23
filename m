From: Tien Hock Loh <thloh.linux@gmail.com>
Subject: Re: [PATCH V6 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Thu, 23 Jan 2014 09:47:11 +0800
Message-ID: <CAOLUe6Ya=bTYrURhieWQkZewYf2Z8kFN82nkxwfM5DJDHb5wzw@mail.gmail.com>
References: <1390359265-22808-1-git-send-email-thloh@altera.com>
	<20140122180904.GN20094@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140122180904.GN20094@book.gsilab.sittig.org>
Sender: linux-doc-owner@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Tien Hock Loh <thloh@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dinguyen@altera.com, "lftan@altera.com" <lftan@altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 23, 2014 at 2:09 AM, Gerhard Sittig <gsi@denx.de> wrote:
> On Wed, Jan 22, 2014 at 10:54 +0800, thloh@altera.com wrote:
>>
>> From: Tien Hock Loh <thloh@altera.com>
>>
>> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
>> Tested on Altera CV SoC board using dipsw and LED using LED framework.
>>
>> Signed-off-by: Tien Hock Loh <thloh@altera.com>
>> ---
>>  .../devicetree/bindings/gpio/gpio-altera.txt       |  42 +++
>>  drivers/gpio/Kconfig                               |   7 +
>>  drivers/gpio/Makefile                              |   1 +
>>  drivers/gpio/gpio-altera.c                         | 420 +++++++++++++++++++++
>>  4 files changed, 470 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt
>>  create mode 100644 drivers/gpio/gpio-altera.c
>
> Since you not only introduce the driver, but do introduce the
> binding as well, I'd suggest to reflect this in the commit
> message.  And put 'binding' into the subject line such that DT
> people can be aware they should have a look.

OK noted. Putting v7 up by in a few days so people get to review v6.

>
>
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
>> @@ -0,0 +1,42 @@
>> +Altera GPIO controller bindings
>> +
>> +Required properties:
>> +- compatible:
>> +  - "altr,pio-1.0"
>> +- reg: Physical base address and length of the controller's registers.
>> +- #gpio-cells : Should be 1
>> +  - The first cell is the gpio offset number
>> +- gpio-controller : Marks the device node as a GPIO controller.
>
> Learning about required data types when reading the binding would
> be nice.  So that DTS authors can tell whether a property is
> boolean, takes integers or strings, etc

Hmm, I don't quite understand your statement. I'm referring to other
gpio device tree binding documentation when creating this. Do you mind
to elaborate what you're expecting?

>
>> +- #interrupt-cells : Should be 1.
>> +  - The first cell is the GPIO offset number within the GPIO controller.
>> +- interrupts: Specify the interrupt.
>> +- interrupt-controller: Mark the device node as an interrupt controller
>
> Are these really 'required'?  I'd expect those to be optional.

Yeah, I'll move this to optional section.

>
>> +
>> +Altera GPIO specific properties:
>> +- altr,gpio-bank-width: Width of the GPIO bank. This defines how many pins the
>> +  GPIO device has. Ranges between 1-32. Optional and defaults to 32 is not
>> +  specified.
>
> In addition to being specific to the Altera GPIO implementation,
> aren't these optional, too?

Ditto. Moving this to optional section.

>
>> +- altr,interrupt_trigger: Specifies the interrupt trigger type the GPIO
>> +  hardware is synthesized. This field is required if the Altera GPIO controller
>> +  used has IRQ enabled as the interrupt type is not software controlled,
>> +  but hardware synthesized. Required if GPIO is used as an interrupt
>> +  controller. The value is defined in <dt-bindings/interrupt-controller/irq.h>
>> +  Only the following flags are supported:
>> +    IRQ_TYPE_EDGE_RISING
>> +    IRQ_TYPE_EDGE_FALLING
>> +    IRQ_TYPE_EDGE_BOTH
>> +    IRQ_TYPE_LEVEL_HIGH
>
> This text suggests that using the GPIO bank as an interrupt
> controller indeed is optional.  As one would expect.
>

Ditto.

>> +
>> +Example:
>> +
>> +gpio_altr: gpio_altr {
>
> Should node names not be generic, i.e. "gpio"?  While aliases do
> have specific names since they identify a specific node, to later
> reference it from other sites.

Okay, I'll update the node name.

>
>> +    compatible = "altr,pio-1.0";
>> +    reg = <0xff200000 0x10>;
>> +    interrupts = <0 45 4>;
>> +    altr,gpio-bank-width = <32>;
>> +    altr,interrupt_trigger = <IRQ_TYPE_EDGE_RISING>;
>> +    #gpio-cells = <1>;
>> +    gpio-controller;
>> +    #interrupt-cells = <1>;
>> +    interrupt-controller;
>> +};
>
>
> virtually yours
> Gerhard Sittig
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
