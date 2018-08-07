From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/11] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Tue, 7 Aug 2018 09:20:34 +0200
Message-ID: <20180807072034.GA569@lst.de>
References: <20180802115008.4031-1-hch@lst.de> <20180802115008.4031-4-hch@lst.de> <0093fadc-a150-3745-e73d-e579bfdfabfb@wdc.com> <CAL_Jsq+pVzqKUbhErRr15JX2mPUOSTp_ddGvu9KAuf=TtXfduQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+pVzqKUbhErRr15JX2mPUOSTp_ddGvu9KAuf=TtXfduQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: atish.patra@wdc.com, Christoph Hellwig <hch@lst.de>, Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 06, 2018 at 02:59:48PM -0600, Rob Herring wrote:
> > > +Required properties:
> > > +- compatible : "sifive,plic0"
> > > +- #address-cells : should be <0>
> > > +- #interrupt-cells : should be <1>
> > > +- interrupt-controller : Identifies the node as an interrupt controller
> > > +- reg : Should contain 1 register range (address and length)
> >
> > The one in the real device tree has two entries.
> > reg = <0x00000000 0x0c000000 0x00000000 0x04000000>;
> >
> > Is it intentional or just incorrect entry left over from earlier days?
> 
> > > +             reg = <0xc000000 0x4000000>;
> 
> Looks to me like one has #size-cells and #address-cells set to 2 and
> the example is using 1.

Yes.  And it seems like the real life device tree is simply bogus.
