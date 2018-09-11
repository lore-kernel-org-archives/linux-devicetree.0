Return-Path: <SRS0=HaP0=LZ=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: document R8A779{7|8}0
 bindings
References: <72db4d8d-7b3d-7368-02a4-f652a7bc810d@cogentembedded.com>
 <CAMuHMdW3nfPNOPQR9mWN+tdtLRz8LwR797gzORG7RRiiiHYeHQ@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <eed804ea-35ae-5c8f-7575-070cdefe02ba@cogentembedded.com>
Date: Tue, 11 Sep 2018 21:26:27 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW3nfPNOPQR9mWN+tdtLRz8LwR797gzORG7RRiiiHYeHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 09/10/2018 05:24 PM, Geert Uytterhoeven wrote:

>> Document the R-Car V3{M|H} (R8A779{7|8}0) SoC in the Renesas TMU bindings;
>> the TMU hardware in those is the Renesas standard 3-channel timer unit.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
> Not all channels seem to be identical, but the driver just matches against
> the "renesas,tmu" fallback?

   The only difference between TMUs is the input capture capability on the 3rd
channel in each TMU -- that includes TCPR register and extra interrupt output
TICPI<n> (perhaps has to do with 4th TMU IRQ?). The driver is blissfully unaware
of this extra capability. :-)

> In addition, the V3H TMU seems to differ from the TMU in other R-Car Gen3
> variants?

   Yes, but they only differ in the number of channels capable of input capture. 

> How is this handled?

   Nohow. And I'm not sure we should care about this difference...

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
