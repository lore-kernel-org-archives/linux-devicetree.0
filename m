From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] x86: of: define irq functions to allow drivers/of/*
 to build on x86
Date: Tue, 21 Sep 2010 11:43:47 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1009211141040.2416@localhost6.localdomain6>
References: <20100910060151.6613e9c3@debxo> <20100910172538.GC11284@angua.secretlab.ca> <20100910181458.GA7243@elte.hu> <20100910182135.GG11284@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100910182135.GG11284@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Ingo Molnar <mingo@elte.hu>, Andres Salomon <dilinger@queued.net>, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, mingo@redhat.com, hpa@zytor.com, Mitch Bradley <wmb@laptop.org>, linux-kernel@vger.kernel.org, Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, 10 Sep 2010, Grant Likely wrote:

> On Fri, Sep 10, 2010 at 08:14:58PM +0200, Ingo Molnar wrote:
> > 
> > * Grant Likely <grant.likely@secretlab.ca> wrote:
> > 
> > > On Fri, Sep 10, 2010 at 06:01:51AM -0700, Andres Salomon wrote:
> > > > 
> > > >  - Define a stub irq_create_of_mapping for x86 as a stop-gap solution until
> > > >    drivers/of/irq is further along.
> > > >  - Define irq_dispose_mapping for x86 to appease of_i2c.c
> > > > 
> > > > Signed-off-by: Andres Salomon <dilinger@queued.net>
> > > 
> > > Applied to my test-devicetree branch.  I'll need an ack from the x86 
> > > maintainers before I put it into my -next branch.
> > 
> > The purpose of the patch is not clear to me. What does it do and why? 
> 
> It allows CONFIG_OF to be enabled on x86 without a build failure.
> 
> > The changelog says it's a stopgap measure - what exactly is the long 
> > term plan and how long will it take?
> 
> It is a stop gap because it performs a trivial direct map of an IRQ
> number in the device tree data structure to a Linux irq number.  This
> works for a single IRQ controller, but falls apart when cascaded
> controller are described in the device tree.  The long term plan is to
> have the drivers/of/ code handling the mapping intelligently like
> powerpc currently does.

Sounds good. We need this for other embedded x86 platforms as well and
I was looking into the powerpc code before and wondered how we can
make that generic. The question is whether this should be tied into
drivers/of/irq or just provided as an OF independent generic facility
in kernel/irq.

Thanks,

	tglx
