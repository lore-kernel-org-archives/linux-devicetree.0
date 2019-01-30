From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCHv3 00/27] PCI: refactor Mobiveil driver and add PCIe Gen4
 driver for NXP Layerscape SoCs
Date: Wed, 30 Jan 2019 09:34:47 -0600
Message-ID: <20190130153447.GB229773@google.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2019 at 08:08:28AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> This patch set is aim to refactor the Mobiveil driver and add
> PCIe support for NXP Layerscape series SoCs integrated Mobiveil's
> PCIe Gen4 controller.
> 
> Hou Zhiqiang (27):
>   PCI: mobiveil: uniform the register accessors
>   PCI: mobiveil: format the code without function change
>   PCI: mobiveil: correct the returned error number
>   PCI: mobiveil: remove flag MSI_FLAG_MULTI_PCI_MSI
>   PCI: mobiveil: correct PCI base address in MEM/IO outbound windows
>   PCI: mobiveil: replace the resource list iteration function
>   PCI: mobiveil: use WIN_NUM_0 explicitly for CFG outbound window
>   PCI: mobiveil: use the 1st inbound window for MEM inbound transactions
>   PCI: mobiveil: correct inbound/outbound window setup routines
>   PCI: mobiveil: fix the INTx process error
>   PCI: mobiveil: only fix up the Class Code field
>   PCI: mobiveil: move out the link up waiting from mobiveil_host_init
>   PCI: mobiveil: move irq chained handler setup out of DT parse
>   PCI: mobiveil: initialize Primary/Secondary/Subordinate bus number
>   dt-bindings: pci: mobiveil: change gpio_slave and apb_csr to optional
>   PCI: mobiveil: refactor Mobiveil PCIe Host Bridge IP driver
>   PCI: mobiveil: fix the checking of valid device
>   PCI: mobiveil: continue to initialize the host upon no PCIe link
>   PCI: mobiveil: disabled IB and OB windows set by bootloader
>   PCI: mobiveil: add Byte and Half-Word width register accessors
>   PCI: mobiveil: make mobiveil_host_init can be used to re-init host
>   dt-bindings: pci: Add NXP Layerscape SoCs PCIe Gen4 controller
>   PCI: mobiveil: add PCIe Gen4 RC driver for NXP Layerscape SoCs
>   PCI: mobiveil: ls_pcie_g4: add Workaround for A-011577
>   PCI: mobiveil: ls_pcie_g4: add Workaround for A-011451
>   arm64: dts: freescale: lx2160a: add pcie DT nodes
>   arm64: defconfig: Enable CONFIG_PCI_LAYERSCAPE_GEN4

If/when you repost this, please pay attention to the changelog
conventions, e.g., capitalize the first word of the sentence ("Remove
flag ...", "Correct PCI base address ...", etc), capitalize acronyms
like "PCI" and "IRQ", use parentheses after function names, etc.  You
can see the conventions by running "git log --oneline
drivers/pci/controller".
