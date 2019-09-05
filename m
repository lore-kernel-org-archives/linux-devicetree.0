From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] dwc: PCI: intel: Intel PCIe RC controller driver
Date: Thu, 5 Sep 2019 14:40:16 +0300
Message-ID: <20190905114016.GF2680@smile.fi.intel.com>
References: <cover.1567585181.git.eswara.kota@linux.intel.com>
 <35316bac59d3bc681e76d33e0345f4ef950c4414.1567585181.git.eswara.kota@linux.intel.com>
 <20190905104517.GX9720@e119886-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190905104517.GX9720@e119886-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Murray <andrew.murray@arm.com>
Cc: Dilip Kota <eswara.kota@linux.intel.com>, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, robh@kernel.org, martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 11:45:18AM +0100, Andrew Murray wrote:
> On Wed, Sep 04, 2019 at 06:10:31PM +0800, Dilip Kota wrote:
> > Add support to PCIe RC controller on Intel Universal
> > Gateway SoC. PCIe controller is based of Synopsys
> > Designware pci core.

> > +config PCIE_INTEL_AXI

I think that name here is too generic. Classical x86 seems not using this.

> > +        bool "Intel AHB/AXI PCIe host controller support"
> > +        depends on PCI_MSI
> > +        depends on PCI
> > +        depends on OF
> > +        select PCIE_DW_HOST
> > +        help
> > +          Say 'Y' here to enable support for Intel AHB/AXI PCIe Host
> > +	  controller driver.
> > +	  The Intel PCIe controller is based on the Synopsys Designware
> > +	  pcie core and therefore uses the Designware core functions to
> > +	  implement the driver.

-- 
With Best Regards,
Andy Shevchenko
