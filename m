Return-Path: <SRS0=jzey=HN=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20180424070801.5g6t2ahoe6lszjw4@verge.net.au>
References: <1524238029-55315-1-git-send-email-biju.das@bp.renesas.com>
 <1524238029-55315-4-git-send-email-biju.das@bp.renesas.com> <20180424070801.5g6t2ahoe6lszjw4@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 09:19:39 +0200
Message-ID: <CAMuHMdW4YXCWAD3BnBBerFHkrmjGq9JndnFUnUcLqKK3gAswbw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: r8a77470: Add SCIF support
Content-Type: text/plain; charset="UTF-8"
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Tue, Apr 24, 2018 at 9:08 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Apr 20, 2018 at 04:27:08PM +0100, Biju Das wrote:
>> Describe SCIF ports in the R8A77470 device tree.
>>
>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>> ---
>>  arch/arm/boot/dts/r8a77470.dtsi | 69 +++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 67 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
>> index 2f89f33..39549f2 100644
>> --- a/arch/arm/boot/dts/r8a77470.dtsi
>> +++ b/arch/arm/boot/dts/r8a77470.dtsi
>> @@ -190,19 +190,84 @@
>>                       dma-channels = <15>;
>>               };
>>
>> +             scif0: serial@e6e60000 {
>> +                     compatible = "renesas,scif-r8a77470",
>> +                                  "renesas,rcar-gen2-scif", "renesas,scif";
>> +                     reg = <0 0xe6e60000 0 0x40>;
>> +                     interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&cpg CPG_MOD 721>,
>> +                              <&cpg CPG_CORE 5>, <&scif_clk>;
>> +                     clock-names = "fck", "brg_int", "scif_clk";
>> +                     power-domains = <&sysc 32>;
>> +                     resets = <&cpg 721>;
>> +                     status = "disabled";
>> +             };
>> +
>>               scif1: serial@e6e68000 {
>>                       compatible = "renesas,scif-r8a77470",
>>                                    "renesas,rcar-gen2-scif", "renesas,scif";
>>                       reg = <0 0xe6e68000 0 0x40>;
>>                       interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
>> -                             clocks = <&cpg CPG_MOD 720>,
>> -                              <&cpg CPG_CORE 6>, <&scif_clk>;
>> +                     clocks = <&cpg CPG_MOD 720>,
>> +                              <&cpg CPG_CORE 5>, <&scif_clk>;
>
> I am a little unclear why the CPG clock is changed from 6 (ZS?) to 5 (ZX?).
> Could you clarify this for me?

#define R8A77470_CLK_ZS         5

I guess you queued up the initial .dtsi before the error in
include/dt-bindings/clock/r8a77470-cpg-mssr.h was detected?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
