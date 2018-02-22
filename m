Return-Path: <SRS0=Q8ug=FQ=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMz4kuLCVPo1KgHQ8wOv=y+-c6UkV+ubp8uChXn8KQipvrNesA@mail.gmail.com>
References: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517795460.git.baolin.wang@linaro.org>
 <CACRpkdZzqbhRs+JTiezkNfD4ne-foGgoW+b51DLcFeJsXH2Edg@mail.gmail.com> <CAMz4kuLCVPo1KgHQ8wOv=y+-c6UkV+ubp8uChXn8KQipvrNesA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 15:38:07 +0100
Message-ID: <CACRpkdYDaUi-8eoAt-7V3YwzFxjmtST0i_BqT46WdB0=2MU3FA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: Add Spreadtrum GPIO controller documentation
Content-Type: text/plain; charset="UTF-8"
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Feb 14, 2018 at 3:51 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
> On 13 February 2018 at 17:20, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, Feb 5, 2018 at 2:55 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
>>
>>> This patch adds the device tree bindings for the Spreadtrum
>>> GPIO controller. The gpios will be supported by the GPIO
>>> generic library.
>>>
>>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>>
>> I took this patch out again for now, as it turns out
>> that not all of the variants are really GPIO controllers,
>> but rather irqchips.
>>
>> If they can't read nor write any GPIO lines, they should
>> not have the property gpio-controller at all. Then they are
>> just irqchips.
>
> I did not get you here. All GPIOs can be read or write for this GPIO controller.

Sorry I confused one of the drivers for the other.

I'm so clumsy sometimes :(

Yours,
Linus Walleij
