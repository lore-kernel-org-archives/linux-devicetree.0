From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 13/36] dt-bindings: arm: Convert PMU binding to json-schema
Date: Thu, 1 Nov 2018 14:32:14 -0500
Message-ID: <CAL_JsqJh08wZCyGxg7HMbtKjOJTZKMoQcNOB_hPuSfJKQQK8JA@mail.gmail.com>
References: <20181005165848.3474-1-robh@kernel.org> <20181005165848.3474-14-robh@kernel.org>
 <20181009115713.GE6248@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009115713.GE6248@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <glikely@secretlab.ca>, Kumar Gala <kumar.gala@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Cameron <jic23@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 9, 2018 at 6:57 AM Will Deacon <will.deacon@arm.com> wrote:
>
> Hi Rob,
>
> On Fri, Oct 05, 2018 at 11:58:25AM -0500, Rob Herring wrote:
> > Convert ARM PMU binding to DT schema format using json-schema.
> >
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/pmu.txt | 70 --------------
> >  .../devicetree/bindings/arm/pmu.yaml          | 96 +++++++++++++++++++
> >  2 files changed, 96 insertions(+), 70 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/pmu.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/pmu.yaml
>
> [...]
>
> > -- interrupts : 1 combined interrupt or 1 per core. If the interrupt is a per-cpu
> > -               interrupt (PPI) then 1 interrupt should be specified.
>
> [...]
>
> > +  interrupts:
> > +    oneOf:
> > +      - maxItems: 1
> > +      - minItems: 2
> > +        maxItems: 8
> > +        description: 1 interrupt per core.
> > +
> > +  interrupts-extended:
> > +    $ref: '#/properties/interrupts'
>
> This seems like a semantic different between the two representations, or am
> I missing something here? Specifically, both the introduction of
> interrupts-extended and also dropping any mention of using a single per-cpu
> interrupt (the single combined case is no longer support by Linux; not sure
> if you want to keep it in the binding).

In regards to no support for the single combined interrupt, it looks
like Marvell Armada SoCs at least (armada-375 is what I'm looking at)
have only a single interrupt. Though the interrupt gets routed to MPIC
which then has a GIC PPI. So it isn't supported or happens to work
still since it is a PPI?

Rob
