From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: of: make it possible to name GPIO lines
Date: Thu, 21 Apr 2016 00:21:39 +0200
Message-ID: <CACRpkdZ1QJ74qNOntLWrJovTsgNCUn=xFnPLGHmdOFs2PnA7ZQ@mail.gmail.com>
References: <1461073157-26574-1-git-send-email-linus.walleij@linaro.org>
	<CAAVeFuLt6PSLqUUROGKnpEdVjN55-L-HKzTcgCwfJD0NvuFYWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuLt6PSLqUUROGKnpEdVjN55-L-HKzTcgCwfJD0NvuFYWA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 20, 2016 at 3:10 AM, Alexandre Courbot <gnurou@gmail.com> wrote:

>> +               if (!ret)
>> +                       gdev->descs[i].name = name;
>
> Shouldn't we check for name collision (by calling gpio_name_to_desc()
> as gpiochip_set_desc_names() does) here?

That check is there to avoid getting the same name twice in
sysfs (which would fail), and this is not for sysfs, it is for the chardev.

And I don't think so: atleast we should not look globally like that thing
does. It need not be a unique name for the system, but I don't know
if we should even enforce it to be a unique name for the chip.

What do people think?

Yours,
Linus Walleij
