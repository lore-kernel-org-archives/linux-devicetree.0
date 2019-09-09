From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH 2/3] soc: amazon: al-pos: Introduce Amazon's Annapurna
 Labs POS driver
Date: Mon, 9 Sep 2019 17:11:05 +0300
Message-ID: <8f7840c3-a682-04a5-18bf-ac7a723725b0@amazon.com>
References: <1568020220-7758-1-git-send-email-talel@amazon.com>
 <1568020220-7758-3-git-send-email-talel@amazon.com>
 <CAK8P3a3UF7xPV1U3eW6Jdu754P1bzG208UxD9KUxEm1JjZudww@mail.gmail.com>
 <98f0028e-5653-3116-fdaa-1385ecdf0289@amazon.com>
 <CAK8P3a1NVGwYa1bw_vjBatd1xe-i875X1Vq1M+2G_Zxd2Oqusg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1NVGwYa1bw_vjBatd1xe-i875X1Vq1M+2G_Zxd2Oqusg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, gregkh <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <mripard@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>Dav
List-Id: devicetree@vger.kernel.org


On 9/9/2019 4:41 PM, Arnd Bergmann wrote:
> On Mon, Sep 9, 2019 at 1:13 PM Shenhar, Talel <talel@amazon.com> wrote:
>> On 9/9/2019 12:44 PM, Arnd Bergmann wrote:
>>> On Mon, Sep 9, 2019 at 11:14 AM Talel Shenhar <talel@amazon.com> wrote:
>>>> +       writel_relaxed(0, pos->mmio_base + AL_POS_ERROR_LOG_1);
>>> Why do you require _relaxed() accessors here? Please add a comment
>>> explaining that, or use the regular readl()/writel().
>> I don't think commenting is needed here as there is nothing special in
>> this type of access.
>>
>> I don't see this is common to comment the use of the _relaxed accessors.
> I usually mention it in driver reviews, but most authors revert back
> to the normal accessors when there is no difference.
>
>> This driver is for SoC using arm64 cpu.
>>
>> If one uses the non-relaxed version of readl while running on arm64, he
>> shall cause read barrier, which is then doing dsm(ld).. This barrier is
>> not needed here, so we spare the use of the more heavy readl in favor of
>> the less "harmful" one.
>>
>> Let me know what you think.
> If the barrier causes no harm, just leave it in to keep the code more
> readable. Most developers don't need to know the difference between
> the two, so using the less common interface just makes the reader
> curious about why it was picked.
>
> Avoiding the barrier can make a huge performance difference in a
> hot code path, but the downside is that it can behave in unexpected
> ways if the same code is run on a different CPU architecture that
> does not have the exact same rules about what _relaxed() means.
>
> In fact, replacing a 'readl()' with 'readl_relaxed() + rmb()' can lead
> to slower rather than faster code when the explicit barrier is heavier
> than the implied one (e.g. on x86), or readl_relaxed() does not skip
> the barrier.
>
> The general rule with kernel interfaces when you have two versions
> that both do what you want is to pick the one with the shorter name.
> See spin_lock()/spin_lock_irqsave(),  ioremap()/ioremap_nocache(),
> or ktime_get()/ktime_get_clocktai_ts64(). (yes, there are also
> exceptions)
>
>      Arnd


Thanks for the detailed response.


In current implementation of v1, I am not doing any read barrier, Hence, 
using the non-relaxed will add unneeded memory barrier.

I have no strong objection moving to the non-relaxed version and have an 
unneeded memory barrier, as this path is not "hot" one.


Beside of avoiding the unneeded memory barrier, I would be happy to keep 
common behavior for our drivers:

e.g.

https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-al-fic.c#L49


So what do you think we should go with? relaxed or non-relaxed?
