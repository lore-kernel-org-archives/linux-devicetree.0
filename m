From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [rtc-linux] [PATCH V3 2/3] pincntrl: add support for AMS AS3722
 pin control driver
Date: Tue, 24 Sep 2013 22:46:47 +0530
Message-ID: <5241C8FF.4080708@nvidia.com>
References: <1380023921-29867-1-git-send-email-ldewangan@nvidia.com> <1380023921-29867-3-git-send-email-ldewangan@nvidia.com> <CACRpkda3m4ipTsS8FZoU1QDwrvwmKFn4awyfXOy2VOiuV63y6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda3m4ipTsS8FZoU1QDwrvwmKFn4awyfXOy2VOiuV63y6A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Landley <rob@landley.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, Florian Lobmaier <florian.lobmaier@ams.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 24 September 2013 06:22 PM, Linus Walleij wrote:
> On Tue, Sep 24, 2013 at 1:58 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> +static int as_pci_to_irq(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       struct as3722_pctrl_info *as_pci = to_as_pci(chip);
>> +
>> +       return as3722_irq_get_virq(as_pci->as3722, offset);
>> +}
>> +
>> +static int as_pci_request(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       struct as3722_pctrl_info *as_pci = to_as_pci(chip);
>> +
>> +       if (as_pci->gpio_control[offset].io_function)
>> +               return -EBUSY;
>> +       return 0;
>> +}
> Why is this not calling pinctrl_request_gpio(as_pci->chip.base + offset)
> instead of just checking if we happen to be GPIO and failing if
> we are not?
>
> I would implement .free calling pinctrl_free_gpio(gpio) as well.
>
> See e.g. pinctrl-abx500.c
>
>

Wow, cool, I saw and it is simple,  the gpios callback is wrapper over 
the pincontrol mux APIs.

I also see opportunity to re-factor the 
request/free/direction_input/direction_output to move to core so that 
need not to implement locally, the gpio_chip's callback can use directly.

Will post once this driver is accepted.
