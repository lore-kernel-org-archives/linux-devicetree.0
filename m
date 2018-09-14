Return-Path: <SRS0=ARIy=L4=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: document R8A779{7|8}0
 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <72db4d8d-7b3d-7368-02a4-f652a7bc810d@cogentembedded.com>
 <CAMuHMdW3nfPNOPQR9mWN+tdtLRz8LwR797gzORG7RRiiiHYeHQ@mail.gmail.com>
 <eed804ea-35ae-5c8f-7575-070cdefe02ba@cogentembedded.com>
Message-ID: <a14f6f87-0b55-4c2c-1cd0-27de68562213@cogentembedded.com>
Date: Fri, 14 Sep 2018 23:17:53 +0300
MIME-Version: 1.0
In-Reply-To: <eed804ea-35ae-5c8f-7575-070cdefe02ba@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 09/11/2018 09:26 PM, Sergei Shtylyov wrote:

>>> Document the R-Car V3{M|H} (R8A779{7|8}0) SoC in the Renesas TMU bindings;
>>> the TMU hardware in those is the Renesas standard 3-channel timer unit.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Thanks for your patch!
>>
>> Not all channels seem to be identical, but the driver just matches against
>> the "renesas,tmu" fallback?
> 
>    The only difference between TMUs is the input capture capability on the 3rd
> channel in each TMU -- that includes TCPR register and extra interrupt output

   Not only that, the TMUs having the input capture also can use external clock
as they have the TCLK<n> signal.

> TICPI<n> (perhaps has to do with 4th TMU IRQ?).

   They don't, most probably.

> The driver is blissfully unaware
> of this extra capability. :-)

   Perhaps we should describe a "renesas,tmu-ext-clk" for the TMUs having an external
clock? Will this make you happy?

>> In addition, the V3H TMU seems to differ from the TMU in other R-Car Gen3
>> variants?
> 
>    Yes, but they only differ in the number of channels capable of input capture.

   ... and having external clock.
 
>> How is this handled?
> 
>    Nohow. And I'm not sure we should care about this difference...

   At this point, the driver only uses internal clock... we can document the external
clock for the compatible value I've just suggested... Will that make you happy? :-)

MBR, Sergei
