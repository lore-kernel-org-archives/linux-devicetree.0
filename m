From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH TIP 03/14] x86/dtb: Add a device tree for CE4100
Date: Thu, 3 Feb 2011 13:59:28 -0700
Message-ID: <20110203205928.GH6180@angua.secretlab.ca>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
 <1295843342-1122-4-git-send-email-bigeasy@linutronix.de>
 <20110127050027.GB23443@yookeroo>
 <20110127091147.GA9770@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110127091147.GA9770@www.tglx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, sodaville@linutronix.de, devicetree-discuss@lists.ozlabs.org, x86@kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 27, 2011 at 02:41:47PM +0530, Sebastian Andrzej Siewior wrote:
> * David Gibson | 2011-01-27 15:00:27 [+1000]:
> >> +					>;
> >> +
> >> +				i2c-controller@15a00,0,0 {
> >
> >Uh.. that unit address does not look right.  The encoding of PCI
> >3-cell addresses into a unit address string is not simply comma
> >separated cells.  I forget the details, so you'll need to check the OF
> >PCI binding.
> 
> Grant wrote [0]:
> |You'll also note that I added ',0,0' to the end of the address.
> |That's because the node address reflects the parent bus address format
> |which uses 3 cells in this case.

It is quite possible I was mistaken on this point.  The PCI binding is
not my area of strength.

g.
