From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 06/27] irq_domain/powerpc: eliminate irq_map; use
 irq_alloc_desc() instead
Date: Mon, 2 Apr 2012 22:52:34 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1204022251420.2542@ionos>
References: <1329383368-12122-1-git-send-email-grant.likely@secretlab.ca> <1329383368-12122-7-git-send-email-grant.likely@secretlab.ca> <m2iphj3zxr.fsf@igel.home> <m2hax2qeqs.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <m2hax2qeqs.fsf@igel.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, LAK <linux-arm-kernel@lists.infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller <miltonm@bga.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Mon, 2 Apr 2012, Andreas Schwab wrote:

> Andreas Schwab <schwab@linux-m68k.org> writes:
> 
> > Grant Likely <grant.likely@secretlab.ca> writes:
> >
> >> This patch drops the powerpc-specific irq_map table and replaces it with
> >> directly using the irq_alloc_desc()/irq_free_desc() interfaces for allocating
> >> and freeing irq_desc structures.
> >
> > This breaks irqs on PowerMac G5.  I see lost irq errors from the sata
> > driver.
> 
> When I revert a09b659cd68c10ec6a30cb91ebd2c327fcd5bfe5 ("genirq: Fix
> long-term regression in genirq irq_set_irq_type() handling") on top of
> 3.4-rc1 the sata irq errors disappear, but I see a lot of spurious

Hmm. Which irq chip is handling the interrupt for that sata irq ?

Thanks,

	tglx
