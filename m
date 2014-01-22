From: Dinh Nguyen <dinh.linux@gmail.com>
Subject: Re: [PATCH V6 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Wed, 22 Jan 2014 15:23:03 -0600
Message-ID: <52E036B7.1050101@gmail.com>
References: <1390359265-22808-1-git-send-email-thloh@altera.com> <20140122180904.GN20094@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140122180904.GN20094@book.gsilab.sittig.org>
Sender: linux-doc-owner@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>, thloh@altera.com
Cc: linus.walleij@linaro.org, rob.herring@calxeda.com, rob@landley.net, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, thloh.linux@gmail.com, dinguyen@altera.com, lftan@altera.com
List-Id: devicetree@vger.kernel.org

Hi Tien Hock,

On 1/22/14 12:09 PM, Gerhard Sittig wrote:
> On Wed, Jan 22, 2014 at 10:54 +0800, thloh@altera.com wrote:
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
> Since you not only introduce the driver, but do introduce the
> binding as well, I'd suggest to reflect this in the commit
> message.  And put 'binding' into the subject line such that DT
> people can be aware they should have a look.

Yes, and you also do not have the correct DT email address too.
Please look at the updated MAINTAINERS file for the correct DT
BINDINGS address.

Dinh
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
> Learning about required data types when reading the binding would
> be nice.  So that DTS authors can tell whether a property is
> boolean, takes integers or strings, etc
>
>> +- #interrupt-cells : Should be 1.
>> +  - The first cell is the GPIO offset number within the GPIO controller.
>> +- interrupts: Specify the interrupt.
>> +- interrupt-controller: Mark the device node as an interrupt controller
> Are these really 'required'?  I'd expect those to be optional.
>
>> +
>> +Altera GPIO specific properties:
>> +- altr,gpio-bank-width: Width of the GPIO bank. This defines how many pins the
>> +  GPIO device has. Ranges between 1-32. Optional and defaults to 32 is not
>> +  specified.
> In addition to being specific to the Altera GPIO implementation,
> aren't these optional, too?
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
> This text suggests that using the GPIO bank as an interrupt
> controller indeed is optional.  As one would expect.
>
>> +
>> +Example:
>> +
>> +gpio_altr: gpio_altr {
> Should node names not be generic, i.e. "gpio"?  While aliases do
> have specific names since they identify a specific node, to later
> reference it from other sites.
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
> virtually yours
> Gerhard Sittig

