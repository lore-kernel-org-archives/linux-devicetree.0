From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH 1/2] gpio: mediatek: add driver for MT7621
Date: Sat, 9 Jun 2018 08:17:14 +0200
Message-ID: <CAMhs-H83Q44=arvKJSOyOAsq=7DV3j6rptJannSVCMVREQnW-Q@mail.gmail.com>
References: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
 <1527924610-13135-2-git-send-email-sergio.paracuellos@gmail.com>
 <CACRpkdaw9O6TbZie5AOTmQJ9-3=yHETFFX7YVkPBEL72EZzZ=g@mail.gmail.com>
 <CACRpkdbeXkTUir=Ar+x5jsSow_NiNwu1w_4Fewv8N7jcgbMinQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CACRpkdbeXkTUir=Ar+x5jsSow_NiNwu1w_4Fewv8N7jcgbMinQ@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, driverdev-devel@linuxdriverproject.org, Greg KH <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 8, 2018 at 2:17 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> A second thought:

Second thought is always a good thing :-)

>
> On Fri, Jun 8, 2018 at 1:59 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>>> +       select GPIOLIB_IRQCHIP
>>
>> You are not using this so I guess remove that line.
> (...)
>>> +static int
>>> +mediatek_gpio_to_irq(struct gpio_chip *chip, unsigned int pin)
>>> +{
>>> +       struct mtk_data *gpio_data = gpiochip_get_data(chip);
>>> +       struct mtk_gc *rg = to_mediatek_gpio(chip);
>>> +
>>> +       return irq_create_mapping(gpio_data->gpio_irq_domain,
>>> +                                 pin + (rg->bank * MTK_BANK_WIDTH));
>>> +}
>>
>> So this is the result of a custom IRQdomain because you
>> can't use the generic GPIO IRQ lib.  Oh well, we have to live
>> with it I guess.
>
> I think maybe you can actually use the generic GPIO IRQCHIP.
>
> It is OK to call gpiochip_set_chained_irqchip() several times.
> If you just mark the line with IRQF_SHARED then the handler
> will just loop over all three banks until you find a hit, provided
> you code it up properly.

Ok, I'll give it a try to use this also.

>
> There were some problems with removing an irqchip like
> that but your driver is anyway a bool so I think it might work
> just fine.
>
> Yours,
> Linus Walleij

Thanks again.

Best regards,
    Sergio Paracuellos
