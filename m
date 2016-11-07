From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 2/2] clk: renesas: cpg-mssr: add R8A7743 support
Date: Mon, 7 Nov 2016 13:35:09 +0300
Message-ID: <d6c20d8f-3406-bba7-62f9-2f409f8da44a@cogentembedded.com>
References: <1737840.BeMyoUTlpl@wasted.cogentembedded.com>
 <7514228.6CSyDUjs5Q@wasted.cogentembedded.com>
 <CAMuHMdXmoGoTQP0QdG_1xg7fTyaa8x5ujbVW9XoJ5GQgg+oEpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXmoGoTQP0QdG_1xg7fTyaa8x5ujbVW9XoJ5GQgg+oEpQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hello.

On 11/7/2016 1:09 PM, Geert Uytterhoeven wrote:

>> Add RZ/G1M (R8A7743) Clock  Pulse Generator / Module Standby and Software
>> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
>> (and RZ/G) code.
>>
>> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
>> <geert+renesas@glider.be>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> ---
>> Changes in version 5:
>> - describe the Z clock as PLL0/VCO divided by 2.
>
> Why did you do that?

    I did it because I removed the divisor-by-2 from PLL0.

>> --- /dev/null
>> +++ renesas/drivers/clk/renesas/r8a7743-cpg-mssr.c
>> @@ -0,0 +1,270 @@
>
>> +       DEF_FIXED("z",     R8A7743_CLK_Z,       CLK_PLL0,           2, 1),
>
> FTR, previous version had
>
>        DEF_BASE("z",    R8A7743_CLK_Z,    CLK_TYPE_GEN2_Z,     CLK_PLL0),
>
> which made the "z" clock configurable.

     I see your point -- I should have included the divisor-by-2 into the 
common R-Car gen2 driver code instead...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei

