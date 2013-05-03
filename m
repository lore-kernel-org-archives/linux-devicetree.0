From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC patch 4/8] genirq: generic chip: Cache per irq bit mask
Date: Sat, 4 May 2013 00:39:15 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1305040038510.2990@ionos>
References: <alpine.LFD.2.02.1305031514230.2886@ionos> <20130503212258.385818955@linutronix.de> <20130503214629.599155322@linutronix.de> <20130503222406.GG18614@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130503222406.GG18614@n2100.arm.linux.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, Gerlando Falauto <gerlando.falauto@keymile.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 3 May 2013, Russell King - ARM Linux wrote:

> On Fri, May 03, 2013 at 09:50:50PM -0000, Thomas Gleixner wrote:
> > -	u32 mask = ~(1 << (d->irq - gc->irq_base));
> > +	u32 mask = ~(d->mask);
> 
> I suspect the above changes are all a result of a search-and-replace
> which results in the cosmetic parens remaining.  Would be nice to get
> rid of them too as they're completely unnecessary.

Fair enough.

Thanks,

	tglx 
