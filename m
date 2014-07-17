From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 0/4] dra7: Add PCIe support
Date: Thu, 17 Jul 2014 11:58:55 +0900
Message-ID: <009001cfa16b$0c558ea0$2500abe0$%han@samsung.com>
References: <1405349705-31400-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-reply-to: <1405349705-31400-1-git-send-email-kishon@ti.com>
Content-language: ko
Sender: linux-pci-owner@vger.kernel.org
To: 'Kishon Vijay Abraham I' <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, bhelgaas@google.com, mohit.kumar@st.com, linux-kernel@vger.kernel.org, grant.likely@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: devicetree@vger.kernel.org

On Monday, July 14, 2014 11:55 PM, Kishon Vijay Abraham I wrote:
> 
> Changes from v1:
> * fixed dw_pcie_prog_viewport_io_outbound() to use untranslated address
> * split dra7xx patch into driver part and documentation part
> 
> [1] is split into separate series in order for individual subsystem
> Maintainers to pick up the patches. This series handles the PCIe
> support for DRA7.
> 
> Rebased to pci -next.
> 
> [1] -> https://lkml.org/lkml/2014/5/29/258
> 
> Kishon Vijay Abraham I (4):
>   PCI: designware: Configuration space should be specified in 'reg'
>   PCI: designware: use untranslated address while programming ATU
>   Documentation: pci: ti: Add dt binding documentation for PCIe in
>     DRA7xx
>   PCI: host: pcie-dra7xx: add support for pcie-dra7xx controller

Kishon,

Actually, I have no objections to these patches.
Then, how about adding maintainer entry for pci-dra7xx.c
to MAINTAINERS file? It would be good. :-)

Best regards,
Jingoo Han

> 
>  .../devicetree/bindings/pci/designware-pcie.txt    |    4 +
>  Documentation/devicetree/bindings/pci/ti-pci.txt   |   59 +++
>  drivers/pci/host/Kconfig                           |   10 +
>  drivers/pci/host/Makefile                          |    1 +
>  drivers/pci/host/pci-dra7xx.c                      |  458 ++++++++++++++++++++
>  drivers/pci/host/pcie-designware.c                 |   72 ++-
>  drivers/pci/host/pcie-designware.h                 |    4 +
>  7 files changed, 592 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/ti-pci.txt
>  create mode 100644 drivers/pci/host/pci-dra7xx.c
> 
> --
> 1.7.9.5
