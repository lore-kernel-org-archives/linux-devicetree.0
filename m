From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: RISC-V local
        interrupt controller docs
Date: Wed, 1 Aug 2018 09:13:07 +0200
Message-ID: <20180801071307.GA20224@lst.de>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-5-hch@lst.de> <20180731223714.GA12168@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180731223714.GA12168@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 04:37:14PM -0600, Rob Herring wrote:
> On Wed, Jul 25, 2018 at 11:36:47AM +0200, Christoph Hellwig wrote:
> > From: Palmer Dabbelt <palmer@dabbelt.com>
> > 
> > This patch adds documentation on the RISC-V local interrupt controller,
> > which is a per-hart interrupt controller that manages all interrupts
> > entering a RISC-V hart.  This interrupt controller is present on all
> > RISC-V systems.
> > 
> > Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> > ---
> >  .../interrupt-controller/riscv,cpu-intc.txt   | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> 
> My questions and comments on the prior version from Palmer remain.

Can you point to these questions please?  I don't even rember when this
was last posted as it must have been a long time ago.
