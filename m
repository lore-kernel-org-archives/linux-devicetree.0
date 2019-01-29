From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv3 00/27] PCI: refactor Mobiveil driver and add PCIe Gen4
 driver for NXP Layerscape SoCs
Date: Tue, 29 Jan 2019 11:39:10 +0000
Message-ID: <20190129113910.GA7467@e107981-ln.cambridge.arm.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
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

Subrahmanya,

Either you review this series or I will have to drop you from
the MAINTAINERS list for this driver, I am sorry but I asked you
before to no avail.

Thanks,
Lorenzo

>  .../bindings/pci/layerscape-pci-gen4.txt      |  52 ++
>  .../devicetree/bindings/pci/mobiveil-pcie.txt |   2 +
>  MAINTAINERS                                   |  10 +-
>  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 163 ++++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/pci/controller/Kconfig                |  11 +-
>  drivers/pci/controller/Makefile               |   2 +-
>  drivers/pci/controller/mobiveil/Kconfig       |  34 +
>  drivers/pci/controller/mobiveil/Makefile      |   5 +
>  .../controller/mobiveil/pci-layerscape-gen4.c | 306 +++++++
>  .../controller/mobiveil/pcie-mobiveil-host.c  | 640 +++++++++++++
>  .../controller/mobiveil/pcie-mobiveil-plat.c  |  54 ++
>  .../pci/controller/mobiveil/pcie-mobiveil.c   | 246 +++++
>  .../pci/controller/mobiveil/pcie-mobiveil.h   | 229 +++++
>  drivers/pci/controller/pcie-mobiveil.c        | 861 ------------------
>  15 files changed, 1743 insertions(+), 873 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/layerscape-pci-gen4.txt
>  create mode 100644 drivers/pci/controller/mobiveil/Kconfig
>  create mode 100644 drivers/pci/controller/mobiveil/Makefile
>  create mode 100644 drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
>  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
>  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-plat.c
>  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil.c
>  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil.h
>  delete mode 100644 drivers/pci/controller/pcie-mobiveil.c
> 
> -- 
> 2.17.1
> 
