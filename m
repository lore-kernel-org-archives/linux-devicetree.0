From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] irqchip: renesas-intc-irqpin: Add optional functional
 clock to bindings
Date: Wed, 1 Apr 2015 11:06:44 +0200
Message-ID: <CAMuHMdUmusF1udbX_wYRcr9kVmKic1FXBUvObbcvT5xm54Vtag@mail.gmail.com>
References: <1426696644-25636-1-git-send-email-geert+renesas@glider.be>
	<5509BC1E.8050802@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5509BC1E.8050802@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Mar 18, 2015 at 6:55 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>> ---
>> a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
>> +++
>> b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt

>> +Example
>> +-------
>> +
>> +       irqpin1: irqpin@e6900004 {
>
>
>    The node name should be "interrupt-controller@e6900004".

Will fix (also the dtsi).

>> +               compatible = "renesas,intc-irqpin-r8a7740",
>> +                            "renesas,intc-irqpin";
>> +               #interrupt-cells = <2>;
>> +               interrupt-controller;
>> +               reg = <0xe6900004 4>,
>> +                       <0xe6900014 4>,
>> +                       <0xe6900024 1>,
>> +                       <0xe6900044 1>,
>> +                       <0xe6900064 1>;
>> +               interrupts = <0 149 IRQ_TYPE_LEVEL_HIGH
>> +                             0 149 IRQ_TYPE_LEVEL_HIGH
>> +                             0 149 IRQ_TYPE_LEVEL_HIGH
>> +                             0 149 IRQ_TYPE_LEVEL_HIGH
>> +                             0 149 IRQ_TYPE_LEVEL_HIGH
>> +                             0 149 IRQ_TYPE_LEVEL_HIGH
>> +                             0 149 IRQ_TYPE_LEVEL_HIGH
>> +                             0 149 IRQ_TYPE_LEVEL_HIGH>;
>
>    Hm, 8 similar interrupts?

Yes, all interrupts are wired to the same parent on r8a7740.
However, the binding docs indeed don't mention that there should be
one entry per interrupt handled by the module. I'll fix that, too.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
