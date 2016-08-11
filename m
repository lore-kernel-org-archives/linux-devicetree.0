From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: Question about dma-ranges property for PCI host controllers
Date: Thu, 11 Aug 2016 15:00:42 +0000
Message-ID: <HK2PR0601MB1393CA771AB65556D4E2F0B9F51E0@HK2PR0601MB1393.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

A few PCI host controllers use the "dma-ranges" property to specify the
mapping from PCI bus addresses to physical addresses.

In the case of R-Car PCIe Host controllers, the intention was to set this
property as a 1 to 1 mapping for all DDR that could be addressed by the
device. However, there are some limitations for the R-Car controller which
meant that we could only map a subset of the DDR range - this limitation
has prompted us to work on enabling the IOMMU behind the PCI controller.

When there is an IOMMU behind the PCI controller, the "dma-ranges"
property specifies the mapping from PCI bus addresses to an IOVA address.
So should the property map all address space?

Note that this is not actually possible with the R-Car hardware, but I
found that the IOVA address space is outside of the DDR address space
that we were using so had change it.

Thanks
Phil
