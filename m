Return-Path: <SRS0=1Caa=TB=arm.com=lorenzo.pieralisi@kernel.org>
Date: Wed, 1 May 2019 12:13:45 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH V2 00/28] Enable Tegra PCIe root port features
Message-ID: <20190501111345.GB3100@e121166-lin.cambridge.arm.com>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190426132219.GE16228@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190426132219.GE16228@ulmo>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 26, 2019 at 03:22:19PM +0200, Thierry Reding wrote:
> On Tue, Apr 23, 2019 at 02:57:57PM +0530, Manikanta Maddireddy wrote:
> > This series of patches adds,
> > - Tegra root port features like Gen2, AER, etc
> > - Power and perf optimizations
> > - Fixes like "power up sequence", "dev_err prints", etc
> > 
> > This series of patches are tested on Tegra186 based Jetson-TX2, Tegra210
> > based Jetson-TX1 and T124 based Jetson-TK1 platforms.
> > 
> > TODO: I don't have T20 and T30 platforms to verify this series.
> > Thierry has kindly agreed to verify this series on T20 and T30.
> 
> I tested this on TrimSlice and Beaver. next-20190426 boots via NFS on
> both of those boards. Applying this series on top of next-20190426 works
> on Beaver but does not work on TrimSlice. I'll see if I can bisect which
> exact commit breaks this, but it seems like PCI accesses do work, since
> I see the RTL8169 device being detected. But when the kernel tries to
> send out DHCP requests, the packet transmission is never completed using
> an interrupt, so maybe something interrupt related is broken.

I have marked this series as "deferred" in patchwork, more testing
needed from what you are reporting.

Thanks,
Lorenzo

> Thierry
> 
> > V2 takes care of comments from Bjorn and Thierry.
> > 
> > Manikanta Maddireddy (28):
> >   soc/tegra: pmc: Export tegra_powergate_power_on()
> >   PCI: tegra: Handle failure cases in tegra_pcie_power_on()
> >   PCI: tegra: Rearrange Tegra PCIe driver functions
> >   PCI: tegra: Disable PCIe interrupts in runtime suspend
> >   PCI: tegra: Fix PCIe host power up sequence
> >   PCI: tegra: Add PCIe Gen2 link speed support
> >   PCI: tegra: Advertise PCIe Advanced Error Reporting (AER) capability
> >   PCI: tegra: Program UPHY electrical settings for Tegra210
> >   PCI: tegra: Enable opportunistic UpdateFC and ACK
> >   PCI: tegra: Disable AFI dynamic clock gating
> >   PCI: tegra: Process pending DLL transactions before entering L1 or L2
> >   PCI: tegra: Enable PCIe xclk clock clamping
> >   PCI: tegra: Increase the deskew retry time
> >   PCI: tegra: Add SW fixup for RAW violations
> >   PCI: tegra: Update flow control timer frequency in Tegra210
> >   PCI: tegra: Set target speed as Gen1 before starting LTSSM
> >   PCI: tegra: Fix PLLE power down issue due to CLKREQ# signal
> >   PCI: tegra: Program AFI_CACHE* registers only for Tegra20
> >   PCI: tegra: Change PRSNT_SENSE irq log to debug
> >   PCI: tegra: Use legacy irq for port service drivers
> >   PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of soc struct
> >   PCI: tegra: Access endpoint config only if PCIe link is up
> >   dt-bindings: pci: tegra: Document PCIe DPD pinctrl optional prop
> >   arm64: tegra: Add PEX DPD states as pinctrl properties
> >   PCI: tegra: Put PEX CLK & BIAS pads in DPD mode
> >   dt-bindings: pci: tegra: Document reset-gpio optional prop
> >   PCI: tegra: Add support for GPIO based PCIe reset
> >   PCI: tegra: Change link retry log level to info
> > 
> >  .../bindings/pci/nvidia,tegra20-pcie.txt      |  13 +
> >  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  19 +
> >  drivers/pci/controller/pci-tegra.c            | 605 +++++++++++++++---
> >  drivers/soc/tegra/pmc.c                       |   1 +
> >  4 files changed, 558 insertions(+), 80 deletions(-)
> > 
> > -- 
> > 2.17.1
> > 
