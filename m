From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for GPIO subnodes
Date: Wed, 9 Mar 2016 12:56:36 +0700
Message-ID: <CACRpkdY5a8DADDHT_i0bCKr5vYs6997=HpYr3XF-qWxq6MVV0A@mail.gmail.com>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
	<1456214089-13954-3-git-send-email-mpa@pengutronix.de>
	<20160223232534.GA29637@rob-hp-laptop>
	<CACRpkdaE64pjnr=hn0nMJb-KHx5GhvOSrdhNWJucY+UJVcV18w@mail.gmail.com>
	<CAL_JsqLxQkyc6BbFLbZgU2OS93B2k74FJhF-YbcZ1UX+KUMvNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLxQkyc6BbFLbZgU2OS93B2k74FJhF-YbcZ1UX+KUMvNw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 9, 2016 at 11:27 AM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Mar 8, 2016 at 9:53 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> - The "name" is what the line (pin) is named
>>   on the chip, or the name of the rail going out on the board, from the chip,
>>   so it is a producer name.
>
> Who/what uses this?

The names[] in struct gpio_chip has been used for years to name
the lines of the GPIO chips.

The requirement coming from the community for userspace GPIO
is about being able to name the lines on the producer side. One example
is 96boards that want to consistently name lines on a header from
the producer side across a set of boards, no matter what SoC is
used. In their case the actual consumer is some one-off peripheral
driven from userspace, so there (I expect) userspace will set up the
label/consumer name eventually, if any.

>> I named these "name" and "consumer" in the userspace ABI, I think
>> I should take a round and rename it from "label" to "consumer"
>> also inside the kernel to avoid confusion with this, because "label"
>> in DT is going to be converted to "name" in the GPIOlib and
>> then it also has something named "label" and that is another thing,
>> argh!
>
> There is still confusion because DT label should be the consumer side,
> not the SoC pin name.

Oh I see what you mean. That is actually how it works with
the hogs, it is setting the consumer side of things through gpiod_get().

> Then of course you could have 3 levels of names needed if you have SoC
> pin, board connector pin, and mezzanine consumer.

I don't think the distinction between pin and board connector is
needed, if it is then the connector should have its own DT node
and I suspect that would be overkill. I am atleast optimistically
assuming that "name" will cover pin/rail/header name - whatever
makes most sense - for a GPIO line producer.

Linus Walleij
