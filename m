From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/2] gpio: Support cascaded GPIO chip lookup for OF
Date: Wed, 8 Jun 2016 10:18:49 -0500
Message-ID: <CAL_Jsq+Z9NrvkZa0x4ZjC_POn96h1yQxXbrHsrMQ-MtvjWKWzQ@mail.gmail.com>
References: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464985616-11821-3-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqLi4=6v-8B8eF-H1iQGa+3Zh=rzAWbCAJubnLNEitPaLQ@mail.gmail.com> <8F93AE08-B340-481B-A5B3-F42227D9D729@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <8F93AE08-B340-481B-A5B3-F42227D9D729@konsulko.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 8, 2016 at 8:41 AM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> Hi Rob,
>
>> On Jun 8, 2016, at 00:00 , Rob Herring <robherring2@gmail.com> wrote=
:
>>
>> +Mark R
>>
>> On Fri, Jun 3, 2016 at 3:26 PM, Pantelis Antoniou
>> <pantelis.antoniou@konsulko.com> wrote:
>>> In certain cases it makes sense to create cascaded GPIO which
>>> are not real GPIOs, merely point to the real backend GPIO chip.
>>
>> In what cases? Make it clear what this is for. Connectors of course,
>> but are there any other use cases you have in mind.
>>
>
> Connectors is one obvious use-case. In fact even when there is no
> connector but there is an obvious interface abstraction point you
> might want to use it.
>
> For instance a SoC package may have a number of different GPIO
> controllers (that may or may not use the same IP block). You could
> abstract all the gpio controllers away in a single GPIO controller
> block.

There had better be some good reason besides just wanting to make a
single virtual controller.

>>> In order to support this, cascaded of_xlate lookup need to be
>>> performed.
>>>
>>> For example let's take a connector that we want to abstract
>>> having two GPIO pins from different GPIO controllers, connector
>>> pin #0 connected to gpioA controller with offset 10 and gpioB
>>> with 4.
>>
>> A connector's GPIO number may or may not be related to connector pin=
s.
>>
>
> Obviously, this is just an example.
>
>>> In pseudo DT form this is analogous to:
>>>
>>>        gpioA: gpioa@80000 {
>>>                compatible =3D "foocorp,gpio";
>>>                ...
>>>        };
>>>
>>>        gpioB: gpiob@80800 {
>>>                compatible =3D "foocorp,gpio";
>>>                ....
>>>        };
>>>
>>>        gpioC: controller_gpio {
>>>                compatible =3D "cascaded-gpio";
>>
>> This compatible is kind of meaningless. I'd expect this to be a
>> connector compatible.
>>
>
> No, because this gpio patch is completely independent of the
> existence of a connector.

My point is that "cascaded-gpio" is not something used to parse the
binding and will never be an accepted compatible string. I know it is
an example, but you should make that obvious like foocorp is.

>>>                gpios =3D <&gpioA 10>, <&gpioB 5>;
>>
>> As we discussed at ELC, I think this should be modeled after
>> interrupt-map property like this:
>>
>> gpio-map =3D <0 0 &soc_gpio 10 0>, <1 0 &soc_gpio 5 0>;
>> gpio-map-mask =3D <0xff 0>;
>>
>> This is more flexible, a known pattern, and allows remapping of flag=
 cells.
>>
>
> It=E2=80=99s just syntactic sugar. It can work either way.
>
>> Also, we will likely have interrupt capable GPIOs, so they are going
>> to need interrupt-map anyway.
>>
>
> Devices that use interrupts usually convert the GPIO to an interrupt =
and use it.
> Since the xlat op will return the real GPIO spec the interrupt conver=
sion will work.
>
> Bare interrupt lines are sort-of out of fashion nowadays I think. I=E2=
=80=99m eager to be
> proven wrong though with a recent portable expansion board that uses =
them.

Uh, no! Practically every gpio controller is also an interrupt
controller (in DT) and devices pretty much always see just an
interrupt line. Just go look at all the I2C devices with an interrupt
line. Unless devices have some special needs to control the gpio, we
always use interrupts. Expansion boards may be dealing with the GPIO
simply because that is the only option for userspace drivers.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
