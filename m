From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv5 16/20] PCI: mobiveil: Add link up condition check
Date: Tue, 11 Jun 2019 18:17:33 +0100
Message-ID: <20190611171733.GB22836@redmoon>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
 <20190412083635.33626-17-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412083635.33626-17-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>, bhelgaas@google.com
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

NB: Please trim the CC list and keep it to concerned maintainers.

On Fri, Apr 12, 2019 at 08:36:48AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Avoid to issue CFG transactions to link partner when the PCIe
> link is not up.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V5:
>  - Corrected the subject.
> 
>  drivers/pci/controller/pcie-mobiveil.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index 621852078caf..1ee3ea2570c0 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -283,6 +283,10 @@ static bool mobiveil_pcie_valid_device(struct pci_bus *bus, unsigned int devfn)
>  {
>  	struct mobiveil_pcie *pcie = bus->sysdata;
>  
> +	/* If there is no link, then there is no device */
> +	if (bus->number > pcie->root_bus_nr && !mobiveil_pcie_link_up(pcie))

I think Bjorn mentioned this a million times already, eg:

https://lore.kernel.org/linux-pci/20190411201535.GS256045@google.com/

this is racy and gives a false sense of robustness. We have code in the
kernel that checks the link but adding more seems silly to me, so I am
inclined to drop this patch.

Lorenzo

> +		return false;
> +
>  	/* Only one device down on each root port */
>  	if ((bus->number == pcie->root_bus_nr) && (devfn > 0))
>  		return false;
> -- 
> 2.17.1
> 
