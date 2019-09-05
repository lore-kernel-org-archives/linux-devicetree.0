From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 2/2] dwc: PCI: intel: Intel PCIe RC controller driver
Date: Thu, 5 Sep 2019 04:26:10 -0700
Message-ID: <20190905112610.GB10199@infradead.org>
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
Cc: Dilip Kota <eswara.kota@linux.intel.com>, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, robh@kernel.org, martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 11:45:18AM +0100, Andrew Murray wrote:
> > +        depends on OF
> > +        select PCIE_DW_HOST
> > +        help
> > +          Say 'Y' here to enable support for Intel AHB/AXI PCIe Host
> > +	  controller driver.
> > +	  The Intel PCIe controller is based on the Synopsys Designware
> > +	  pcie core and therefore uses the Designware core functions to
> > +	  implement the driver.
> 
> I can see this description is similar to others in the same Kconfig,
> however I'm not sure what value a user gains by knowing implementation
> details - it's helpful to know that PCIE_INTEL_AXI is based on the
> Designware core, but is it helpful to know that the Designware core
> functions are used?

Not really.  What would be extremely useful for a user is what Intel
SOC contains this IP block, or the fact that most of those were
actually produced by Lantiq, a company bought by Intel.
