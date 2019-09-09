From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH 2/3] soc: amazon: al-pos: Introduce Amazon's Annapurna
 Labs POS driver
Date: Mon, 9 Sep 2019 14:12:48 +0300
Message-ID: <98f0028e-5653-3116-fdaa-1385ecdf0289@amazon.com>
References: <1568020220-7758-1-git-send-email-talel@amazon.com>
 <1568020220-7758-3-git-send-email-talel@amazon.com>
 <CAK8P3a3UF7xPV1U3eW6Jdu754P1bzG208UxD9KUxEm1JjZudww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3UF7xPV1U3eW6Jdu754P1bzG208UxD9KUxEm1JjZudww@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, gregkh <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <mripard@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>Dav
List-Id: devicetree@vger.kernel.org


On 9/9/2019 12:44 PM, Arnd Bergmann wrote:
> On Mon, Sep 9, 2019 at 11:14 AM Talel Shenhar <talel@amazon.com> wrote:
>> The Amazon's Annapurna Labs SoCs includes Point Of Serialization error
>> logging unit that reports an error in case write error (e.g. attempt to
>> write to a read only register).
>> This patch introduces the support for this unit.
>>
>> Signed-off-by: Talel Shenhar <talel@amazon.com>
> Looks ok overall, juts a few minor comments:
Thanks.
>
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Talel Shenhar");
>> +MODULE_DESCRIPTION("Amazon's Annapurna Labs POS driver");
> These usually go to the end of the file.
Ack, Will move them as part of v2.
>
>> +       log1 = readl_relaxed(pos->mmio_base + AL_POS_ERROR_LOG_1);
>> +       if (!FIELD_GET(AL_POS_ERROR_LOG_1_VALID, log1))
>> +               return IRQ_NONE;
>> +
>> +       log0 = readl_relaxed(pos->mmio_base + AL_POS_ERROR_LOG_0);
>> +       writel_relaxed(0, pos->mmio_base + AL_POS_ERROR_LOG_1);
> Why do you require _relaxed() accessors here? Please add a comment
> explaining that, or use the regular readl()/writel().

I don't think commenting is needed here as there is nothing special in 
this type of access.

I don't see this is common to comment the use of the _relaxed accessors.

This driver is for SoC using arm64 cpu.

If one uses the non-relaxed version of readl while running on arm64, he 
shall cause read barrier, which is then doing dsm(ld).. This barrier is 
not needed here, so we spare the use of the more heavy readl in favor of 
the less "harmful" one.

Let me know what you think.

>
>> +       resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       pos->mmio_base = devm_ioremap_resource(&pdev->dev, resource);
> This can be simplified to devm_platform_ioremap_resource().
Ack, Will simplify them in v2.
>
>> +       pos->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> And this is usually written as platform_get_irq()
Ack, Will replace them with platform_get_irq() in v2.
>
>         Arnd
