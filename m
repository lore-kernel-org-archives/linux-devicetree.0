From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v5 06/27] irq_domain/powerpc: eliminate irq_map; use
 irq_alloc_desc() instead
Date: Tue, 03 Apr 2012 08:33:25 +1000
Message-ID: <1333406005.30734.61.camel@pasglop>
References: <1329383368-12122-1-git-send-email-grant.likely@secretlab.ca>
	 <1329383368-12122-7-git-send-email-grant.likely@secretlab.ca>
	 <m2iphj3zxr.fsf@igel.home> <m2hax2qeqs.fsf@igel.home>
	 <20120402202848.1EB833E02A7@localhost>
	 <20120402215524.GM24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120402215524.GM24211@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Grant Likely <grant.likely@secretlab.ca>, Andreas Schwab <schwab@linux-m68k.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Milton Miller <miltonm@bga.com>, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 2012-04-02 at 22:55 +0100, Russell King - ARM Linux wrote:
> Well, presumably someone is calling irq_set_irq_type() asking explicitly
> for IRQ_TYPE_NONE.  The code will now (as it always used to before David's
> change) do exactly what you ask this to: it will ask the type to be set
> to none.
> 
> If you don't want to set the type to none, don't call the interface asking
> for that to happen. 

I think part of the idea with NONE is to use it as "reset that interrupt
to the "default" setting, whatever that means ...

Cheers,
Ben.
