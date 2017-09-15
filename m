From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/11] arm64: dts: renesas: initial Eagle board device tree
Date: Fri, 15 Sep 2017 20:44:16 +0200
Message-ID: <CAMuHMdU+DYBCu1bKLh_VjuSR-cSfjwPQuAxTsaU2JW-3d-5QUw@mail.gmail.com>
References: <20170912210543.810219167@cogentembedded.com> <d6f9d5ef-4864-3ffb-9406-acd65bff10aa@cogentembedded.com>
 <5c680bad-39c8-a6c7-ee2a-6a2e72c33026@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <5c680bad-39c8-a6c7-ee2a-6a2e72c33026@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Sep 15, 2017 at 7:28 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 09/13/2017 12:19 AM, Sergei Shtylyov wrote:
>>> Add the initial device  tree for  the R8A77970 SoC based Eagle board.
>>> The board has 1 debug serial port (SCIF0); include support for it,
>>> so that the serial console can work.
>>>
>>> Based on the original (and large) patch by Vladimir Barinov
>>> <vladimir.barinov@cogentembedded.com>.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>> [...]
>>>
>>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>> ===================================================================
>>> --- /dev/null
>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>> @@ -0,0 +1,45 @@
>>
>> [...]
>>>
>>> +&extal_clk {
>>> +    clock-frequency = <16666666>;
>>> +};
>>> +
>>> +&extalr_clk {
>>> +    clock-frequency = <32768>;
>>> +};
>>> +
>>
>>     Forgot to specify SCIF_CLK -- it's populated.
>
>    Unfortunately, the kernel hangs after ttySC0 is registered if I specify
> this frequency...

Is the crystal populated?

When doing initial bringup of the remote Eagle I have access to, the SCIF
registers didn't indicate SCIF_CLK was being used from U-Boot, while it
is used on R-Car Gen2 boards that have it populated.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
