From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC patch 7/8] genirq: generic chip: Add linear irq domain
	support
Date: Fri, 3 May 2013 23:23:01 +0100
Message-ID: <20130503222300.GF18614@n2100.arm.linux.org.uk>
References: <alpine.LFD.2.02.1305031514230.2886@ionos> <20130503212258.385818955@linutronix.de> <20130503214629.810207749@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130503214629.810207749@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, Gerlando Falauto <gerlando.falauto@keymile.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2013 at 09:50:53PM -0000, Thomas Gleixner wrote:
> +	/* Init mask cache ? */
> +	if (dgc->gc_flags & IRQ_GC_INIT_MASK_CACHE) {
> +		raw_spin_lock_irqsave(&gc->lock, flags);
> +		gc->mask_cache = irq_reg_readl(gc->reg_base + ct->regs.mask);
> +		raw_spin_unlock_irqrestore(&gc->lock, flags);
> +	}

This looks a little weird to me - it seems that it'll re-read this
each time any irq is mapped in the domain, which is probably not
wanted.
