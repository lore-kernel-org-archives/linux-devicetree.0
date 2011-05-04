From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/6] dt: generalize irq_of_create_mapping()
Date: Wed, 4 May 2011 10:05:02 -0600
Message-ID: <20110504160502.GC3317@ponder.secretlab.ca>
References: <20110428192227.8979.49181.stgit@ponder>
 <20110428200203.8979.3569.stgit@ponder>
 <1304387422.2513.301.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1304387422.2513.301.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michal Simek <monstr@monstr.eu>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, hpa@zytor.com, Dirk Brandewie <dirk.brandewie@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, May 03, 2011 at 11:50:22AM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2011-04-28 at 14:02 -0600, Grant Likely wrote:
> > This patch creates a common implementation of irq_of_create_mapping()
> > and factors out the interrupt domain translation code from powerpc to
> > make it available for all architectures.
> 
> I think you are going the wrong way around.
> 
> First thing first, is to make the irq domain / mapping API generic
> without the OF bits.
> 
> IE. move the IRQ domain generically, get rid of irq_map by putting the
> domain ptr & hw numbers in the irq desc/data etc...
> 
> Then you can move over the OF specific bits which are optional and
> orthogonal to a large extent.

As discussed in my other reply, I disagree.  There isn't an immediate
need for the mapping interface in common code.  It would be useful,
sure, for some interrupt controllers, but for many of them
irq_alloc_descs() and an irq_base value is all the functionality that
is needed, and irq_host doesn't gain anything.

The OF translation on the other hand is needed immediately by several
architectures and are very much non-optional in that regard.

g.
