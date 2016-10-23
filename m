From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Sun, 23 Oct 2016 12:47:02 +0200
Message-ID: <CACRpkdbwqFRtFN1gx1G7BuFe44mvPyCSeoQ5g9_FR11j_ZO4ug@mail.gmail.com>
References: <1477040998-2016-1-git-send-email-narmstrong@baylibre.com> <CAHQ1cqESoRdeHyvP=m=8F_VwiaYL+wbjFoNa6KvWBGfijhcRjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAHQ1cqESoRdeHyvP=m=8F_VwiaYL+wbjFoNa6KvWBGfijhcRjg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Peter Rosin <peda@axentia.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 23, 2016 at 4:50 AM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
> On Fri, Oct 21, 2016 at 2:09 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> Since the I2C sx150x GPIO expander driver uses platform_data to manage
>> the pins configurations, rewrite the driver as a pinctrl driver using
>> pinconf to get/set pin configurations from DT or debugfs.
>>
>> The pinctrl driver is functionnally equivalent as the gpio-only driver
>> and can use DT for pinconf. The platform_data confirmation is dropped.
>>
>> This patchset removed the gpio-only driver and selects the Pinctrl driver
>> config instead. This patchset also migrates the gpio dt-bindings to pinctrl
>> and add the pinctrl optional properties.
>>
>> The driver was tested with a SX1509 device on a BeagleBone black with
>> interrupt support and on an X86_64 machine over an I2C to USB converter.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
(...)

>> +               ret = gpiochip_irqchip_add(&pctl->gpio,
>> +                                          &pctl->irq_chip, 0,
>> +                                          handle_edge_irq, IRQ_TYPE_EDGE_BOTH);
>
> Adding irqchip with IRQ_TYPE_EDGE_BOTH triggers a WARN in
> drivers/gpio/gpiolib.c:1671, on a custom Vybrid board that I have with
> the chip, so maybe it should be replaced with IRQ_TYPE_NONE? That's
> what I did for my testing and with that change

I fixed this up when applying. It is corect, it should always be IRQ_TYPE_NONE
unless it is a very old driver using boardfiles. The proper type is set up
when the driver using it requests the IRQ.

Some drivers also need to set the default handler to handle_bad_irq
and then also set that up in the irqchip .set_type() callback, especially
those hardwares that have an ACK register for edge IRQs so that a second
edge irq can come in when handling a first edge IRQ. Level IRQs don't
have this problem for obvious reasons, so we need to select between
handle_edge_irq() or handle_level_irq() on these hardwares.

Could you or Neil or both check if this applies to sx150x?

> Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Thanks a lot Andrey!

Yours,
Linus Walleij
