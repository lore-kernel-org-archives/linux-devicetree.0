From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v4 7/7] PCI: dwc: Add validation that PCIe core is set to
 correct mode
Date: Thu, 22 Aug 2019 12:13:16 +0100
Message-ID: <20190822111315.GN23903@e119886-lin.cambridge.arm.com>
References: <20190821153545.17635-1-jonnyc@amazon.com>
 <20190821154745.31834-3-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821154745.31834-3-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 06:47:45PM +0300, Jonathan Chocron wrote:
> Some PCIe controllers can be set to either Host or EP according to some
> early boot FW. To make sure there is no discrepancy (e.g. FW configured
> the port to EP mode while the DT specifies it as a host bridge or vice
> versa), a check has been added for each mode.
> 
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c   | 8 ++++++++
>  drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 2bf5a35c0570..00e59a134b93 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -531,6 +531,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	int ret;
>  	u32 reg;
>  	void *addr;
> +	u8 hdr_type;
>  	unsigned int nbars;
>  	unsigned int offset;
>  	struct pci_epc *epc;
> @@ -543,6 +544,13 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		return -EINVAL;
>  	}
>  
> +	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE);
> +	if (hdr_type != PCI_HEADER_TYPE_NORMAL) {
> +		dev_err(pci->dev, "PCIe controller is not set to EP mode (hdr_type:0x%x)!\n",
> +			hdr_type);
> +		return -EIO;
> +	}
> +
>  	ret = of_property_read_u32(np, "num-ib-windows", &ep->num_ib_windows);
>  	if (ret < 0) {
>  		dev_err(dev, "Unable to read *num-ib-windows* property\n");
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index f93252d0da5b..d2ca748e4c85 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -323,6 +323,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>  	struct pci_bus *child;
>  	struct pci_host_bridge *bridge;
>  	struct resource *cfg_res;
> +	u8 hdr_type;
>  	int ret;
>  
>  	raw_spin_lock_init(&pci->pp.lock);
> @@ -396,6 +397,13 @@ int dw_pcie_host_init(struct pcie_port *pp)
>  		}
>  	}
>  
> +	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE);

Do we know if it's always safe to read these registers at this point in time?

Later in dw_pcie_host_init we call pp->ops->host_init - looking at the
implementations of .host_init I can see:

 - resets being performed (qcom_ep_reset_assert,
   artpec6_pcie_assert_core_reset, imx6_pcie_assert_core_reset)
 - changes to config space registers (ks_pcie_init_id, dw_pcie_setup_rc)
   including setting PCI_CLASS_DEVICE
 - and clocks being enabled (qcom_pcie_init_1_0_0)

I'm not sure if your changes would cause anything to break for these other
controllers (or future controllers) as I couldn't see any other reads to the
config.

Given that we are reading config space should dw_pcie_rd_own_conf be used?
(For example kirin_pcie_rd_own_conf does something special).

Thanks,

Andrew Murray

> +	if (hdr_type != PCI_HEADER_TYPE_BRIDGE) {
> +		dev_err(pci->dev, "PCIe controller is not set to bridge type (hdr_type: 0x%x)!\n",
> +			hdr_type);
> +		return -EIO;
> +	}
> +
>  	pp->mem_base = pp->mem->start;
>  
>  	if (!pp->va_cfg0_base) {
> -- 
> 2.17.1
> 
