From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v4 3/6] irqdomain: move IRQ_DOMAIN_NAME_ALLOCATED define
 to the original position
Date: Sat, 9 Sep 2017 00:10:36 +0900
Message-ID: <CAK7LNASbNE9RvMucma=48CDFGQ2L4i=ktqs-fMzgZwWJvdUMMA@mail.gmail.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
 <1504784522-26841-4-git-send-email-yamada.masahiro@socionext.com> <92500143-814b-b255-bb7b-c36d5eca5457@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <92500143-814b-b255-bb7b-c36d5eca5457@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2017-09-07 21:04 GMT+09:00 Marc Zyngier <marc.zyngier@arm.com>:
> On 07/09/17 12:41, Masahiro Yamada wrote:
>> Commit 6a6544e520ab ("genirq/irqdomain: Remove auto-recursive hierarchy
>> support") not only deleted IRQ_DOMAIN_FLAG_AUTO_RECURSIVE, but also
>> moved IRQ_DOMAIN_NAME_ALLOCATED up.
>>
>> Get it back to the original position to sort the enum by the bit shift.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes in v4:
>>   - Newly added
>>
>>
>>  include/linux/irqdomain.h | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
>> index 81e4889..31be32d 100644
>> --- a/include/linux/irqdomain.h
>> +++ b/include/linux/irqdomain.h
>> @@ -180,9 +180,6 @@ enum {
>>       /* Irq domain is hierarchical */
>>       IRQ_DOMAIN_FLAG_HIERARCHY       = (1 << 0),
>>
>> -     /* Irq domain name was allocated in __irq_domain_add() */
>> -     IRQ_DOMAIN_NAME_ALLOCATED       = (1 << 6),
>> -
>>       /* Irq domain is an IPI domain with virq per cpu */
>>       IRQ_DOMAIN_FLAG_IPI_PER_CPU     = (1 << 2),
>>
>> @@ -195,6 +192,9 @@ enum {
>>       /* Irq domain implements MSI remapping */
>>       IRQ_DOMAIN_FLAG_MSI_REMAP       = (1 << 5),
>>
>> +     /* Irq domain name was allocated in __irq_domain_add() */
>> +     IRQ_DOMAIN_NAME_ALLOCATED       = (1 << 6),
>> +
>
> The right fix would be to leave it where it is, but to actually fix the
> shift, which is what I should have done the first place.


You are definitely right.

At first, I missed the fact that (1 << 6) was already used,
then I assigned the same value to my new flag.

So, I tried to fix the list before adding my new one.


Without 5/6, I do not have a good reason to
push this cosmetic patch only.



-- 
Best Regards
Masahiro Yamada
