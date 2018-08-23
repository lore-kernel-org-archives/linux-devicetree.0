From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: add DT binding for UniPhier
 MIO DMAC
Date: Thu, 23 Aug 2018 19:42:32 +0530
Message-ID: <CAJe_Zhee-qQtAt7+k_LZ+CGabLBr3v3t2MYvbVYG9N1nHZcL=g@mail.gmail.com>
References: <1534843809-4137-1-git-send-email-yamada.masahiro@socionext.com>
 <1534843809-4137-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNASr=rf_foQ7PDTNS440rx3TLuY_TBagfQ-gCHxXpFB2vw@mail.gmail.com>
 <CAJe_ZhdZbUa2njAvSazGzv+7UgG+QHCTS+-Y-Ckqze+pMf9KQA@mail.gmail.com>
 <CAK7LNAT3MufLZhFB8HDnch09WUdEcLyDCU05dTYroOwWYcx=pQ@mail.gmail.com>
 <CAJe_ZheNp9t0DNQjmiQKMyZsbHBjMxqV87mE_3nQ1N_RS9znYQ@mail.gmail.com> <CAL_Jsq+ppQP9icJVhpUYGj_JCyxudi0Z4=+mKiBueMKZftrQ7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+ppQP9icJVhpUYGj_JCyxudi0Z4=+mKiBueMKZftrQ7A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Vinod <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 23 August 2018 at 18:51, Rob Herring <robh+dt@kernel.org> wrote:
> On Thu, Aug 23, 2018 at 12:38 AM Jassi Brar <jaswinder.singh@linaro.org> wrote:
>> On 23 August 2018 at 10:48, Masahiro Yamada

>> >
>> > If desired, I will export of_irq_count()
>> > and use it from my driver.
>> >
>> If you don't want to leave too much footprint, you could do
>>
>>   count = 0;
>>   while (of_irq_parse_one(dev, count, &irq) == 0) count++
>>
>> of_irq_parse_one() is already exported.
>
> Yes, but we really don't more users and drivers shouldn't be using it.
> Grepping DT functions and when the only users are pretty much powerpc,
> that's a good indication not to use the function.
>
> And you don't want to use of_irq_count either. platform_irq_count is
> what should be used here. It's already exported.
>
Thanks, platform_irq_count() is definitely better.

Yamada-san, for example, gpio-tegra.c infers the number of banks from
platform_irq_count() rather than the 'gpio-banks' property.
