From: Tien Hock Loh <thloh.linux@gmail.com>
Subject: Re: [PATCH V4 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Thu, 28 Nov 2013 10:51:14 +0800
Message-ID: <CAOLUe6Zzp4UHOS7oAVFTN5zZR=8rXjiU8ew9J5x3FXNZ6qxmaA@mail.gmail.com>
References: <1385524192-21501-1-git-send-email-thloh@altera.com>
	<20131127144055.GB27879@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131127144055.GB27879@e106331-lin.cambridge.arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "thloh@altera.com" <thloh@altera.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lftan@altera.com" <lftan@altera.com>, dinguyen@altera.com
List-Id: devicetree@vger.kernel.org

Hi Mark

On Wed, Nov 27, 2013 at 10:40 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> Hi,
>
> On Wed, Nov 27, 2013 at 03:49:52AM +0000, thloh@altera.com wrote:
>> From: Tien Hock Loh <thloh@altera.com>
>>
>> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
>> Tested on Altera CV SoC board using dipsw and LED using LED framework.
>>
>> Signed-off-by: Tien Hock Loh <thloh@altera.com>
>> ---
>>  .../devicetree/bindings/gpio/gpio-altera.txt       |  35 ++
>>  drivers/gpio/Kconfig                               |   7 +
>>  drivers/gpio/Makefile                              |   1 +
>>  drivers/gpio/gpio-altera.c                         | 395 +++++++++++++++++++++
>>  4 files changed, 438 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt
>>  create mode 100644 drivers/gpio/gpio-altera.c
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera.txt b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
>> new file mode 100644
>> index 0000000..6c57d84
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
>> @@ -0,0 +1,35 @@
>> +Altera GPIO controller bindings
>> +
>> +Required properties:
>> +- compatible:
>> +  - "altr,pio-1.0"
>> +- reg: Physical base address and length of the controller's registers.
>> +- #gpio-cells : Should be 1
>> +  - first cell is the gpio offset number
>> +- gpio-controller : Marks the device node as a GPIO controller.
>> +- #interrupt-cells : Should be 1.
>> +- interrupts: Specify the interrupt.
>> +- interrupt-controller: Mark the device node as an interrupt controller
>> +  The first cell is the local interrupt offset number to the GPIO controller.
>
> Huh? This line doesn't make much sense immediately after the description
> of interrupt-controller. Presumably this is associated iwth
> #interrupt-cells?

Yes, it must have got displaced when I was editing the text. I'll get
this fixed.

>
>> +
>> +Altera GPIO specific properties:
>> +- altr,gpio-bank-width: Width of the GPIO bank. This defines how many pins the
>> +  GPIO device has. Ranges between 1-32.
>
> The code appears to handle this as an optional property, such that this
> proeprty is only required if the GPIO controller does not have 32 GPIOs.
> It would be worth notign that this is optional, and describing when this
> is expected in the binding.
>

Noted. Will add a note on required and optional parameters.

>> +- altr,interrupt_trigger: Specifies the interrupt trigger type the GPIO
>> +  hardware is synthesized. This field is required if the Altera GPIO controller
>> +  used has IRQ enabled as the interrupt type is not software controlled,
>> +  but hardware synthesized.
>
> s/_/-/
>
> What type is this, and what values are expected?
>
> The description implies that this is an optional property, but the code
> seems to require it.

This isn't always required, but only required when the controller is
used as an interrupt controller. I'll specify that this is a required
field if GPIO is used as an interrupt controller. I'll add in the
expected values as well.

>
>> +
>> +Example:
>> +
>> +gpio_altr: gpio_altr {
>> +    compatible = "altr,pio-1.0";
>> +    reg = <0xff200000 0x10>;
>> +    interrupts = <0 45 4>;
>> +    altr,gpio-bank-width = <32>;
>> +    altr,interrupt_trigger = <0>;
>
> The description doesn't tell me what this porperty in the example
> means...

Noted, I'll put the supported interrupt trigger to the description
above. This is the value of interrupt trigger as defined in
<dt-bindings/interrupt-controller/irq.h>.

>
>> +    #gpio-cells = <1>;
>> +    gpio-controller;
>> +    #interrupt-cells = <1>;
>> +    interrupt-controller;
>> +};
>
> [...]
>
>> +int altera_gpio_probe(struct platform_device *pdev)
>> +{
>> +       struct device_node *node = pdev->dev.of_node;
>> +       int id, reg, ret;
>> +       struct altera_gpio_chip *altera_gc = devm_kzalloc(&pdev->dev,
>> +                               sizeof(*altera_gc), GFP_KERNEL);
>> +       if (altera_gc == NULL) {
>> +               pr_err("%s: out of memory\n", node->full_name);
>> +               return -ENOMEM;
>> +       }
>> +       altera_gc->irq = 0;
>> +
>> +       spin_lock_init(&altera_gc->gpio_lock);
>> +
>> +       id = pdev->id;
>> +
>> +       if (of_property_read_u32(node, "altr,gpio-bank-width", &reg))
>> +               /*By default assume full GPIO controller*/
>> +               altera_gc->mmchip.gc.ngpio = 32;
>> +       else
>> +               altera_gc->mmchip.gc.ngpio = reg;
>
> As mentioned above, the binding doesn't describe this as optional, yet
> it's treated as such.

I'll get this fixed in the documentation.

>
>> +
>> +       if (altera_gc->mmchip.gc.ngpio > 32) {
>> +               pr_warn("%s: ngpio is greater than 32, defaulting to 32\n",
>> +                       node->full_name);
>> +               altera_gc->mmchip.gc.ngpio = 32;
>> +       }
>> +
>> +       altera_gc->mmchip.gc.direction_input    = altera_gpio_direction_input;
>> +       altera_gc->mmchip.gc.direction_output   = altera_gpio_direction_output;
>> +       altera_gc->mmchip.gc.get                = altera_gpio_get;
>> +       altera_gc->mmchip.gc.set                = altera_gpio_set;
>> +       altera_gc->mmchip.gc.to_irq             = altera_gpio_to_irq;
>> +       altera_gc->mmchip.gc.owner              = THIS_MODULE;
>> +
>> +       ret = of_mm_gpiochip_add(node, &altera_gc->mmchip);
>> +       if (ret) {
>> +               pr_err("%s: Failed adding memory mapped gpiochip\n",
>> +                       node->full_name);
>> +               return ret;
>> +       }
>> +
>> +       platform_set_drvdata(pdev, altera_gc);
>> +
>> +       altera_gc->mapped_irq = irq_of_parse_and_map(node, 0);
>> +
>> +       if (!altera_gc->mapped_irq)
>> +               goto skip_irq;
>
> It seems odd to jump directly to a return 0. Why not just return 0 here
> (or initialise ret to 0 and combine the two return cases)?

Noted. I'll return 0 here.

>
> Thanks,
> Mark.

Thanks for the comments. I'll post a patch v5.
