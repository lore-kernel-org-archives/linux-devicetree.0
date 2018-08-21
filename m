From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: riscv,cpu-intc: Cleanups from a missed review
Date: Tue, 21 Aug 2018 07:59:03 -0500
Message-ID: <CABGGisyZ=kuWesNkKRQQATsSf6_aiWTscmW1OANLtTSJAKQ0EA@mail.gmail.com>
References: <20180820230011.25368-1-palmer@sifive.com> <51924de4-4a16-07a0-f499-753e0df49678@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51924de4-4a16-07a0-f499-753e0df49678@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: atish.patra@wdc.com
Cc: palmer@sifive.com, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, hch@infradead.org, merker@debian.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 20, 2018 at 6:10 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 8/20/18 4:01 PM, Palmer Dabbelt wrote:
> > I managed to miss one of Rob's code reviews on the mailing list
> > <http://lists.infradead.org/pipermail/linux-riscv/2018-August/001139.html>.
> > The patch has already been merged, so I'm submitting a fixup.
> >
> > Sorry!
> >
> > Fixes: b67bc7cb4088 ("dt-bindings: interrupt-controller: RISC-V local interrupt controller")
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Christoph Hellwig <hch@infradead.org>
> > Cc: Karsten Merker <merker@debian.org>
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > ---
> >   .../bindings/interrupt-controller/riscv,cpu-intc.txt       | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> > index b0a8af51c388..265b223cd978 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> > @@ -11,7 +11,7 @@ The RISC-V supervisor ISA manual specifies three interrupt sources that are
> >   attached to every HLIC: software interrupts, the timer interrupt, and external
> >   interrupts.  Software interrupts are used to send IPIs between cores.  The
> >   timer interrupt comes from an architecturally mandated real-time timer that is
> > -controller via Supervisor Binary Interface (SBI) calls and CSR reads.  External
> > +controlled via Supervisor Binary Interface (SBI) calls and CSR reads.  External
> >   interrupts connect all other device interrupts to the HLIC, which are routed
> >   via the platform-level interrupt controller (PLIC).
> >
> > @@ -25,7 +25,15 @@ in the system.
> >
> >   Required properties:
> >   - compatible : "riscv,cpu-intc"
>
> Since this is a fix up patch, we should update the compatible string
> with the sifive specific one as well. no?

I think it is fine as is if my understanding is correct. Given this is
part of the RISC-V spec(s), then using 'riscv' here for riscv,cpu-intc
is fine. It was only the PLIC which didn't have any standard
definition that I had issue with. Plus, with the SoC specific string,
I'm not too worried about what the fallback is.

However, sifive,fu540-c000-cpu-intc does need to be documented.
Putting it in the example is not documenting it.

Rob
