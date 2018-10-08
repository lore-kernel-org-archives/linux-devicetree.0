Return-Path: <SRS0=hi9w=MU=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add thermal support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <51491585-16fb-93b1-bb1a-09e89683f2f0@cogentembedded.com>
 <CAMuHMdWsW-E_a17LJ-i4Wts531B-PyYqW9mqWQmt=jH6fUpOPg@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1ef39615-fc82-dc2a-05eb-7b1aed7afa98@cogentembedded.com>
Date: Mon, 8 Oct 2018 19:35:50 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWsW-E_a17LJ-i4Wts531B-PyYqW9mqWQmt=jH6fUpOPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 10/08/2018 11:12 AM, Geert Uytterhoeven wrote:

>> Describe THS/CIVM in the R8A77970 device trees.
>>
>> Based on the original (and large) patches by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against the 'renesas-devel-20181004-v4.19-rc6' tag of Simon
>> Horman's 'renesas.git' repo.
>>
>> The thermal driver/bindings patches have been posted yesterday...
>>
>>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   32 ++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> @@ -300,6 +300,19 @@
>>                         #power-domain-cells = <1>;
>>                 };
>>
>> +               thermal: thermal@e6190000 {
>> +                       compatible = "renesas,thermal-r8a77970";
>> +                       reg =  <0 0xe6190000 0 0x14
> 
> 0x14 was appropriate for R-Mobile APE6...

   Copy&paste is to blame here, I guess... I'll fix to 0x10.

> 
>> +                               0 0xe6190100 0 0x38>;
> 
> What about the CIVM status register? DT describes hardware, not driver
> limitations.

   I wasn't sure whether to put it into a separate "reg" tuple (which would confuse
the driver) or not. After looking into the manual again, I'm going to extend the
2nd "reg" tuple...

>> +                       interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&cpg CPG_MOD 522>;
>> +                       power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
>> +                       resets = <&cpg 522>;
>> +                       #thermal-sensor-cells = <0>;
>> +               };
>> +
>>                 intc_ex: interrupt-controller@e61c0000 {
>>                         compatible = "renesas,intc-ex-r8a77970", "renesas,irqc";
>>                         #interrupt-cells = <2>;
> 
> The rest looks good to me, so with the above fixed:
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

   Thanks :-)

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
