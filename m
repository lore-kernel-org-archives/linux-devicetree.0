From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] of: Fix locking vs. interrupts
Date: Wed, 12 Jun 2013 10:25:56 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1306121023150.22970@ionos>
References: <1371015544.8250.182.camel@pasglop>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1371015544.8250.182.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: David Miller <davem@davemloft.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Jun 2013, Benjamin Herrenschmidt wrote:

> The OF code uses irqsafe locks everywhere except in a handful of functions
> for no obvious reasons. Since the conversion from the old rwlocks, this
> now triggers lockdep warnings when used at interrupt time. At least one
> driver (ibmvscsi) seems to be doing that from softirq context.
> 
> This converts the few non-irqsafe locks into irqsafe ones, making them
> consistent with the rest of the code.

Fun. https://lkml.org/lkml/2013/2/4/416 seems to have got lost 
 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> CC: <stable@vger.kernel.org> [v3.9+]

Acked-by: Thomas Gleixner <tglx@linutronix.de>

> ---
> 
> Note: It's silly to access the device-tree at interrupt time in most cases,
> and we should probably fix ibmvscsi, but for the time being, let's fix the

Right.

> obvious bug. Thomas, this can probably still go into 3.10... If not, I've
> CCed stable.

Should go through Grant I think.

Thanks,

	tglx
