From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] dt-bindings: riscv,cpu-intc: Cleanups from a missed review
Date: Thu, 06 Sep 2018 02:45:02 -0700 (PDT)
Message-ID: <mhng-e7a3701e-b23f-43ac-9daf-03a3eaaca5b1@palmer-si-x1c4>
References: <CABGGisyZ=kuWesNkKRQQATsSf6_aiWTscmW1OANLtTSJAKQ0EA@mail.gmail.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABGGisyZ=kuWesNkKRQQATsSf6_aiWTscmW1OANLtTSJAKQ0EA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: atish.patra@wdc.com, linux-riscv@lists.infradead.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, jason@lakedaemon.net, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, merker@debian.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, 21 Aug 2018 05:59:03 PDT (-0700), robh@kernel.org wrote:
> On Mon, Aug 20, 2018 at 6:10 PM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> On 8/20/18 4:01 PM, Palmer Dabbelt wrote:
>> > I managed to miss one of Rob's code reviews on the mailing list
>> > <http://lists.infradead.org/pipermail/linux-riscv/2018-August/001139.html>.
>> > The patch has already been merged, so I'm submitting a fixup.
>> >
>> > Sorry!
>> >
>> > Fixes: b67bc7cb4088 ("dt-bindings: interrupt-controller: RISC-V local interrupt controller")
>> > Cc: Rob Herring <robh@kernel.org>
>> > Cc: Christoph Hellwig <hch@infradead.org>
>> > Cc: Karsten Merker <merker@debian.org>
>> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> > ---
>> >   .../bindings/interrupt-controller/riscv,cpu-intc.txt       | 14 +++++++++++---
>> >   1 file changed, 11 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
>> > index b0a8af51c388..265b223cd978 100644
>> > --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
>> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
>> > @@ -11,7 +11,7 @@ The RISC-V supervisor ISA manual specifies three interrupt sources that are
>> >   attached to every HLIC: software interrupts, the timer interrupt, and external
>> >   interrupts.  Software interrupts are used to send IPIs between cores.  The
>> >   timer interrupt comes from an architecturally mandated real-time timer that is
>> > -controller via Supervisor Binary Interface (SBI) calls and CSR reads.  External
>> > +controlled via Supervisor Binary Interface (SBI) calls and CSR reads.  External
>> >   interrupts connect all other device interrupts to the HLIC, which are routed
>> >   via the platform-level interrupt controller (PLIC).
>> >
>> > @@ -25,7 +25,15 @@ in the system.
>> >
>> >   Required properties:
>> >   - compatible : "riscv,cpu-intc"
>>
>> Since this is a fix up patch, we should update the compatible string
>> with the sifive specific one as well. no?
>
> I think it is fine as is if my understanding is correct. Given this is
> part of the RISC-V spec(s), then using 'riscv' here for riscv,cpu-intc
> is fine. It was only the PLIC which didn't have any standard
> definition that I had issue with. Plus, with the SoC specific string,
> I'm not too worried about what the fallback is.

I agree.

> However, sifive,fu540-c000-cpu-intc does need to be documented.
> Putting it in the example is not documenting it.

Makes sense.  I wrote up something quickly

    diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
    index 265b223cd978..30c23fba9676 100644
    --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
    +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
    @@ -24,7 +24,14 @@ a PLIC interrupt property will typically list the HLICs for all present HARTs
     in the system.
    
     Required properties:
    -- compatible : "riscv,cpu-intc"
    +- compatible : should be one of
    +        "sifive,fu540-c000-cpu-intc"
    +  and must contain "riscv,cpu-intc".  The intent here is that each
    +  implementation of the standard RISC-V interrupt controller contains a unique
    +  compatible string in addition to the standard string "riscv,cpu-intc".  This
    +  allows the specific implementation of the interrupt controller to be
    +  differentiated from others in case of yet to be discovered
    +  incompatibilities between the extant implementations.
     - #interrupt-cells : should be <1>.  The interrupt sources are defined by the
       RISC-V supervisor ISA manual, with only the following three interrupts being
       defined for supervisor mode:

but it's very much a first pass as I managed to confuse myself while writing 
the documentation.  The central issue here is that the "riscv,cpu-intc" on the 
fu540-c000 is actually provided by our machine-mode firmware, so I'm not sure 
calling this "sifive,fu540-c000-cpu-intc" is actually the right thing to do 
here.  It should really be called something like 
"ENTITY,bbl-cpu-intc-537ae11ae506" -- where that's a git hash of the BBL used, 
and I'm not sure what "ENTITY" should be (bbl is part of the RISC-V GitHub, but 
it's not part of any RISC-V spec).
That naming scheme is a nightmare, though, so I don't want to suggest it :).

There's then the additional wrinkle where, in the current BBL implementation, 
we just use the machine-mode hardware trap delegation mechanism to directly 
provide most of the relevant traps to Linux without actually invoking any 
software.  As a result, that means any as-of-yet undiscovered bugs present in 
that particular hardware path will end up manifesting in Linux.  The trouble 
then is that if we discover one of these bugs we'd want to fix it in the 
machine-mode monitor, so the actual behavior of the interrupt controller that 
Linux sees would end up depending on both the hardware implementation as well 
as the machine-mode monitor's implementation.  The resulting naming scheme 
seems crazy.

Maybe the right thing to do here is to just call this something like

    compatible = "sifive,fu540-c000-cpu-intc-0", "riscv,cpu-intc";

which would result in a patch that looks like

    diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
    index 265b223cd978..36a6a06dcac4 100644
    --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
    +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
    @@ -24,7 +24,17 @@ a PLIC interrupt property will typically list the HLICs for all present HARTs
     in the system.

     Required properties:
    -- compatible : "riscv,cpu-intc"
    +- compatible : should be one of
    +        "sifive,fu540-c000-cpu-intc-0"
    +  and must contain "riscv,cpu-intc".  The intent here is that each
    +  implementation of the standard RISC-V interrupt controller contains a unique
    +  compatible string in addition to the standard string "riscv,cpu-intc".  This
    +  allows the specific implementation of the interrupt controller to be
    +  differentiated from others in case of yet to be discovered
    +  incompatibilities between the extant implementations.  In this case, we
    +  indicate the exact interrupt controller implementation by providing
    +  "fu540-c000" as the hardware implementation's identifier and "0" as the
    +  software implementation's identifier.
     - #interrupt-cells : should be <1>.  The interrupt sources are defined by the
       RISC-V supervisor ISA manual, with only the following three interrupts being
       defined for supervisor mode:
    @@ -46,7 +56,7 @@ An example device tree entry for a HLIC is show below.
     		...
     		cpu1-intc: interrupt-controller {
     			#interrupt-cells = <1>;
    -			compatible = "sifive,fu540-c000-cpu-intc", "riscv,cpu-intc";
    +			compatible = "sifive,fu540-c000-cpu-intc-0", "riscv,cpu-intc";
     			interrupt-controller;
     		};
     	};

With the idea being that at least we can figure out if we end up with a bug 
that can be worked around in software.

> Rob

Thanks for all the help!
