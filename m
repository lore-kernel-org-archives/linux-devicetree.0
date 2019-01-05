From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: riscv: cpus: add E51 cores to the list
 of documented CPUs
Date: Fri, 4 Jan 2019 19:10:05 -0600
Message-ID: <CAL_JsqL_M-_L3LdiE9htSCsQt40pXNYMBN+BCKpqB8L-5TDrNg@mail.gmail.com>
References: <20181220210141.GA17198@bogus> <mhng-199961ff-1c6e-41f4-b7e4-66c1bbba15e3@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mhng-199961ff-1c6e-41f4-b7e4-66c1bbba15e3@palmer-si-x1c4>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 4, 2019 at 4:46 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 20 Dec 2018 13:01:41 PST (-0800), robh@kernel.org wrote:
> > On Fri, Dec 14, 2018 at 09:21:50PM -0800, Paul Walmsley wrote:
> >> Add compatible strings for the SiFive E51 family of CPU cores to the
> >> RISC-V CPU compatible string documentation.  The E51 CPU core is
> >> described in:
> >>
> >> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> >>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Palmer Dabbelt <palmer@sifive.com>
> >> Cc: Albert Ou <aou@eecs.berkeley.edu>
> >> Cc: devicetree@vger.kernel.org
> >> Cc: linux-riscv@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> >> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> >> ---
> >>  Documentation/devicetree/bindings/riscv/cpus.txt | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
> >> index adf7b7af5dc3..fb9d4f86f41f 100644
> >> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
> >> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
> >> @@ -68,8 +68,9 @@ described below.
> >>          - compatible:
> >>                  Usage: required
> >>                  Value type: <stringlist>
> >> -                Definition: must contain "riscv", may contain one of
> >> -                            "sifive,rocket0"
> >> +                Definition: must contain "riscv", may contain one or
> >> +                        more of "sifive,rocket0", "sifive,e51",
> >> +                        "sifive,e5"
> >
> > I can't really tell what are valid combinations from this. It reads that
> > I could list every string here and that would be valid. It is basically
> > 'riscv' plus any other combinations of strings.
>
> I think that's actually the correct interpretation: if it's a RISC-V CPU then
> it must have "riscv" listed in compatible, but it can also be anything else.

But is '"sifive,rocket0", "sifive,e51", "sifive,e5", "riscv"' valid?
What about '"sifive,rocket0", "sifive,e5", "riscv"'?

If they are, is there really any value in specifying all of them or
different variations? I'd suggest keeping things simple because
writing a json-schema gets messy when there's arbitrary combinations
of compatible values.

> There's some concrete examples here (a "sifive,e51" is a type of "riscv"), but
> I don't think it's realistic to count on us being able to enumerate all RISC-V
> implementations here.

I think you'll find that "riscv" will become pointless as it is not
specific enough to mean anything. It would be like having "arm" as a
compatible on Arm based systems.

OTOH, you only really need to enumerate what you can't discover. For
example, how are optional features (SIMD inst a common example)
discovered? On Arm, we generally just have the CPU model in the
compatible, but it's generally not even used because that, cpu
revision, instruction set features, etc. are all discoverable.

Rob
