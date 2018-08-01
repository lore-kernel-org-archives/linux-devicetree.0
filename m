From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/6] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Wed, 1 Aug 2018 09:16:35 +0200
Message-ID: <20180801071635.GC20224@lst.de>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-7-hch@lst.de> <20180731224630.GB12168@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180731224630.GB12168@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 04:46:30PM -0600, Rob Herring wrote:
> Perhaps this should be 'sifive,plic0'

Excepet for the fact this the old name has already been in shipping
hardware and release of qemu and other emulators it should.

> Normally this would have an SoC specific compatible too. Sometimes we 
> can get away without, but it doesn't seem like the PLIC is very tightly 
> specified nor has common implementations.

It is a giant f***cking mess to be honest.  Adding a highlevel spec
to the ISA but not a register layout is completely idotic, but if you
look at the current riscv-sw list this decision is still defended by
SiFive / the RISC-V foundation.  The whole stale of the RISC-V platform
Ecosystem is rather pathetic unfortunately, and people don't seem to
be willing to learn from past good practice nor mistakes in ARM land.
