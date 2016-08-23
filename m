From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/13] pinctrl: add a pincontrol driver for BCM6328
Date: Tue, 23 Aug 2016 10:57:44 +0200
Message-ID: <CACRpkdYN6YZkYAiCHH4o3X2UjQdxxdbpp6sueNFUbQuzJUO8xA@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
 <1471604025-21575-4-git-send-email-jonas.gorski@gmail.com>
 <CACRpkdbZDmHimo9K1rUcs-4MyOSZH5SHUD3kuSYANppLUU0WwQ@mail.gmail.com> <CAOiHx=nE76PYpTJRMQw0YahFMwBwXmDnWD27D-ZJ8toFkYfm=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAOiHx=nE76PYpTJRMQw0YahFMwBwXmDnWD27D-ZJ8toFkYfm=g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 3:54 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
> On 22 August 2016 at 15:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, Aug 19, 2016 at 12:53 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
>>
>>> Add a pincontrol driver for BCM6328. BCM628 supports muxing 32 pins as
>>> GPIOs, as LEDs for the integrated LED controller, or various other
>>> functions. Its pincontrol mux registers also control other aspects, like
>>> switching the second USB port between host and device mode.
>>>
>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>
>> This looks good. Just thinking following the other patches
>> that maybe this should be a syscon child driver.
>>
>>> +#define BCM6328_NGPIO          32
>>
>> I wonder why the pin control driver cares about that?
>>
>>> +struct bcm6328_pinctrl {
>>> +       struct pinctrl_dev *pctldev;
>>> +       struct pinctrl_desc desc;
>>> +
>>> +       void __iomem *mode;
>>> +       void __iomem *mux[3];
>>> +
>>> +       /* register access lock */
>>> +       spinlock_t lock;
>>> +
>>> +       struct gpio_chip gpio;
>>
>> Usually this should be the other way around: the gpio_chip
>> knows about the pin controller, the pin controller does not
>> know about the gpio_chip.
>>
>> I don't see it used in the code either? Artifact?
>
> That's because some of the drivers require it, and kept it here so to
> keep the drivers as similar as possible.

No dead code please. I think that is just confusing.

>> Why all this __raw_* accessors? What is wrong with readl_relaxed()
>> and writel_relaxed()? Or MIPS doesn't have them?
>
> BCM63XX is one of those weird targets that are usually big endian, and
> there are no native endian / big endian *_relaxed() accessors.

Aha OK.

>> Nice, but why not just add
>> depends on OF
>> to the Kconfig and get rid of the #ifdef?
>
> As mentioned for the generic part, I want to use it on a !OF target as well.

OK.

>>> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mode");
>>> +       mode = devm_ioremap_resource(&pdev->dev, res);
>>> +       if (IS_ERR(mode))
>>> +               return PTR_ERR(mode);
>>> +
>>> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mux");
>>> +       mux = devm_ioremap_resource(&pdev->dev, res);
>>> +       if (IS_ERR(mux))
>>> +               return PTR_ERR(mux);
>>
>> This mishmash of remap windows makes me prefer the syscon
>> design pattern.
>
> At least for this one I would still need to have multiple syscons

Having multiple syscons is not a problem.

> because there already is one OF enabled driver that uses a non-syscon
> access to drivers within this range.

I don't understand this. Can you explain? If another driver is using
a non-syscon pattern then surely it can be refactored due to being
done the wrong way in the first place. I have done so myself when
running into similar issues.

Yours,
Linus Walleij
