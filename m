From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/8] clk: vc5: Add bindings for IDT VersaClock 5P49V6901
Date: Thu, 29 Jun 2017 18:27:30 +0200
Message-ID: <CAMuHMdVB_XXSy7gynkfjBrPKa0EqAg=aCQD_U72AG7NQ+pw9hQ@mail.gmail.com>
References: <20170629101851.23972-1-marek.vasut@gmail.com> <20170629101851.23972-7-marek.vasut@gmail.com>
 <CAMuHMdXaEDtKwZYDaZ0qUvUk_0WuZwf6ky+nfeahQuU7q4qiyQ@mail.gmail.com> <1a65c823-d39f-1824-886d-d32fddcee4f0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1a65c823-d39f-1824-886d-d32fddcee4f0@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Alexey Firago <alexey_firago@mentor.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Thu, Jun 29, 2017 at 5:49 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 06/29/2017 01:38 PM, Geert Uytterhoeven wrote:
>> On Thu, Jun 29, 2017 at 12:18 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>
>>> IDT VersaClock 6 5P49V6901 has 4 clock outputs, 4 fractional dividers.
>>> Input clock source can be taken from either external crystal or from
>>> external reference clock.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

>>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
>>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
>>
>> Probably you want to sprinkle the first few lines of the document with
>> a few "VersaClock 6" references?
>
> Something like this?
>
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> @@ -1,7 +1,7 @@
> -Binding for IDT VersaClock5 programmable i2c clock generator.
> +Binding for IDT VersaClock 5,6 programmable i2c clock generators.
>
> -The IDT VersaClock5 are programmable i2c clock generators providing
> -from 3 to 12 output clocks.
> +The IDT VersaClock 5 and VersaClock 6 are programmable i2c clock
> +generators providing from 3 to 12 output clocks.
>
>  ==I2C device node==

Exactly. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
