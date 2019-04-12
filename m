Return-Path: <helgaas@kernel.org>
Date: Fri, 12 Apr 2019 09:35:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 14/30] PCI: tegra: Set target speed as Gen1 before link up
Message-ID: <20190412143551.GD141472@google.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-15-mmaddireddy@nvidia.com>
 <20190411200437.GR256045@google.com>
 <5bf9c119-5f1e-5f41-7c41-b4182cbba3c9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bf9c119-5f1e-5f41-7c41-b4182cbba3c9@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 12, 2019 at 12:14:20PM +0530, Manikanta Maddireddy wrote:
> On 12-Apr-19 1:34 AM, Bjorn Helgaas wrote:
> > On Thu, Apr 11, 2019 at 10:33:39PM +0530, Manikanta Maddireddy wrote:
> >> Some of the legacy PCIe endpoints doesn't enumerate if root port advertises
> >> both Gen-1 and Gen-2 speeds. Hence, the strategy followed here is to
> >> initially advertise only Gen-1 and after link is up, retrain link to Gen-2
> >> speed.
> >>
> >> Following two cards display this behaviour,
> >>   - Fusion HDTV 5 Express card
> >>   - IOGear SIL - PCIE - SATA card
> > This sounds like a Tegra erratum.  If you think this is an issue with
> > the endpoints above, not with Tegra, we should see issues with these
> > cards in non-Tegra systems.
> >
> > If that's the case, we might need a more far-reaching solution that
> > would fix issues with these cards in all systems.
> >
> > If it really is a Tegra erratum, that's fine; just own up to it in the
> > commit log and comment so it's not misleading.
> 
> Based on PCIe LA traces with x86 platform:
>  1) x86 initially advertises Gen1, Gen2 & Gen3 speeds. Link number negotiation does not happen
>  as end point does not lock down to the advertised link number from RP.
>  2) There are multiple entries to detect<->compliance from the both the sides.
>  3) After some time (or some counts of detect entry), x86 only advertises Gen1 speed in TS1
>  4) This time end point responds to the link number in the TS1 and link comes up
> 
> Tegra PCIe IP fails after step-2, it doesn't retry with only Gen1.
> This is the reason for setting link speed to Gen1 and then start
> LTSSM.
> 
> I don't see anything mentioned about advertising lower link speed
> and retrying link up in "Configuration Substate Machine" figure in
> PCIe spec. I am not sure if it is mentioned anywhere in
> implementation notes or left for implementer to decide in PCIe spec.

There's a note in PCIe r4.0, sec 1.2 that says

  Initialization – During hardware initialization, each PCI Express
  Link is set up following a negotiation of Lane widths and frequency
  of operation by the two agents at each end of the Link. No firmware
  or operating system software is involved.

I interpret that as meaning the hardware at each end of the link
should be able to initialize the link without any help from software.

I think the hardware pretty much *has* to be able to do that.
Consider the native PCIe hotplug case: the OS has the generic pciehp
driver, but no knowledge of any device-specific behavior of the
Downstream Port leading to a hot-added device.  I don't *think*
there's anything in the spec about software having to be involved in
initializing the link in that case (correct me if I'm wrong), so the
link has to come up correctly without any OS or firmware intervention.

I'd argue that the same applies to this Tegra root port situation.  If
some issue requires a workaround to bring the link up, you do have the
opportunity to apply the fixup at probe-time.  But if you ever hope to
support hotplug for the root port, I think you'll have trouble because
I don't think there's a hook that lets you apply this fixup at hot-add
time.

> I will update this information in next version of this patch to
> justify why this is required only for Tegra.

> >> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> >> ---
> >>  drivers/pci/controller/pci-tegra.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> >> index 7dc728cc5f51..7e24eac12668 100644
> >> --- a/drivers/pci/controller/pci-tegra.c
> >> +++ b/drivers/pci/controller/pci-tegra.c
> >> @@ -670,6 +670,17 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
> >>  		value |= soc->update_fc_val;
> >>  		writel(value, port->base + RP_VEND_XP);
> >>  	}
> >> +
> >> +	/*
> >> +	 * PCIe link doesn't come up with few legacy PCIe endpoints
> >> +	 * if root port advertises both Gen-1 and Gen-2 speeds.
> >> +	 * Hence, the strategy followed here is to initially advertise
> >> +	 * only Gen-1 and after link is up, retrain link to Gen-2 speed
> >> +	 */
> >> +	value = readl(port->base + RP_LINK_CONTROL_STATUS_2);
> >> +	value &= ~PCI_EXP_LNKSTA_CLS;
> >> +	value |= PCI_EXP_LNKSTA_CLS_2_5GB;
> >> +	writel(value, port->base + RP_LINK_CONTROL_STATUS_2);
> >>  }
> >>  
> >>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
> >> -- 
> >> 2.17.1
> >>
