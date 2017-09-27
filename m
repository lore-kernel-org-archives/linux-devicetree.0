From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: gpio: uniphier: add UniPhier GPIO binding
Date: Wed, 27 Sep 2017 23:42:53 +0900
Message-ID: <CAK7LNATEBJk-mVeGJu2qRUVgJsKG+rc+T_ZePtfBwecNzXu8Ng@mail.gmail.com>
References: <1506480343-9597-1-git-send-email-yamada.masahiro@socionext.com>
 <1506480343-9597-2-git-send-email-yamada.masahiro@socionext.com> <CACRpkdYJSXH+94QScrpSPdfy8ULa6dV2q0qRjsfKAAWSRuKTKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYJSXH+94QScrpSPdfy8ULa6dV2q0qRjsfKAAWSRuKTKQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,


2017-09-27 22:42 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Wed, Sep 27, 2017 at 4:45 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> This GPIO controller is used on UniPhier SoC family.
>>
>> The vendor specific property "socionext,interrupt-ranges" is for
>> specifying interrupt mapping to the parent interrupt controller
>> because the mapping is not contiguous.  It works like "ranges",
>> but transforms "interrupts" instead of "reg".
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> I don't think Rob has seen the new interrupt range thing?
> (It's not a big deal. Things like these are a bit fuzzy.)


This judge is difficult.

Rob gave Ack to v3.

I added one more property to v4, so I removed Rob's Ack
because it contained what Rob had not seen.

http://patchwork.ozlabs.org/patch/810981/

But, he was annoyed by my carefulness.
This time, I am keeping his Ack, but it would be appreciated
if he cares to review this once again.



>> +               socionext,interrupt-ranges = <0 48 16>, <16 154 5>, <21 217 3>;
>
> If it is as you say, that other SoCs are doing the same, we should
> think about creating a generic property for this. Like
> hierarchy-interrupt-ranges or so.


Of course, I thought of this.
When we add a generic property, we need very careful review.


If we want something generic, phandle of parent irqchip is necessary.


  interrupt-ranges = <parent-phandle   parent-irq-base   child-irq-base   len>,
                     <parent-phandle2  parent-irq-base2  child-irq-base2  len2>,
                      ...


The format is very similar to gpio-ranges.

The phandle is necessary because it may have two or more interrupt parents.
This is why we introduced "interrupts" property at first,
but later we ended up with adding "interrupts-extended".


Unfortunately, this does not fit with the current design of irqdomain
because current irqdomain can only one parent.

In my opinion, the hierarchy irq domain was badly designed.
This is why it is so painful to write drivers.




> I kind of liked the old patch where it was just "interrupts" and
> then you looked it up from the irq subsystem. (tglx even ACKed
> the patch).
>
> But I want the DT people to say something here.


I think "interrupts" is for interrupt consumers.

We need something different for inter-irqchip connection.



-- 
Best Regards
Masahiro Yamada
