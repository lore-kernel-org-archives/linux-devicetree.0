From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 2/2] x86: of: define irq functions to allow drivers/of/*
 to build on x86
Date: Fri, 10 Sep 2010 20:14:58 +0200
Message-ID: <20100910181458.GA7243@elte.hu>
References: <20100910060151.6613e9c3@debxo>
 <20100910172538.GC11284@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100910172538.GC11284@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Andres Salomon <dilinger@queued.net>, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, Mitch Bradley <wmb@laptop.org>, linux-kernel@vger.kernel.org, Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
List-Id: devicetree@vger.kernel.org


* Grant Likely <grant.likely@secretlab.ca> wrote:

> On Fri, Sep 10, 2010 at 06:01:51AM -0700, Andres Salomon wrote:
> > 
> >  - Define a stub irq_create_of_mapping for x86 as a stop-gap solution until
> >    drivers/of/irq is further along.
> >  - Define irq_dispose_mapping for x86 to appease of_i2c.c
> > 
> > Signed-off-by: Andres Salomon <dilinger@queued.net>
> 
> Applied to my test-devicetree branch.  I'll need an ack from the x86 
> maintainers before I put it into my -next branch.

The purpose of the patch is not clear to me. What does it do and why? 
The changelog says it's a stopgap measure - what exactly is the long 
term plan and how long will it take?

Thanks,

	Ingo
