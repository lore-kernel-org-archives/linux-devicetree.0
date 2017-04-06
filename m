From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/1] gpio: core: Decouple open drain/source flag with
 active low/high
Date: Thu, 6 Apr 2017 20:30:20 +0300
Message-ID: <CAHp75VcHh8HOvocHsTuHmNRAt5J5WdOUAuWDiup+Ubz=-WQ0bQ@mail.gmail.com>
References: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com>
 <CAHp75Ver7n=Xoer0YzA0sVVrcXKOB1bDz0ygSm0V0YoyYbe3pg@mail.gmail.com> <58E67328.5040805@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <58E67328.5040805@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 6, 2017 at 7:56 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> On Thursday 06 April 2017 09:40 PM, Andy Shevchenko wrote:
>> On Thu, Apr 6, 2017 at 4:35 PM, Laxman Dewangan <ldewangan@nvidia.com>
>> wrote:

>>> Adding different flag for the Open Drain/Open Source which is valid
>>> only when Single ended flag is enabled.
>>>          if (single_ended) {
>>> -               if (active_low)
>>> +               if (open_drain)
>>
>> This breaks ACPI case, right?

> In acpi case, single_ended is not handled. It only handles the active LOW.
>
> From code:

Fair enough.
I would look into ACPI spec for possibility to add this kind of functionality.

Thanks.

-- 
With Best Regards,
Andy Shevchenko
