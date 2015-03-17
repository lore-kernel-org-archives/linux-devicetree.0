From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Tue, 17 Mar 2015 09:56:41 -0700
Message-ID: <CAL1qeaHCKPeQnf8VPWmz_=uN1=_mxWbMGF+HuPZ_AYOqA+15JA@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
	<1424744104-14151-3-git-send-email-abrestic@chromium.org>
	<CACRpkdbqioAreyDwM2JN87=gH20n1OkUXPjdkW885iDWUV1NnA@mail.gmail.com>
	<CAL1qeaHzpi3_PNpxnLOf=b8d2n5DrRrnB_yiZFHpiP8C7b0hSg@mail.gmail.com>
	<CACRpkdbt4MQYY7MqjFN-1Dp0am1PaOZ1YL+bKc8SJrtFDnSW_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbt4MQYY7MqjFN-1Dp0am1PaOZ1YL+bKc8SJrtFDnSW_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 5:16 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Mar 6, 2015 at 7:51 PM, Andrew Bresticker <abrestic@chromium.org> wrote:
>> On Fri, Mar 6, 2015 at 3:55 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>>>> +static inline void gpio_writel(struct pistachio_gpio_bank *bank, u32 val,
>>>> +                              u32 reg)
>>>> +{
>>>> +       writel(val, bank->base + reg);
>>>> +}
>>>
>>> I don't see the point of these special readl/writel accessors. Just
>>> use readl/writel
>>> directly. Or consider readl/writel_relaxed() if MIPS has this.
>>
>> I actually find these useful for tracing MMIO accesses within a driver
>> and it seems many other drivers do this too.  I can drop them though
>> if you'd prefer.
>
> OK does it turn up in ftrace etc? I was thinking these would be
> inlined by the compiler (especially since you even state they shall
> be inlined) and the symbols trashed?

Right, the functions as-is won't show up as trace events, but they can
be easily modified to do so.

>>> (...)
>>>> +static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>>>> +{
>>>> +       struct device_node *child, *node = pctl->dev->of_node;
>>>> +       struct pistachio_gpio_bank *bank;
>>>> +       unsigned int i = 0;
>>>> +       int irq, ret = 0;
>>>> +
>>>> +       for_each_child_of_node(node, child) {
>>>> +               if (!of_find_property(child, "gpio-controller", NULL))
>>>> +                       continue;
>>>
>>> So why not instead specify "simple-bus" as compatible on the parent node
>>> and have each subnode be its own device (simple-bus will spawn platform
>>> devices for all subnodes).
>>>
>>> Overall this composite-device pattern is discouraged if we can instead have
>>> unique devices for each bank.
>>
>> I think there's an issue here though if some other device probes
>> between the pinctrl driver and the gpiochip drivers.  Since all these
>> pins are configured as GPIOs at POR, the pinctrl driver needs to clear
>> the GPIO enable bit on a pin when enabling a pinmux function for that
>> pin (see pistachio_pinmux_enable()).  If the gpiochip driver has yet
>> to probe, attempting to map the pinctrl pin to a GPIO range/pin (via
>> pinctrl_find_gpio_range_from_pin()) will fail and we won't be able to
>> disable the GPIO function for that pin.
>
> I was thinking the GPIO driver part should get a -EPROBE_DEFER when
> trying to call gpiochip_add_pin_range() and continue later when the
> pin controller is available?

Right.

> And all drivers using GPIOs in turn get a -EPROBE_DEFER when
> trying to get GPIOs on a not-yet registered GPIO chip.

Right.

> Sorry if I don't really know how things work now... :(
> It seems like a logical way to me.

OK, let me try to run through an example:

1) Initially all pins (except for those set up by the firmware) are
configured as GPIOs.
2) The pinctrl driver probes.
3) Another driver, e.g. an I2C controller attempts to probe and
pinmux_enable_setting() is called.
4) The ->set_mux() op must set the proper function for the pin.
5) The ->set_mux() op must also disable the GPIO function for the pin.
To disable the GPIO function, the pinctrl driver must map the pin to a
GPIO bank/offset and disable the GPIO via the GPIO bank's GPIO_EN
register.

Now to map the pin back to a GPIO bank/offset, I had been using
pinctrl_find_gpio_range_from_pin(), which works just fine if the GPIO
driver has already probed.  But in the example above, we haven't
probed the GPIO driver yet so we're unable to do the mapping.  This
particular issue, I think, could by returning -EPROBE_DEFER from
->set_mux() if we're enable to look up the GPIO bank.

>>  Also it doesn't look like
>> there's a good way to tell gpiolib to disable a GPIO form the pinctrl
>> driver.
>
> Define exactly what you mean by "disable". There is
> pinctrl_free_gpio().

Each GPIO bank has a GPIO_EN register which enables the GPIO function
for the corresponding pin, overriding the function selected in the
pinctrl registers.  What I think we need here is pinctrl_free_gpio()
in the reverse direction: a way for the pinctrl driver to tell the
GPIO driver to disable the GPIO function for a particular pin.  Now we
could hack around this by having the pinctrl driver do the mapping
from pin to GPIO bank/offset and modifying the GPIO bank registers
itself, but that seems a bit ugly.

Thanks,
Andrew
