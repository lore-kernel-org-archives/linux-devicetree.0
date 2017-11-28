From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7795: Move nodes which have no
 reg property out of bus
Date: Tue, 28 Nov 2017 10:04:00 +0100
Message-ID: <CAMuHMdXoDNt7j-hEZmDA2BFFPUAfsi1ukZWowJ3=kTswyYMk5Q@mail.gmail.com>
References: <20171124105234.25774-1-horms+renesas@verge.net.au>
 <CAMuHMdW9V6Bkh5uS9qNA7awtygEs=qRd7jigwSHmpV2VM3n9dA@mail.gmail.com>
 <20171127110430.ulgjrzgy3pdugs2s@verge.net.au> <CAMuHMdUm=PiGVWVg9pyNTR5z2WjLcoG1uecBNBeKsSxbAxBt8w@mail.gmail.com>
 <20171128085645.ofrk33bfqd736sip@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171128085645.ofrk33bfqd736sip@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Tue, Nov 28, 2017 at 9:56 AM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Nov 27, 2017 at 12:15:39PM +0100, Geert Uytterhoeven wrote:
>> On Mon, Nov 27, 2017 at 12:04 PM, Simon Horman <horms@verge.net.au> wrote:
>> > I just noticed that with this patch applied I now see:
>> >
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
>> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer
>> >
>> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer
>>
>> Right, the "interrupt-parent = <&gic>;" inside the /soc node applies to child
>> nodes of the /soc node only.
>>
>> You can find this in two ways:

s/find/fix/

>>
>>   1. Add "interrupt-parent = <&gic>;" to the /pmu_a57 and /pmu_a53 nodes.
>>   2. Switch those nodes from "interrupt" to "interrupts-extended", e.g. turn
>>
>>         interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>>
>>      into
>>
>>         interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>>
>> The latter is what e.g. arch/arm/boot/dts/armada-375.dtsi does.
>
> Thanks, I took option 1 as it seems consistent with the rest of the
> Renesas DT files. I also added it to the /timer node.

Actually we recently had a discussion about this on IRC, triggered by a
similar issue in board files (see e.g, Ethernet PHY interrupts).

Given the following comment:

drivers/of/irq.c:       /* Try the new-style interrupts-extended first */
drivers/of/irq.c:       res = of_parse_phandle_with_args(device,
"interrupts-extended",

I think it would be better to use interrupts-extended for individual/isolated
use outside the /soc node.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
