From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v3 6/6] gpio: tps65086: Add GPIO driver for the TPS65086
 PMIC
Date: Wed, 18 Nov 2015 10:41:10 -0600
Message-ID: <564CAA26.4010904@ti.com>
References: <1446657135-7820-1-git-send-email-afd@ti.com>
 <1446657135-7820-7-git-send-email-afd@ti.com>
 <CACRpkdb1V7JxLSbwqf4CX+nDLeQzP=bOA9YMXzE4CFTQfzRL9w@mail.gmail.com>
 <564B51B3.2000102@ti.com>
 <CACRpkdYfKXDto0TAyW8L+noomPmfTqV+SekdtFXuAsf_Xe3Bkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYfKXDto0TAyW8L+noomPmfTqV+SekdtFXuAsf_Xe3Bkw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/18/2015 03:44 AM, Linus Walleij wrote:
> On Tue, Nov 17, 2015 at 5:11 PM, Andrew F. Davis <afd@ti.com> wrote:
>> On 11/17/2015 03:17 AM, Linus Walleij wrote:
>>>
>>> On Wed, Nov 4, 2015 at 6:12 PM, Andrew F. Davis <afd@ti.com> wrote:
>>>
>>>> Add support for the TPS65086 PMIC GPOs.
>>>>
>>>> TPS65086 has four configurable GPOs that can be used for several
>>>> purposes.
>>>>
>>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>>
>>>
>>> OK...
>>>
>>>> +static int tps65086_gpio_get(struct gpio_chip *gc, unsigned offset)
>>>> +static void tps65086_gpio_set(struct gpio_chip *gc, unsigned offset,
>>>
>>>
>>> Just get/set and no get_direction/direction_input/direction_output?
>>> Are you sure?
>>>
>>
>> Yeah, these are output only, I could probably add get_direction and just
>> always return output, but setters wouldn't make sense here.
>
> It's important that you note in the driver, commit blurb and maybe even
> Kconfig that these GPIOs are output-only. Someone could get confused.
>
> You should implement .direction_output() and return 0, and implement
> .direction_input and return negative error code. As it is now, it will
> seem like input is working, while it's not, right?
>
> Yours,
> Linus Walleij
>

Right, will add.

Also I would hold off on taking the GPIO bindings just yet. Mark Brown
has stated he would like the compatible string removed from the regulator
sub-node before he takes the regulator components, so for consistency sake
I am also removing the string from GPIO as well. With this, it is difficult
to have the sub-node still be a GPIO controller.

( gpiochip->of_node vs gpiochip->dev->of_node gpiolib.c:694 etc.. )

So the main pmic node will also be the GPIO controller node.

pmic: tps65912@2d {
	compatible = "ti,tps65912";
	reg = <0x2d>;

	interrupt-parent = <&gpio1>;
	interrupts = <28 8>;

	interrupt-controller;
	#interrupt-cells = <2>;

	gpio-controller;
	#gpio-cells = <2>;
};
