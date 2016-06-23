From: Dongdong Liu <liudongdong3@huawei.com>
Subject: Re: [PATCH v3 2/2] pci/aer: interrupt fixup in the quirk
Date: Thu, 23 Jun 2016 13:43:38 +0800
Message-ID: <576B770A.6060508@huawei.com>
References: <1464242406-20203-1-git-send-email-po.liu@nxp.com>
 <1465892645-32381-1-git-send-email-po.liu@nxp.com>
 <1465892645-32381-2-git-send-email-po.liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465892645-32381-2-git-send-email-po.liu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Po Liu <po.liu@nxp.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh@kernel.org>, Roy Zang <roy.zang@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, Minghuan Lian <minghuan.lian@nxp.com>, Murali Karicheri <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org



=D4=DA 2016/6/14 16:24, Po Liu =D0=B4=B5=C0:
> On some platforms, root port doesn't support MSI/MSI-X/INTx in RC mod=
e.
> When chip support the aer interrupt with none MSI/MSI-X/INTx mode,
> maybe there is interrupt line for aer pme etc. Search the interrupt
> number in the fdt file. Then fixup the dev->irq with it.
>
> Signed-off-by: Po Liu <po.liu@nxp.com>
> ---
> changes for V3:
> 	- Move to quirk;
> 	- Only correct the irq in RC mode;
>
>   drivers/pci/quirks.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index ee72ebe..8b39cce 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -25,6 +25,7 @@
>   #include <linux/sched.h>
>   #include <linux/ktime.h>
>   #include <linux/mm.h>
> +#include <linux/of_irq.h>
>   #include <asm/dma.h>	/* isa_dma_bridge_buggy */
>   #include "pci.h"
>
> @@ -4419,3 +4420,31 @@ static void quirk_intel_qat_vf_cap(struct pci_=
dev *pdev)
>   	}
>   }
>   DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x443, quirk_intel_qat=
_vf_cap);
> +
> +/* If root port doesn't support MSI/MSI-X/INTx in RC mode,
> + * but use standalone irq. Read the device tree for the aer
> + * interrupt number.
> + */
> +static void quirk_aer_interrupt(struct pci_dev *dev)
> +{
> +	int ret;
> +	u8 header_type;
> +	struct device_node *np =3D NULL;
> +
> +	/* Only for the RC mode device */
> +	pci_read_config_byte(dev, PCI_HEADER_TYPE, &header_type);
> +	if ((header_type & 0x7F) !=3D PCI_HEADER_TYPE_BRIDGE)
> +		return;

How about that it is changed as below.

/* Only for the RC mode device */
if (pci_pcie_type(dev) !=3D PCI_EXP_TYPE_ROOT_PORT)
	return;

Dongdong
Thanks
> +
> +	if (dev->bus->dev.of_node)
> +		np =3D dev->bus->dev.of_node;
> +
> +	if (IS_ENABLED(CONFIG_OF_IRQ) && np) {
> +		ret =3D of_irq_get_byname(np, "aer");
> +		if (ret > 0) {
> +			dev->no_msi =3D 1;
> +			dev->irq =3D ret;
> +		}
> +	}
> +}
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FREESCALE, PCI_ANY_ID, quirk_a=
er_interrupt);
>
