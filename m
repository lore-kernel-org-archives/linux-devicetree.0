From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 6/9] PCI: cadence: Add host driver for Cadence PCIe
 controller
Date: Mon, 8 Jan 2018 16:44:20 -0600
Message-ID: <20180108224420.GC31640@bhelgaas-glaptop.roam.corp.google.com>
References: <cover.1513620412.git.cyrille.pitchen@free-electrons.com>
 <4b2b67ad54e14ee5e1f83af65e9932ce408e82ec.1513620412.git.cyrille.pitchen@free-electrons.com>
 <20171228230111.GB19819@bhelgaas-glaptop.roam.corp.google.com>
 <c34c6480-7297-8756-6bc2-8c8e6a451f0d@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c34c6480-7297-8756-6bc2-8c8e6a451f0d@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@free-electrons.com>
Cc: bhelgaas@google.com, kishon@ti.com, lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org, adouglas@cadence.com, stelford@cadence.com, dgary@cadence.com, kgopi@cadence.com, eandrews@cadence.com, thomas.petazzoni@free-electrons.com, sureshp@cadence.com, nsekhar@ti.com, linux-kernel@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 29, 2017 at 11:08:38PM +0100, Cyrille Pitchen wrote:
> Hi Bjorn,
> 
> Le 29/12/2017 à 00:01, Bjorn Helgaas a écrit :
> > On Mon, Dec 18, 2017 at 07:16:06PM +0100, Cyrille Pitchen wrote:
> >> This patch adds support to the Cadence PCIe controller in host mode.
> >>
> >> The "cadence/" entry in drivers/pci/Makefile is placed after the
> >> "endpoint/" entry so when the next patch introduces a EPC driver for the
> >> Cadence PCIe controller, drivers/pci/cadence/pcie-cadence-ep.o will be
> >> linked after drivers/pci/endpoint/*.o objects, otherwise the built-in
> >> pci-cadence-ep driver would be probed before the PCI endpoint libraries
> >> would have been initialized, which would result in a kernel crash.
> >>
> >> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@free-electrons.com>
> > 
> >> diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> >> index 7284a7f6ad1e..a66ddb347798 100644
> >> --- a/drivers/pci/Makefile
> >> +++ b/drivers/pci/Makefile
> >> @@ -54,5 +54,6 @@ obj-y += host/
> >>  obj-y += switch/
> >>  
> >>  obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
> >> +obj-$(CONFIG_PCI_CADENCE)	+= cadence/
> >>  # PCI dwc controller drivers
> >>  obj-y				+= dwc/
> > 
> > I don't like the fact that the cadence/ rule looks different than the
> > dwc/ rule for no obvious reason.  With some work, the dwc/ rule could
> > maybe be made to look like:
> 
> I've tried to understand why dwc uses obj-y instead of
> obj-$(CONFIG_PCIE_DW), here is what I've found:
> 
> In drivers/pci/dwc/Makefile there is some obj-$(CONFIG_ARM64) rule to
> generate the pcie-hisi.o object like there are other obj-$(CONFIG_ARM64)
> rules in drivers/pci/host/Makefile produce objects like pci-thunder-ecam.o
> for instance.

Right, I missed that pcie-hisi.o rule.  That one needs to be compiled
even if CONFIG_PCI_HISI is not enabled.

It might be useful to have a Makefile comment along the lines of:

  # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW

Bjorn
