From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: dwapb: Add support for 32 interrupts
Date: Tue, 10 Apr 2018 16:29:11 +0200
Message-ID: <CAMuHMdUjYT466uPAHSoAWwQL2KaRUfM1njwpBkHwSK9fbGZTag@mail.gmail.com>
References: <1522246950-9110-1-git-send-email-phil.edworthy@renesas.com>
 <20180409192013.5rytwgoixtyraow3@rob-hp-laptop> <TY1PR01MB1769EC6963CFB3D720D1B9EEF5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <TY1PR01MB17691846E8DFA86DA831B8B9F5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB17691846E8DFA86DA831B8B9F5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Phil,

On Tue, Apr 10, 2018 at 4:23 PM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> On 10 April 2018 07:24 Phil Edworthy wrote:
>> On 09 April 2018 20:20 Rob Herring wrote:
>> > On Wed, Mar 28, 2018 at 03:22:30PM +0100, Phil Edworthy wrote:
> [...]
>> > > +- interrupt-mask : a 32-bit bit mask that specifies which interrupts
>> > > +in the list
>> > > +  of interrupts is valid, bit is 1 for a valid irq.
>> >
>> > This is not a standard property and would need a vendor prefix. However,
>> I'd
>> > prefer you just skip any not connected interrupts with an invalid interrupt
>> > number. Then the GPIO number is the index into "interrupts".
>> Makes sense, I'll rework it to do this.
> Err, what would an invalid interrupt number be?
> If I use -1, I get a DT parsing error and 0 is certainly valid. If the number is
> larger than the valid interrupt range I get errors during probe.

Perhaps using interrupts-extended instead of interrupts?

E.g.

    interrupts-extended = <&intc1 5 1>, <0>, <&intc2 1 0>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
