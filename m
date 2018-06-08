From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/17] arm64: dts: r8a77965: Add VSP instances
Date: Fri, 8 Jun 2018 11:29:29 +0200
Message-ID: <CAMuHMdU7OyUvgNqbkjtHyb0LPjgTdPp_BBcGNbjiqfQUgCdMuw@mail.gmail.com>
References: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com>
 <20180426165346.494-12-kieran.bingham+renesas@ideasonboard.com> <1787243.JuNJAuBqMb@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1787243.JuNJAuBqMb@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Will Deacon <will.deacon@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

CC Sergei (for V3H/V3M)

On Thu, Apr 26, 2018 at 11:11 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday, 26 April 2018 19:53:40 EEST Kieran Bingham wrote:
>> The r8a77965 has 4 VSP instances.
>>
>> Based on a similar patch of the R8A7796 device tree
>> by Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> [Kieran: Rebased to top of tree, fixed sort orders]
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 44 +++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
>> b/arch/arm64/boot/dts/renesas/r8a77965.dtsi index
>> 1f44ed7c1b1c..e92e6b03333a 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi

>> @@ -1025,6 +1047,17 @@
>>                       resets = <&cpg 611>;
>>               };
>>
>> +             vspd0: vsp@fea20000 {
>> +                     compatible = "renesas,vsp2";
>> +                     reg = <0 0xfea20000 0 0x4000>;
>
> RFP2 has a CLUT so the register range needs to be extended. I'd recommend
> covering the entire space (0x8000) even if no LUT or CLU module is present.

Even on V3H/V3M, which have some part of the CLUT, and could do
with 0x5000?

Note that this makes it overlap with fcpvd0 on all R-Car Gen3 SoCs,
as mentioned by Simon on IRC.

>> +                     interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&cpg CPG_MOD 623>;
>> +                     power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
>> +                     resets = <&cpg 623>;
>> +
>> +                     renesas,fcp = <&fcpvd0>;
>> +             };
>> +
>>               fcpvd0: fcp@fea27000 {
>>                       compatible = "renesas,fcpv";
>>                       reg = <0 0xfea27000 0 0x200>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
