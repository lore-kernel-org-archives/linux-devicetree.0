Return-Path: <SRS0=g0fX=NE=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1562238AE99ADCB39C05C67A8AF50@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
 <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com> <TY1PR01MB1562238AE99ADCB39C05C67A8AF50@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 24 Oct 2018 12:19:30 +0200
Message-ID: <CAPDyKFox-UPeAeWn8GnGyHibrUk-dp-aWhWMFy1X1GwddebNLg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mmc: tmio_mmc: Add support for RZ/A2
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On 24 October 2018 at 00:28, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, October 23, 2018, Ulf Hansson wrote:
>> On 12 October 2018 at 14:29, Chris Brandt <chris.brandt@renesas.com>
>> wrote:
>> > Basically the same HW block that was used in R-Car Gen 3 is used in
>> > RZ/A2 (with only a couple small differences).
>> >
>> > Not sure if you're going to like the Kconfig change or not.
>> >
>> > Chris Brandt (3):
>> >   clk: renesas: r7s9210: Add SDHI clocks
>> >   mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
>> >   dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
>> >
>> >  Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  3 ++-
>> >  drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
>> >  drivers/mmc/host/Kconfig                           |  5 ++--
>> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28
>> ++++++++++++++++++++--
>> >  4 files changed, 36 insertions(+), 5 deletions(-)
>> >
>> > --
>> > 2.16.1
>>
>> This looks good to me. So unless someone objects I intend to queue
>> this up for 4.21, once 4.20 rc1 is out. Or perhaps the clock patch
>> should go via the clock tree?
>>
>> Thanks!
>> Uffe
>
> FYI,
>
> I just tried to apply my patches to what is in -next.
> It looks likes Fabrizio beat me to it (RZ/G1C has the same controller),
> so there will be conflicts because we were both be modifying the same
> lines in Kconfig and in the driver (adding the compatible strings).
>
> It also looks like Fabrizio started using the name
> "renesas,sdhi-mmc-xxxx" (as in, added the '-mmc'), but I'll probably
> just keep mine the way it is (no '-mmc').
>
>
> So if you don't feel like fixing it up, let me know and I'll send an update.

Please send an update.

Kind regards
Uffe
