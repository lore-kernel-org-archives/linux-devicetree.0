From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv5 00/20] PCI: mobiveil: fixes for Mobiveil PCIe Host
 Bridge IP driver
Date: Wed, 3 Jul 2019 11:33:19 +0100
Message-ID: <20190703103319.GA26804@e121166-lin.cambridge.arm.com>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 08:35:11AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> This patch set is to add fixes for Mobiveil PCIe Host driver.
> And these patches are splited from the thread below:
> http://patchwork.ozlabs.org/project/linux-pci/list/?series=96417
> 
> Hou Zhiqiang (20):
>   PCI: mobiveil: Unify register accessors
>   PCI: mobiveil: Format the code without functionality change
>   PCI: mobiveil: Correct the returned error number
>   PCI: mobiveil: Remove the flag MSI_FLAG_MULTI_PCI_MSI
>   PCI: mobiveil: Correct PCI base address in MEM/IO outbound windows
>   PCI: mobiveil: Replace the resource list iteration function
>   PCI: mobiveil: Use WIN_NUM_0 explicitly for CFG outbound window
>   PCI: mobiveil: Use the 1st inbound window for MEM inbound transactions
>   PCI: mobiveil: Correct inbound/outbound window setup routines
>   PCI: mobiveil: Fix the INTx process errors
>   PCI: mobiveil: Correct the fixup of Class Code field
>   PCI: mobiveil: Move the link up waiting out of mobiveil_host_init()
>   PCI: mobiveil: Move IRQ chained handler setup out of DT parse
>   PCI: mobiveil: Initialize Primary/Secondary/Subordinate bus numbers
>   PCI: mobiveil: Fix the checking of valid device
>   PCI: mobiveil: Add link up condition check
>   PCI: mobiveil: Complete initialization of host even if no PCIe link
>   PCI: mobiveil: Disable IB and OB windows set by bootloader
>   PCI: mobiveil: Add 8-bit and 16-bit register accessors
>   dt-bindings: PCI: mobiveil: Change gpio_slave and apb_csr to optional
> 
>  .../devicetree/bindings/pci/mobiveil-pcie.txt |   2 +
>  drivers/pci/controller/pcie-mobiveil.c        | 578 +++++++++++-------
>  2 files changed, 368 insertions(+), 212 deletions(-)

I am putting together a branch with the patches I would like
to queue, for the ones I requested to split please wait for
me, I will publish the branch and will ask you to rebase
on top of it.

Lorenzo
