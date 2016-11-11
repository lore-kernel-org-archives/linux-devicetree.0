From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Subject: Re: [PATCH] of/irq: improve error message on irq discovery process
 failure
Date: Sat, 12 Nov 2016 06:12:27 +1100
Message-ID: <1478891547.2592.13.camel@au1.ibm.com>
References: <1478700308-25481-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
         <20161109190457.GC837@leverpostej> <1478813443.2592.2.camel@au1.ibm.com>
         <20161111163241.GL11945@leverpostej>
Reply-To: benh@au1.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20161111163241.GL11945@leverpostej>
Sender: linux-pci-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, marc.zyngier@arm.com, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, 2016-11-11 at 16:32 +0000, Mark Rutland wrote:
> On Fri, Nov 11, 2016 at 08:30:43AM +1100, Benjamin Herrenschmidt
> wrote:
> > 
> > On Wed, 2016-11-09 at 19:04 +0000, Mark Rutland wrote:
> > > 
> > > 
> > > If we don't have an interrupt-map on a PCI controller, why don't
> > > we
> > > instead log a message regarding that being missing, and give up
> > > early?
> > 
> > Why ? It's legit to not support LSIs.
> 
> Sure; I had envisioned a message like:
> 
> 	pr_info("%s: no interrupt-map, INTx interrupts not possible\n",
> 		pci_controller_name);
> 
> ... Which tells the user exaclty what we know, and doesn't imply
> either
> an error or the actual absence of HW support.

Works for me.

Cheers,
Ben.
