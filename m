Return-Path: <SRS0=TzPi=FY=linaro.org=shawn.guo@kernel.org>
Date: Fri, 2 Mar 2018 20:36:18 +0800
From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] PCI: histb: add power control GPIO for PCIe slot
Message-ID: <20180302123616.GE28619@dragon>
References: <1516669477-20151-1-git-send-email-shawn.guo@linaro.org>
 <20180302120959.GA13205@e107981-ln.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180302120959.GA13205@e107981-ln.cambridge.arm.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, project-aspen-dev@linaro.org, Jianguo Sun <sunjianguo1@huawei.com>
List-ID: <devicetree@vger.kernel.org>

Hi Lorenzo,

On Fri, Mar 02, 2018 at 12:10:00PM +0000, Lorenzo Pieralisi wrote:
> Hi Shawn,
> 
> On Tue, Jan 23, 2018 at 09:04:37AM +0800, Shawn Guo wrote:
> > From: Jianguo Sun <sunjianguo1@huawei.com>
> > 
> > Besides the GPIO for controlling reset, there is also possibly another
> > GPIO for turning on/off the power of PCIe slot.  Let's add the support
> > for that with another optional device tree property 'power-gpios'.
> > 
> > Signed-off-by: Jianguo Sun <sunjianguo1@huawei.com>
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  .../bindings/pci/hisilicon-histb-pcie.txt          |  1 +
> >  drivers/pci/dwc/pcie-histb.c                       | 28 +++++++++++++++++++---
> 
> Is there a dependency between this patch and this series:
> 
> https://patchwork.ozlabs.org/project/linux-pci/list/?series=31410
> 
> It does not look like, I'd apply the series but I wanted to ask
> first.

This is the v1 of the same series.  Please ignore this one, and only
review the latest v3.  Sorry for the confusion.

Shawn
