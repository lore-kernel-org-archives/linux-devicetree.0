From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Tue, 03 Nov 2015 11:43:50 +0100
Message-ID: <4135705.fKCjnZtDgZ@wuerfel>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org> <17979873.Bg2pv5SLy6@wuerfel> <56384623.80305@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56384623.80305@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 03 November 2015 00:29:07 Sinan Kaya wrote:
> On 11/2/2015 3:55 PM, Arnd Bergmann wrote:
> > Are you using message signaled interrupts then?
> > Typically MSI guarantees
> > ordering against DMA, but level or edge triggered interrupts by definition
> > cannot (at least on PCI, but most other buses are the same way), because
> > the DMA master has no insight into when a DMA is actually complete.
> >
> > If you use MSI, please add a comment to the readl_relaxed() that it
> > is safe because of that, otherwise the next person who tries to debug
> > a problem with your driver has to look into this.
> 
> No, using regular GIC SPI interrupts at this moment. I know that HW 
> doesn't use any of the typical AHB/AXI ARM buses.
> 
> I'm familiar with how PCI endpoints works. While the first read in a 
> typical PCI endpoint ISR flushes all outstanding requests traditionally 
> to the destination, this concept does not apply here for this HW.
> 

Ok, got it.

Best add an explanation like the above in the interrupt handler,
to prevent this from accidentally getting 'cleaned up' to use
readl(), or copied into a driver that uses PCI ordering rules
where it is actually wrong.

I think it should be done like this:

- anything that is not performance critical, use normal readl/writel
- in the fast path, add a comment to each readl_relaxed()/writel_relaxed()
  that is safe in this driver but that would not be safe in a PCI
  device
- For the ones that would be safe on PCI as weel, use
  readl_relaxed()/writel_relaxed() without a comment on each one,
  but clarify somewhere that these are all intentional.

	Arnd
