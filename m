From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] irq/irq_domain: Quit ignoring error returns from irq_alloc_desc_from().
Date: Fri, 06 Apr 2012 16:56:07 -0700
Message-ID: <20120406235607.DCCD53E15E9@localhost>
References: <1333669933-25267-1-git-send-email-ddaney.cavm@gmail.com> <4F7E64E4.3080509@gmail.com> <4F7F1BDD.4070205@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F7F1BDD.4070205@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: David Daney <ddaney.cavm@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On Fri, 06 Apr 2012 09:37:49 -0700, David Daney <ddaney.cavm@gmail.com> wrote:
> On 04/05/2012 08:37 PM, Rob Herring wrote:
> > On 04/05/2012 06:52 PM, David Daney wrote:
> >> From: David Daney<david.daney@cavium.com>
> >> @@ -380,14 +381,14 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
> >>   	hint = hwirq % irq_virq_count;
> >>   	if (hint == 0)
> >>   		hint++;
> >> -	virq = irq_alloc_desc_from(hint, 0);
> >
> > You are not looking at mainline. hint was removed in later versions, and
> > the referenced commit ids don't exist.
> 
> Please look at Linus' tree before making incorrect statements about 
> whether or not code exists on the 'mainline'

Rob is indeed mistaken here, but please let's keep things civil.  I
did write the patches to remove the hint, but I avoided merging them
because I think they are risky.  I wanted to get the core irq_domain
changes in first.  The removal of hint will be applied during the next
merge window.

I will take your bug fix and get it pushed up to Linus soon.

g.
