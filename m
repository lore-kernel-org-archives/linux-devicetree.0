From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Sat, 4 Aug 2018 18:40:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808041837130.1658@nanos.tec.linutronix.de>
References: <mhng-f79111da-51d4-483e-86ce-ff0a41c3b5bc@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mhng-f79111da-51d4-483e-86ce-ff0a41c3b5bc@palmer-si-x1c4>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Christoph Hellwig <hch@lst.de>, marc.zyngier@arm.com, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, 3 Aug 2018, Palmer Dabbelt wrote:
> On Wed, 01 Aug 2018 11:55:06 PDT (-0700), tglx@linutronix.de wrote:
> > Is there some high level documentation about the design (or the lack of) or
> > can someone give a concise explanation how this stuff is supposed to work?
> As part of our original push to upstream the arch code it was suggested that
> we move this out to an irqchip driver, but after actually attempting to do
> that it appears that the mechanics of doing so have overshadowed the
> complexity of the actual interrupt handling code, which is only a dozen or so
> instructions.  In retrospect this is just another instance of me not knowing
> what I'm doing, sorry!
> 
> I like Christoph's approach of merging the ISA-mandated interrupt handling
> code back into arch/riscv, as it's much saner that way.  The one big headache
> is that because we special-cased timer interrupts in the ISA they now
> disappear from the standard Linux mechanisms for handling these.
> 
> That said, I'd rather have this warts and all then wait around for something
> perfect, as maintaining a dozen or so out of tree drivers that are tightly
> coupled to the core arch code has proven to be a mess.  If we can get the code
> upstream then everyone will be on the same page so we can work on actually
> improving this, as opposed to just spinning our wheels keeping this big mess
> alive.
> 
> Hopefully that makes some amount of sense...

Thanks for the detailed explanation. It's what I extracted from the
documents to which Christoph pointed me. And as I said in the other thread
it does not realiy make sense to force that low level mechanism into an irq
chip. That would be overkill for no real value.

Thanks,

	tglx
