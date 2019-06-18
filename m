Return-Path: <SRS0=im6u=UR=gmail.com=magnus.damm@kernel.org>
MIME-Version: 1.0
References: <156076216767.4736.16337667537984218274.sendpatchset@octo> <20190618103118.xsgc5fp5d76itdwc@verge.net.au>
In-Reply-To: <20190618103118.xsgc5fp5d76itdwc@verge.net.au>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 18 Jun 2019 21:25:30 +0900
Message-ID: <CANqRtoSVk9hfMFa1EJKO5pa2x5MYfnkYFs4PF-hg8o79ioUS8Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] dt-bindings: timer: renesas, cmt: Various updates
Content-Type: text/plain; charset="UTF-8"
To: Simon Horman <horms@verge.net.au>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 18, 2019 at 7:31 PM Simon Horman <horms@verge.net.au> wrote:
>
> On Mon, Jun 17, 2019 at 06:02:47PM +0900, Magnus Damm wrote:
> > dt-bindings: timer: renesas, cmt: Various updates
> >
> > [PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
> > [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
> > [PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
> > [PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7795
> > [PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77965
> > [PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77990
> > [PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
> > [PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
> >
> > This series collect the following rather trivial DT binding changes:
> > - Add 32-bit CMT0234 and convert CMT1 DT binding on sh73a0 and r8a7740.
> > - Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
> > - Add missing R-Car Gen3 DT bindings for H3, M3-N, E3 an D3.
> > - Update the R-Car Gen3 description to reflect current usage.
> >
> > Please see each individual patch for more information.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Hi Magnus,
>
> I think this series should include the Clocksource maintainers as
> recipients:
>
> Daniel Lezcano <daniel.lezcano@linaro.org>
> Thomas Gleixner <tglx@linutronix.de>
>
> And LKML for good measure.

Will do after a bit more waiting time for potential feedback from
folks with access to Renesas documents. In particular I expected some
opinions about the difference between how the DT compat strings are
handled for CMT1/CMT2/CMT3 on R-Car Gen3 (as described in patch 8)
compared to sh73a0/r8a7740 (as described in patch 1).

I also need to rebase on top of that CMT DT biniding document patch
that covers most of the R-Car Gen3 SoCs.

Cheers,

/ magnus
