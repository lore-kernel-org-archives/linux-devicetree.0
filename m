From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: of: make it possible to name GPIO lines
Date: Thu, 21 Apr 2016 08:25:34 +0900
Message-ID: <CAAVeFuLeiigGkDngKv+SNM9SAbZtdFvQOCygvZGWwVoMM_q2nQ@mail.gmail.com>
References: <1461073157-26574-1-git-send-email-linus.walleij@linaro.org>
 <CAAVeFuLt6PSLqUUROGKnpEdVjN55-L-HKzTcgCwfJD0NvuFYWA@mail.gmail.com> <CACRpkdZ1QJ74qNOntLWrJovTsgNCUn=xFnPLGHmdOFs2PnA7ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ1QJ74qNOntLWrJovTsgNCUn=xFnPLGHmdOFs2PnA7ZQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2016 at 7:21 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Apr 20, 2016 at 3:10 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>
>>> +               if (!ret)
>>> +                       gdev->descs[i].name = name;
>>
>> Shouldn't we check for name collision (by calling gpio_name_to_desc()
>> as gpiochip_set_desc_names() does) here?
>
> That check is there to avoid getting the same name twice in
> sysfs (which would fail), and this is not for sysfs, it is for the chardev.
>
> And I don't think so: atleast we should not look globally like that thing
> does. It need not be a unique name for the system, but I don't know
> if we should even enforce it to be a unique name for the chip.
>
> What do people think?

As long as we don't need to do things like requesting a GPIO by (chip,
name) tuple, then there should indeed be no issue with having several
lines have the same name.

On the other hand, we want lines to be named precisely, and two lines
with the same name would indicate a lack of precision (they cannot
have *exactly* the same function, can they). So I'm a bit torn as to
whether we should enforce this or not.
