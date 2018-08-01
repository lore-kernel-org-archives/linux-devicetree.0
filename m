From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] dt-bindings: interrupt-controller: RISC-V PLIC documentation
Date: Wed, 1 Aug 2018 12:26:31 -0600
Message-ID: <CAL_JsqJWOXX7-_sb4W63wPRqFjHuU-DM-LNYgczieWjAE5ABfQ@mail.gmail.com>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-7-hch@lst.de>
 <20180731224630.GB12168@rob-hp-laptop> <20180801071635.GC20224@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801071635.GC20224@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 1, 2018 at 1:12 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jul 31, 2018 at 04:46:30PM -0600, Rob Herring wrote:
> > Perhaps this should be 'sifive,plic0'
>
> Excepet for the fact this the old name has already been in shipping
> hardware and release of qemu and other emulators it should.

Not really my problem that they didn't follow the process and upstream
their binding first. But this alone is just a string identifier, so I
don't really care that much. If things are really a mess, then the
next implementations will have to have better compatible strings. More
likely, I'll just see folks trying to add various properties to deal
with all the differences.

You could always define a better compatible and leave 'riscv,plic0' as
a fallback to avoid breaking things.

> > Normally this would have an SoC specific compatible too. Sometimes we
> > can get away without, but it doesn't seem like the PLIC is very tightly
> > specified nor has common implementations.
>
> It is a giant f***cking mess to be honest.  Adding a highlevel spec
> to the ISA but not a register layout is completely idotic, but if you
> look at the current riscv-sw list this decision is still defended by
> SiFive / the RISC-V foundation.  The whole stale of the RISC-V platform
> Ecosystem is rather pathetic unfortunately, and people don't seem to
> be willing to learn from past good practice nor mistakes in ARM land.

Interrupt controllers are where the differentiation is. ;)

Rob
