From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/11] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Wed, 8 Aug 2018 18:57:29 +0200
Message-ID: <20180808165729.GA6079@lst.de>
References: <CAL_Jsq+pVzqKUbhErRr15JX2mPUOSTp_ddGvu9KAuf=TtXfduQ@mail.gmail.com> <mhng-4bc89d00-bc90-440f-996f-861dde382aaa@palmer-si-x1c4> <CAL_JsqKPFSQYH3p6a0VoCr-VAzf_98H7N3fNJ+4+DquS8WcjUQ@mail.gmail.com> <20180808150938.GA32274@lst.de> <bb671fe1-6c43-3218-0096-7c5280ffb6b5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bb671fe1-6c43-3218-0096-7c5280ffb6b5@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, atish.patra@wdc.com, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 08, 2018 at 05:47:40PM +0100, Marc Zyngier wrote:
> The original GIC driver deals with 2.5 revisions of the architecture
> (yes, there was something pre-GICv1...), and implementers have been
> creative to the extreme. Still, we could have done without most of these
> compat strings. Hindsight and all that jazz.
> 
> GICv3 is a much more controlled architecture, and although people have
> come up with a number of turds masquerading as implementations, it has
> never been bad enough to mandate a different set of compat strings.
> Also, you cannot describe that kind of stuff in ACPI, and we need to
> support both, so we've come up with different ways of handling this.

So the claim from SiFive is that all their current plic blocks are
the same.  Based on that I'd be really tempted to just match for
sifive,plic (or sifive,plic1 as suggested by them), but also require
each device to actually provide a board specific compatible string,
just in case that something goes wrong.  Which I suspect is what you
are doing with GICv3, right?
