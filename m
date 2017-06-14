From: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: Re: [PATCH v2] Documentation: clock: address more for clock-cells property
Date: Wed, 14 Jun 2017 18:11:37 +0800
Message-ID: <CAG2=9p-8YtSt50HnXs2xeS53RTEjHdLw9Z09HPSZ9oEOgCi4uQ@mail.gmail.com>
References: <1497432104-22609-1-git-send-email-zhang.chunyan@linaro.org> <CAMuHMdU6ZsqbRhG7=dYE=B_7To=ioWrwWwdoRYGdEQJwB4wW6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU6ZsqbRhG7=dYE=B_7To=ioWrwWwdoRYGdEQJwB4wW6A@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lyra Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 14 June 2017 at 17:42, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Chunyan,
>
> On Wed, Jun 14, 2017 at 11:21 AM, Chunyan Zhang
> <zhang.chunyan@linaro.org> wrote:
>> The value of property 'clock-cells' is not determined only by the number
>> of clock outputs in one clock node, it is determined by whether the clock
>> output in this node can be referenced directly without index. If the
>> output clock has to be referenced by a index, the clock-cell of this
>> clock node can't be defined 0.
>>
>> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/clock/clock-bindings.txt | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> index 2ec489e..e2b76b4 100644
>> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> @@ -18,6 +18,9 @@ Required properties:
>>                    with a single clock output and 1 for nodes with multiple
>>                    clock outputs.
>>
>> +                  There's one exception, please see the description for
>> +                  clock-indices below.
>> +
>>  Optional properties:
>>  clock-output-names: Recommended to be a list of strings of clock output signal
>>                     names indexed by the first cell in the clock specifier.
>> @@ -48,6 +51,13 @@ clock-indices:          If the identifying number for the clocks in the node
>>                    is not linear from zero, then this allows the mapping of
>>                    identifiers into the clock-output-names array.
>>
>> +                  This property not only servers for clocks with multiple
>
> serves

Thanks, I will fix that.

>
>> +                  clock outputs, but also for clocks with a single clock
>> +                  output whose identifying number is not zero.
>
> Why would you want a single clock and a non-zero identifying number?

Because of the probably weird hardwire design :)
There indeed some clocks like that on the platform I'm working on.

>
>> +                  So long as clock-indices is set, clock-cells cannot be
>> +                  set zero.
>
> Gr{oetje,eeting}s,
>
>                         Geert

Thanks for your review,
Chunyan

>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
