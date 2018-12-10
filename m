From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCH 00/23] PCI: refactor the Mobiveil driver and add PCIe
 support for NXP LX SoCs
Date: Mon, 10 Dec 2018 07:16:17 -0300
Message-ID: <CAFZiPx1cXVWi0vLA4ZtOTeObXg8RtvFX+m31NM2Ezqzq7ymPaA@mail.gmail.com>
References: <20181106131807.29951-1-Zhiqiang.Hou@nxp.com> <20181203115850.GB8040@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203115850.GB8040@e107981-ln.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, Leo Li <leoyang.li@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, xiaowei.bao@nxp.com
List-Id: devicetree@vger.kernel.org

Lorenzo,
You are right, I reviewed few DT files, will need some time to review
this train.
I will start doing it in a while.

Thanks for pitching in.

Thanks.

On Mon, Dec 3, 2018 at 8:58 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Tue, Nov 06, 2018 at 01:19:03PM +0000, Z.q. Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> > This patch set is aim to refactor the Mobiveil driver and add
> > PCIe support for NXP LX series SoCs.
> >
> > Hou Zhiqiang (23):
> >   PCI: mobiveil: uniform the register accessors
> >   PCI: mobiveil: format the code without function change
> >   PCI: mobiveil: correct the returned error number
> >   PCI: mobiveil: remove flag MSI_FLAG_MULTI_PCI_MSI
> >   PCI: mobiveil: correct PCI base address in MEM/IO outbound windows
> >   PCI: mobiveil: replace the resource list iteration function
> >   PCI: mobiveil: use WIN_NUM_0 explicitly for CFG outbound window
> >   PCI: mobiveil: use the 1st inbound window for MEM inbound transactions
> >   PCI: mobiveil: correct the inbound/outbound window setup routine
> >   PCI: mobiveil: fix the INTx process error
> >   PCI: mobiveil: only fixup the Class Code field
> >   PCI: mobiveil: move out the link up waiting from mobiveil_host_init
> >   PCI: mobiveil: move irq chained handler setup out of DT parse
> >   PCI: mobiveil: initialize Primary/Secondary/Subordinate bus number
> >   dt-bindings: pci: mobiveil: change gpio_slave and apb_csr to optional
> >   PCI: mobiveil: refactor the Mobiveil driver
> >   PCI: mobiveil: continue to initialize the host upon no PCIe link
> >   PCI: mobiveil: disabled IB and OB windows set by bootloader
> >   PCI: mobiveil: add Byte and Half-Word width register accessors
> >   PCI: mobiveil: change prototype of function mobiveil_host_init
> >   dt-bindings: pci: Add NXP LX SoCs PCIe controller
> >   PCI: mobiveil: add PCIe RC driver for NXP LX series SoCs
> >   arm64: dts: freescale: lx2160a: add pcie DT nodes
> >
> >  .../devicetree/bindings/pci/lx-pci.txt        |  52 ++
> >  .../devicetree/bindings/pci/mobiveil-pcie.txt |   2 +
> >  MAINTAINERS                                   |  10 +-
> >  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 157 ++++
> >  drivers/pci/controller/Kconfig                |  11 +-
> >  drivers/pci/controller/Makefile               |   2 +-
> >  drivers/pci/controller/mobiveil/Kconfig       |  34 +
> >  drivers/pci/controller/mobiveil/Makefile      |   5 +
> >  drivers/pci/controller/mobiveil/pci-lx.c      | 222 +++++
> >  .../controller/mobiveil/pcie-mobiveil-host.c  | 622 +++++++++++++
> >  .../controller/mobiveil/pcie-mobiveil-plat.c  |  54 ++
> >  .../pci/controller/mobiveil/pcie-mobiveil.c   | 245 +++++
> >  .../pci/controller/mobiveil/pcie-mobiveil.h   | 221 +++++
> >  drivers/pci/controller/pcie-mobiveil.c        | 861 ------------------
> >  14 files changed, 1625 insertions(+), 873 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pci/lx-pci.txt
> >  create mode 100644 drivers/pci/controller/mobiveil/Kconfig
> >  create mode 100644 drivers/pci/controller/mobiveil/Makefile
> >  create mode 100644 drivers/pci/controller/mobiveil/pci-lx.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-plat.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil.h
> >  delete mode 100644 drivers/pci/controller/pcie-mobiveil.c
>
> Subrahmanya,
>
> for the records, this is the driver *you* are maintaining, aren't you ?
>
> We ask developers to be added to the MAINTAINERS list in order to hold
> them accountable, merging a driver upstream means that you need to
> actively maintain it, which in turn means reviewing series affecting
> its code, like this one.
>
> I will have a look too but it is your responsibility to review these
> patches and ACK them accordingly.
>
> So I strongly suggest you start doing it please.
>
> Thanks,
> Lorenzo
