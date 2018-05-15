From: Joao Pinto <Joao.Pinto@synopsys.com>
Subject: Re: [PATCH 0/4] Add DesignWare EP support
Date: Tue, 15 May 2018 15:32:13 +0100
Message-ID: <bd7d0219-e70a-df60-2b9f-5e74d6c282f4@synopsys.com>
References: <cover.1526368368.git.gustavo.pimentel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1526368368.git.gustavo.pimentel@synopsys.com>
Content-Language: pt-PT
Sender: linux-kernel-owner@vger.kernel.org
To: Gustavo Pimentel <gustavo.pimentel@synopsys.com>, bhelgaas@google.com, lorenzo.pieralisi@arm.com, Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Gustavo,

Às 8:13 AM de 5/15/2018, Gustavo Pimentel escreveu:
> The PCIe controller dual mode is capable of operating in RC mode as well
> as EP mode by configuration option. Till now only RC mode was supported,
> with this patch is add EP support to the DesignWare driver.
> 
> Gustavo Pimentel (4):
>   bindings: PCI: designware: Example update
>   PCI: dwc: Add support for EP mode
>   bindings: PCI: designware: Add support for EP in DesignWare driver
>   misc: pci_endpoint_test: Add DesignWare EP entry
> 
>  .../devicetree/bindings/pci/designware-pcie.txt    |  24 +++-
>  drivers/misc/pci_endpoint_test.c                   |   1 +
>  drivers/pci/dwc/Kconfig                            |  41 ++++--
>  drivers/pci/dwc/pcie-designware-ep.c               |   3 +
>  drivers/pci/dwc/pcie-designware-plat.c             | 149 +++++++++++++++++++--
>  drivers/pci/endpoint/functions/pci-epf-test.c      |   7 +
>  include/linux/pci-epc.h                            |   8 ++
>  7 files changed, 206 insertions(+), 27 deletions(-)
> 

Thanks for this patch-set.

Reviewed-by: Joao Pinto <jpinto@synopsys.com>
