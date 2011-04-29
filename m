From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/6] General device tree irq domain infrastructure
Date: Fri, 29 Apr 2011 18:16:33 +0200
Message-ID: <4DBAE461.7000307@linutronix.de>
References: <20110428192227.8979.49181.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110428192227.8979.49181.stgit@ponder>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Michal Simek <monstr@monstr.eu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, hpa@zytor.com, Dirk Brandewie <dirk.brandewie@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> I'd really like to get patches 1-4 merged into 2.6.40.  Please test.
> I'm also running through build testing here, and when it's complete
> I'll push it out to a 'devicetree/irq-domain' branch on
> git://git.secretlab.ca/git/linux-2.6

I pulled this, built and booted my x86-dt box and nothing exploded so far.

If you merge Linus' tree then you will get a conflict (sooner or later) in
ioapic_of_irq_map() in arch/x86/kernel/devicetree.c:

-       return io_apic_setup_irq_pin_once(*out_hwirq, cpu_to_node(0), &attr);
  -      if (io_apic_setup_irq_pin(hwirq, cpu_to_node(0), &attr))
++      if (io_apic_setup_irq_pin_once(hwirq, cpu_to_node(0), &attr))

Sebastian
