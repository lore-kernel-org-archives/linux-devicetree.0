Return-Path: <SRS0=k11Z=MG=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779{7|8}0: add TPU support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <0d1a6380-e5f0-35a2-d421-f3c5bdd04a75@cogentembedded.com>
 <CAMuHMdXFCtEc5z1k9jHJaY-mS=ELZ69c+1RDO6TdZJ=TNovRAA@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6fbc6943-feda-aa29-2c16-0dc62581db17@cogentembedded.com>
Date: Mon, 24 Sep 2018 20:55:33 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXFCtEc5z1k9jHJaY-mS=ELZ69c+1RDO6TdZJ=TNovRAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 09/24/2018 02:29 PM, Geert Uytterhoeven wrote:

>> Describe TPU in the R8A779{7|8}0 device trees.
>>
>> Based on the original (and large) patches by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> @@ -614,6 +614,14 @@
>>                         status = "disabled";
>>                 };
>>
>> +               tpu: pwm@e6e80000 {
>> +                       compatible = "renesas,tpu-r8a77970", "renesas,tpu";
>> +                       reg = <0 0xe6e80000 0 0x148>;
>> +                       clocks = <&cpg CPG_MOD 304>;
>> +                       power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
>> +                       #pwm-cells = <3>;
>> +                       status = "disabled";
>> +               };
> 
> While not used by the driver, I think it would be good to describe its interrupt
> (SPI 135). Same for r8a77980.dtsi.

   Gosh, you're right! Will re-spin. :-)

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
