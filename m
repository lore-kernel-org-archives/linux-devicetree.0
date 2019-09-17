From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: intel: Add YAML schemas for the
 PCIe RC controller
Date: Tue, 17 Sep 2019 13:33:06 -0500
Message-ID: <20190917183306.GA24684@bogus>
References: <cover.1567585181.git.eswara.kota@linux.intel.com>
 <fe9549470bc06ea0d0dfc80f46a579baa49b911a.1567585181.git.eswara.kota@linux.intel.com>
 <CAFBinCC5SH5OSUqOkLQhE2o7g5OhSuB_PBjsv93U2P=FNS5oPw@mail.gmail.com>
 <20190906091950.GJ2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906091950.GJ2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dilip Kota <eswara.kota@linux.intel.com>, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 06, 2019 at 12:19:50PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 05, 2019 at 10:31:29PM +0200, Martin Blumenstingl wrote:
> > On Wed, Sep 4, 2019 at 12:11 PM Dilip Kota <eswara.kota@linux.intel.com> wrote:
> 
> > > +  phy-names:
> > > +    const: pciephy
> > the most popular choice in Documentation/devicetree/bindings/pci/ is "pcie-phy"
> > if Rob is happy with "pciephy" (which is already part of two other
> > bindings) then I'm happy with "pciephy" as well
> 
> I'm not Rob, though I consider more practical to have a hyphenated variant.

*-names is kind of pointless when there is only one entry and 'foo' in 
the values of 'foo-names' is redundant.

Rob
