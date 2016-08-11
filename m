From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Question about dma-ranges property for PCI host controllers
Date: Thu, 11 Aug 2016 17:09:23 +0200
Message-ID: <2867793.PfGZpZFyEJ@wuerfel>
References: <HK2PR0601MB1393CA771AB65556D4E2F0B9F51E0@HK2PR0601MB1393.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <HK2PR0601MB1393CA771AB65556D4E2F0B9F51E0@HK2PR0601MB1393.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday, August 11, 2016 3:00:42 PM CEST Phil Edworthy wrote:
> Hi,
> 
> A few PCI host controllers use the "dma-ranges" property to specify the
> mapping from PCI bus addresses to physical addresses.
> 
> In the case of R-Car PCIe Host controllers, the intention was to set this
> property as a 1 to 1 mapping for all DDR that could be addressed by the
> device. However, there are some limitations for the R-Car controller which
> meant that we could only map a subset of the DDR range - this limitation
> has prompted us to work on enabling the IOMMU behind the PCI controller.
> 
> When there is an IOMMU behind the PCI controller, the "dma-ranges"
> property specifies the mapping from PCI bus addresses to an IOVA address.
> So should the property map all address space?
> 
> Note that this is not actually possible with the R-Car hardware, but I
> found that the IOVA address space is outside of the DDR address space
> that we were using so had change it.

It's a bit tricky: the dma-ranges properties are walked recursively,
and a PCI bus may be behind a few other bridges that each have a
nontrivial mapping, and the IOMMU may not be on the address space that
the PCI host sees.

In the past, we have said that the dma-ranges property should reflect
the address space that is used when programming the bridge registers
in the PCI host bridge itself.

I think we have also made the assumption that a PCI host bridge
with an IOMMU uses a flat 32-bit DMA address space that goes through
the IOMMU (possibly a separate address space per PCI function,
depending on the type of IOMMU).

One corner case that doesn't really fit in that model is a PCI host
bridge that requires the bridge register to be programmed in a special
way for the IOMMU to work (e.g. away from the RAM to the address that
is routed to the IOMMU).

Another tricky case is a PCI host that uses the IOMMU only for 32-bit
DMA masters but that does have a dma-ranges property that can be
used for direct mapping of all RAM through a nonzero offset that
gets set up according to dma-ranges.

Can you be more specific which of those cases you actually have here?

	Arnd
