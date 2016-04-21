From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: of: make it possible to name GPIO lines
Date: Thu, 21 Apr 2016 11:17:44 +0200
Message-ID: <CACRpkdZrFye5k8yRevofmbRBk=1pKtv8M1Ls5h5hqY_fMTnz_g@mail.gmail.com>
References: <1461190600-20955-1-git-send-email-linus.walleij@linaro.org>
	<CAL_JsqJb+T+r=jOpF+nNkMD_gzB6B7=08_+mNRc-ZRA2TZNpiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJb+T+r=jOpF+nNkMD_gzB6B7=08_+mNRc-ZRA2TZNpiA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, David Mandala <david.mandala@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2016 at 1:41 AM, Rob Herring <robh+dt@kernel.org> wrote:
> On Wed, Apr 20, 2016 at 5:16 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> Make it possible to name the producer side of a GPIO line using
>> a "gpio-names" property array, modeled on the "clock-names"
>> property from the clock bindings.
>
> Except clock-names is the consumer side. There is clock-output-names
> for the clock controller side though.

Ah yes you're 100% right.

However I cannot name it "gpio-output-names" since that becomes
ever confusing: GPIO is both input and output (I remember we
discussed this at some point).

"gpio-line-names" was my best suggestion at the time,
I will respin the patch with that convention (how could I forget
this!).

>> Why we are not using hogs: these are consumer side, not producer
>> side. The gpio-controller in DT (gpio_chip in Linux) is a
>> producer, not a consumer.
>
> Arguably, the names you have are the consumer side. The consumer side
> is what defines the function. The consumer name is typically local
> like vddio being the input supply pin, but the producer names are more
> global like ldo3.

Depends on what you mean with "producer" and "consumer".

To the GPIO subsystem atleast a "consumer" is a device
grabbing a GPIO, like SMSC911x WLAN chip or something.

The producer name here is something like the name of the
rail. (I would even consider using "gpio-rail-names" for this
property...)

If the GPIO controls an LDO regulator, then the rail will be
named something like "ldo3" indeed.

We need to distinguish the producer name from e.g. the
name of the pin on the package, as that is by nature
ambigous and likely to have a name such as "gpio3".

>> This patch is not about assigning initial values to GPIO lines.
>> That is an orthogonal usecase. This is just about naming lines.
>
> It is unless we decide that both should use the same structure.

It would still be a different property?

> I'm also worried that just putting in somewhat random names doesn't
> buy much. If you have to figure out what the name is for the GPIO line
> you want from userspace, then you might as well know the chip and
> offset. I'm doubtful we could standardize naming across platforms.

Having a symbolic GPIO line/rail name across several board
with different chipsets is the explicit goal for people like
96boards and IoT libraries they use. (Put them on CC).

> I'm not saying yes or no yet, just raising some of the concerns I have.

Let me respin the patch and we keep talking.

Yours,
Linus Walleij
