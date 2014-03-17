From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH v5 3/9] at91: pinctrl: don't request GPIOs used for interrupts
 but lock them as IRQ
Date: Mon, 17 Mar 2014 12:33:59 +0100
Message-ID: <5326DDA7.3010504@gmail.com>
References: <1393841162-25339-1-git-send-email-jjhiblot@traphandler.com>	<1393841162-25339-4-git-send-email-jjhiblot@traphandler.com>	<53205A46.6000304@gmail.com> <CACh+v5N+Ms9ZVFN=F_sQQhRbwhiYFg6LO+383UL8iw7qYaPKtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACh+v5N+Ms9ZVFN=F_sQQhRbwhiYFg6LO+383UL8iw7qYaPKtQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Le 17/03/2014 12:14, Jean-Jacques Hiblot a =E9crit :
> Hi Boris,
>
> Sorry for being late, I was on vacation.
> Yes this patch can be dropped from the serie.
That's fine, Nicolas dropped it ;-).


>
> 2014-03-12 13:59 GMT+01:00 Boris BREZILLON <b.brezillon.dev@gmail.com=
>:
>> Hi JJ,
>>
>> IIRC this patch was necessary for the DM9000 device, which is not de=
fined
>> in this series anymore.
>> And, correct me if I'm wrong, but there's still a discussion about h=
ow
>> this should be fixed properly (https://lkml.org/lkml/2014/2/25/388).
>>
>> As a result, shouldn't we remove this patch from this series ?
>>
>> Best Regards,
>>
>> Boris
>>
>> Le 03/03/2014 11:05, Jean-Jacques Hiblot a =E9crit :
>>
>>> During the xlate stage of the DT interrupt parsing, the at91 pinctr=
l
>>> driver
>>> requests the GPIOs that are described as interrupt sources. This pr=
events
>>> a
>>> driver to request the gpio later to get its electrical value.
>>> This patch replaces the gpio_request with a gpio_lock_as_irq to pre=
vent
>>> the
>>> gpio to be set as an ouput while allowing a subsequent gpio_request=
 to
>>> succeed
>>>
>>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
>>> ---
>>>    drivers/pinctrl/pinctrl-at91.c | 5 ++---
>>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/pinctrl/pinctrl-at91.c
>>> b/drivers/pinctrl/pinctrl-at91.c
>>> index d990e33..db55b96 100644
>>> --- a/drivers/pinctrl/pinctrl-at91.c
>>> +++ b/drivers/pinctrl/pinctrl-at91.c
>>> @@ -1478,18 +1478,17 @@ static int at91_gpio_irq_domain_xlate(struc=
t
>>> irq_domain *d,
>>>    {
>>>          struct at91_gpio_chip *at91_gpio =3D d->host_data;
>>>          int ret;
>>> -       int pin =3D at91_gpio->chip.base + intspec[0];
>>>          if (WARN_ON(intsize < 2))
>>>                  return -EINVAL;
>>>          *out_hwirq =3D intspec[0];
>>>          *out_type =3D intspec[1] & IRQ_TYPE_SENSE_MASK;
>>>    -     ret =3D gpio_request(pin, ctrlr->full_name);
>>> +       ret =3D gpio_lock_as_irq(&at91_gpio->chip, intspec[0]);
>>>          if (ret)
>>>                  return ret;
>>>    -     ret =3D gpio_direction_input(pin);
>>> +       ret =3D at91_gpio_direction_input(&at91_gpio->chip, intspec=
[0]);
>>>          if (ret)
>>>                  return ret;
>>>
>>
