From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v5 06/27] irq_domain/powerpc: eliminate irq_map; use
 irq_alloc_desc() instead
Date: Wed, 04 Apr 2012 07:43:42 +1000
Message-ID: <1333489422.3040.11.camel@pasglop>
References: <1329383368-12122-1-git-send-email-grant.likely@secretlab.ca>
	 <1329383368-12122-7-git-send-email-grant.likely@secretlab.ca>
	 <m2iphj3zxr.fsf@igel.home> <m2hax2qeqs.fsf@igel.home>
	 <20120402202848.1EB833E02A7@localhost> <m2y5qdow0v.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <m2y5qdow0v.fsf@igel.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Milton Miller <miltonm@bga.com>, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2012-04-03 at 14:11 +0200, Andreas Schwab wrote:
> 
> When reconfiguring with NR_IRQS=128 interrupts are working again, but I
> still see a lot of spurious interrupts, and the X server is still broken
> (no input works, but I still don't know whether that is an unrelated
> bug). 

I have an idea or two about the spurrious interrupt business, I'll have
a look later today hopefully. As for the X server, I don't think it's
related, but of course it's hard to tell. Do you see a relevant
difference in the X log ?

Cheers,
Ben.
