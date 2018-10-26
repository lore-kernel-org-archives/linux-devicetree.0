From: Jiada Wang <jiada_wang@mentor.com>
Subject: Re: [PATCH linux-next v1 3/4] arm64: ulcb: Add avb counter clock
Date: Fri, 26 Oct 2018 11:19:21 +0900
Message-ID: <1aff414d-14d4-9d94-1a42-b58a0ce48230@mentor.com>
References: <20181025072349.15173-1-jiada_wang@mentor.com>
 <20181025072349.15173-4-jiada_wang@mentor.com>
 <CAMuHMdUciu+SJR+CsrwzkdUtX3L82xAzqgtrybYmcq--sR7Wig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUciu+SJR+CsrwzkdUtX3L82xAzqgtrybYmcq--sR7Wig@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert

Thanks for your comment


On 2018/10/26 5:22, Geert Uytterhoeven wrote:
> Hi Jiada,
>
> On Thu, Oct 25, 2018 at 9:24 AM <jiada_wang@mentor.com> wrote:
>> From: Jiada Wang <jiada_wang@mentor.com>
>>
>> Add avb counter clock node to R-Car ULCB boards
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> Thanks for your patch!
>
>> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
>> @@ -32,6 +32,12 @@
>>                  clock-frequency = <12288000>;
>>          };
>>
>> +       clk_avb: avb-clock@ec5a011c {
>> +               compatible = "renesas,clk-avb";
>> +               reg = <0 0xec5a011c 0 0x24>;
>> +               #clock-cells = <1>;
>> +       };
>> +
>>          hdmi0-out {
>>                  compatible = "hdmi-connector";
>>                  type = "a";
> Why would this belong in the board .dtsi, not in the SoC .dtsi?
> (same for salvator-common.dtsi)
right, it belongs to Soc .dtsi, I will move it to each Soc .dtsi
> How is this intended to be used by the AVB?
R-Car audio can use AVB clock to support continuous clock rate,
with out AVB clock, currently only limited rates are supports by R-Car audio

Thanks,
Jiada
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
