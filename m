Return-Path: <helgaas@kernel.org>
Date: Thu, 11 Apr 2019 15:04:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 14/30] PCI: tegra: Set target speed as Gen1 before link up
Message-ID: <20190411200437.GR256045@google.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-15-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-15-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 11, 2019 at 10:33:39PM +0530, Manikanta Maddireddy wrote:
> Some of the legacy PCIe endpoints doesn't enumerate if root port advertises
> both Gen-1 and Gen-2 speeds. Hence, the strategy followed here is to
> initially advertise only Gen-1 and after link is up, retrain link to Gen-2
> speed.
> 
> Following two cards display this behaviour,
>   - Fusion HDTV 5 Express card
>   - IOGear SIL - PCIE - SATA card

This sounds like a Tegra erratum.  If you think this is an issue with
the endpoints above, not with Tegra, we should see issues with these
cards in non-Tegra systems.

If that's the case, we might need a more far-reaching solution that
would fix issues with these cards in all systems.

If it really is a Tegra erratum, that's fine; just own up to it in the
commit log and comment so it's not misleading.

> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 7dc728cc5f51..7e24eac12668 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -670,6 +670,17 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
>  		value |= soc->update_fc_val;
>  		writel(value, port->base + RP_VEND_XP);
>  	}
> +
> +	/*
> +	 * PCIe link doesn't come up with few legacy PCIe endpoints
> +	 * if root port advertises both Gen-1 and Gen-2 speeds.
> +	 * Hence, the strategy followed here is to initially advertise
> +	 * only Gen-1 and after link is up, retrain link to Gen-2 speed
> +	 */
> +	value = readl(port->base + RP_LINK_CONTROL_STATUS_2);
> +	value &= ~PCI_EXP_LNKSTA_CLS;
> +	value |= PCI_EXP_LNKSTA_CLS_2_5GB;
> +	writel(value, port->base + RP_LINK_CONTROL_STATUS_2);
>  }
>  
>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
> -- 
> 2.17.1
> 
