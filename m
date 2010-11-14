From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 3/3] x86: OLPC: speed up device tree creation during boot
 (v2)
Date: Sun, 14 Nov 2010 10:50:13 +0100
Message-ID: <20101114095013.GB24206@elte.hu>
References: <20101111214546.4e573cad@queued.net>
 <reply-olpc-3-v2@mdm.bga.com>
 <20101112002704.50c629e2@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101112002704.50c629e2@queued.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: Milton Miller <miltonm@bga.com>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


* Andres Salomon <dilinger@queued.net> wrote:

> On Fri, 12 Nov 2010 01:48:30 -0600
> Milton Miller <miltonm@bga.com> wrote:
> 
> > On Thu, 11 Nov 2010 around 21:45:46 -0800, Andres Salomon wrote:
> > > diff --git a/arch/x86/platform/olpc/olpc_dt.c
> > > b/arch/x86/platform/olpc/olpc_dt.c index b8c8ff9..0ab824d 100644
> > > --- a/arch/x86/platform/olpc/olpc_dt.c
> > > +++ b/arch/x86/platform/olpc/olpc_dt.c
> > > @@ -126,14 +126,31 @@  static unsigned int prom_early_allocated
> > > __initdata; 
> > >  void * __init prom_early_alloc(unsigned long size)
> > >  {
> > > +	static u8 *mem = NULL;
> > > +	static size_t free_mem = 0;
> > 
> > Static variables are implicitly 0 and NULL
> 
> That's true for global static variables; is it also true for static
> variables that are local to a function?

It is the same allocation and initialization wise - just not visible to functions 
outside this one.

It's being frowned upon btw, because it's easy to overlook (and for other reasons) - 
please dont use statics inside functions - please put them in front of the function 
or further up into file scope.

	Ingo
