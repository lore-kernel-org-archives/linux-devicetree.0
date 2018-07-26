From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Thu, 26 Jul 2018 10:27:06 +0200
Message-ID: <20180726082706.GA22868@lst.de>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-4-hch@lst.de> <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com> <20180725112457.GA24502@lst.de> <CAAhSdy31=D3jOgvrc+Td-TeKQMazPA-suFjOy9XwEuima1WdeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAhSdy31=D3jOgvrc+Td-TeKQMazPA-suFjOy9XwEuima1WdeA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup@brainfault.org>
Cc: Christoph Hellwig <hch@lst.de>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, palmer@sifive.com, jason@lakedaemon.net, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 09:08:00AM +0530, Anup Patel wrote:
> Actually, RISCV HLIC and PLIC are very similar to RPi2 and RPi3 SOCs.
> 
> On RPi2 and RPi3, we have per-CPU BCM2836 local intc and the global
> interrupts are managed using BCM2835 intc. You should certainly have
> a look a this drivers because these very simple compared to GICv2 and
> GICv3 drivers.

Yes, using that model makes writing the per-cpu irq controller driver
trivial.  But retrofitting it into the device tree, where the existing
bootloader (bbl) assumes the old DT layout is a giant pain in the neck.

At the same time I'm still not conveninced RISC-V really needs a full
irqchip driver for the per-cpu interrupt 'controller' really is nothing
but 1 and a half architectural control registers:

  - the scause register that contains the reason for an exception
    (any exception including syscalls and page faults) for the entry
    into supervisor mode.  This includes a bit to indicate interrupts,
    and then logical interrupt reason, out of which only three are
    interesting for supervisor mode (timer, software, external)
  - the sie register that allows to to enable/disable each of the above
    causes individually

So after burning out on DT hacking (never mind retrofitting that into
actual shipping SOCs vs just qemu) I'm going to try a version that
doesn't add an irqchip for this but just handles it hardcoded in
RISC-V do_IRQ.  I'll still keep the irqchip for the PLIC, which while
specificed in the RISC-V spec isn't architectural but an actual
periphal.
