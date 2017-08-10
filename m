From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 00/06] clocksource: sh_cmt: DT binding rework V4
Date: Thu, 10 Aug 2017 11:01:46 +0200
Message-ID: <CAMuHMdX=+HZwOK097HBJ0vWGDpcLQ1dYWSNtb62DSecmvTVz=A@mail.gmail.com>
References: <20160314142342.17180.21352.sendpatchset@little-apple>
 <20161124105843.GA26737@verge.net.au> <20170711115646.GL4517@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170711115646.GL4517@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 11, 2017 at 1:56 PM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, Nov 24, 2016 at 11:58:43AM +0100, Simon Horman wrote:
>> On Mon, Mar 14, 2016 at 11:23:42PM +0900, Magnus Damm wrote:
>> > clocksource: sh_cmt: DT binding rework V4
>> >
>> > [PATCH v4 01/06] devicetree: bindings: Remove sh7372 CMT binding
>> > [PATCH v4 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
>> > [PATCH v4 03/06] devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings
>> > [PATCH v4 04/06] devicetree: bindings: Deprecate property, update example
>> > [PATCH v4 05/06] devicetree: bindings: Remove unused 32-bit CMT bindings
>> > [PATCH v4 06/06] devicetree: bindings: Remove deprecated properties
>> >
>> > Here is the latest and hopefully final take on updating the CMT DT
>> > bindings for R-Car Gen2. In total there are 6 patches that have acks
>> > and are ready to be picked up and merged. Other earlier posted changes
>> > such as driver modification and SoC DTS bits depend on this series.
>>
>> I am wondering what the state of this work is.
>> I see only one minor review comment for this series.
>> It would be great to see it merged.
>
> Ping

Recently, at +1800m, I realized that if we want to continue this work, we
better do it soon, so it can be included in the big R-Car Gen2 flag day
requiring APMU, CPG/MSSR, ICRAM, RST, and SYSC being described in DT.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
