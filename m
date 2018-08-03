From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/11] irqchip: add a SiFive PLIC driver
Date: Fri, 3 Aug 2018 14:29:58 +0200
Message-ID: <20180803122958.GA18301@lst.de>
References: <20180802115008.4031-1-hch@lst.de> <20180802115008.4031-11-hch@lst.de> <2416469e-c39e-6481-f5e0-ad191b858d06@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2416469e-c39e-6481-f5e0-ad191b858d06@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "anup@brainfault.org" <anup@brainfault.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2018 at 04:13:26PM -0700, Atish Patra wrote:
>> + * which device 0 is defined as non-existant by the RISC-V Priviledged Spec.
> /s/existant/existent
>
> /s/Priviledged/Privileged
>> + * Each hart context has a vector of interupt enable bits associated with it.
> /s/interupt/interrupt

All fixed.

>> +	WARN_ON_ONCE(!handler->present);
>> +
>> +	csr_clear(sie, SIE_STIE);
>
> We should clear the SIE_SEIE not SIE_STIE. Correct ?

Yes, fixed.

>> +	if (plic_regs) {
>> +		pr_warning("PLIC already present.\n");
>
> Got a check-patch warning.
>
> WARNING: Prefer pr_warn(... to pr_warning(...
> #257: FILE: drivers/irqchip/irq-sifive-plic.c:191:
> +               pr_warning("PLIC already present.\n");

Fixed.

>> +
>> +		if (of_irq_parse_one(node, i, &parent)) {
>> +			pr_err("failed to parse parent for contxt %d.\n", i);
> /s/contxt/context

Fixed.

>> +			continue;
>> +		}
>> +
>> +		/* skip context holes */
>> +		if (parent.args[0] == -1)
>> +			continue;
>> +
>> +		cpu = plic_find_hart_id(parent.np->parent);
>
> Since plic_find_hart_id() is going to walk up the DT, we can pass only 
> parent.np instead of parent.np->parent. It does not increase any efficiency 
> either way. So not very necessary. Just thought of taking the advantage of 
> plic_find_hart_id.

Yeah, I'll update this.

Thanks for the review!
