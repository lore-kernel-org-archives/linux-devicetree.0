From: Phil.Edworthy@renesas.com
Subject: Re: [PATCH v5 1/4] pci: APM X-Gene PCIe controller driver
Date: Tue, 25 Mar 2014 08:52:24 +0000
Message-ID: <OF8E4162E1.91105680-ON80257CA6.002FEBD9-80257CA6.0030BE31@eu.necel.com>
References: <1395270762-6055-1-git-send-email-tinamdar@apm.com>
 <1395270762-6055-2-git-send-email-tinamdar@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395270762-6055-2-git-send-email-tinamdar@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tanmay Inamdar <tinamdar@apm.com>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, patches@apm.com, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, jcm@redhat.com, Bjorn Helgaas <bhelgaas@google.com>, Liviu Dudau <liviu.dudau@arm.com>, linux-pci-owner@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Tanmay,

On: 19/03/2014 23:15, Tanmay wrote:
> Subject: [PATCH v5 1/4] pci: APM X-Gene PCIe controller driver
> Sent by: linux-pci-owner@vger.kernel.org
> 
> This patch adds the AppliedMicro X-Gene SOC PCIe controller driver.
> X-Gene PCIe controller supports maximum up to 8 lanes and GEN3 speed.
> X-Gene SOC supports maximum 5 PCIe ports.
<snip>

> +static void xgene_pcie_setup_ib_reg(struct xgene_pcie_port *port,
> +                struct of_pci_range *range, u8 *ib_reg_mask)
> +{
> +   void __iomem *csr_base = port->csr_base;
> +   void __iomem *cfg_base = port->cfg_base;
> +   void *bar_addr;
> +   void *pim_addr;
> +   u64 restype = range->flags & IORESOURCE_TYPE_BITS;
> +   u64 cpu_addr = range->cpu_addr;
> +   u64 pci_addr = range->pci_addr;
> +   u64 size = range->size;
> +   u64 mask = ~(size - 1) | EN_REG;
> +   u32 flags = PCI_BASE_ADDRESS_MEM_TYPE_64;
> +   u32 bar_low;
> +   int region;
> +
> +   region = xgene_pcie_select_ib_reg(ib_reg_mask, range->size);
> +   if (region < 0) {
> +      dev_warn(port->dev, "invalid pcie dma-range config\n");
> +      return;
> +   }
> +
> +   if (restype == PCI_BASE_ADDRESS_MEM_PREFETCH)
> +      flags |= PCI_BASE_ADDRESS_MEM_PREFETCH;

Since IORESOURCE_TYPE_BITS is 0x00001f00, and 
PCI_BASE_ADDRESS_MEM_PREFETCH is 0x08, this will never match. I think you 
are mixing up different sets of definitions here. Also, the address 
properties in range->flags are bitfields.

Regards
Phil
