From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] dt-bindings: net: renesas-ravb: Make stream buffer optional
Date: Tue, 6 Feb 2018 16:12:23 +0100
Message-ID: <CAMuHMdWCvNq2zhK+Qwsv_3oDVVGJk3mV3d4PR=-g7ajgD6uakg@mail.gmail.com>
References: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
 <1517922354-28421-2-git-send-email-geert+renesas@glider.be> <d0ef917e-7663-daad-660e-af07838d3806@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <d0ef917e-7663-daad-660e-af07838d3806@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "David S . Miller" <davem@davemloft.net>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev <netdev@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Tue, Feb 6, 2018 at 3:56 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 02/06/2018 04:05 PM, Geert Uytterhoeven wrote:
>> The Stream Buffer for EtherAVB-IF (STBE) is an optional component, and
>> is not present on all SoCs.
>>
>> Document this in the DT bindings, including a list of SoCs that do have
>> it.
>>
>> Fixes: 785ec87483d1e24a ("ravb: document R8A77970 bindings")
>> Fixes: f231c4178a655b09 ("dt-bindings: net: renesas-ravb: Add support for R8A77995 RAVB")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks!

>> --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
>> +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
>> @@ -26,7 +26,10 @@ Required properties:
>>       SoC-specific version corresponding to the platform first followed by
>>       the generic version.
>>
>> -- reg: offset and length of (1) the register block and (2) the stream buffer.
>> +- reg: Offset and length of (1) the register block and (2) the stream buffer.
>> +       The region for the register block is mandatory.
>> +       The region for the stream buffer is optional, as it is only present on
>> +       R-Car Gen2, RZ/G1, and R-Car H3 and M3-W.
>
>    Did you deliberately omit M3-N for now?

Of course. It's not yet upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
