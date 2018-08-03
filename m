From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: simplified RISC-V interrupt and clocksource handling v2
Date: Fri, 3 Aug 2018 09:49:20 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808030947480.1841@nanos.tec.linutronix.de>
References: <mhng-1a7030e5-19c4-481b-9f7c-e0976214eb18@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mhng-1a7030e5-19c4-481b-9f7c-e0976214eb18@palmer-si-x1c4>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Christoph Hellwig <hch@lst.de>, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anup@brainfault.org, atish.patra@wdc.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, 2 Aug 2018, Palmer Dabbelt wrote:
> bit of arch/riscv diff here so I don't mind taking it through the RISC-V tree,
> but there's also some irqchip and clocksource stuff as well so I'm not sure if
> that's OK to do.

I have no objections if that goes through the risc-v tree once the DT stuff
is sorted out.

For the clocksource and irqchip bits:

    Acked-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

	tglx
