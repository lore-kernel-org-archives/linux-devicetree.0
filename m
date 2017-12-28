From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 0/9] PCI: Add support to the Cadence PCIe controller
Date: Thu, 28 Dec 2017 18:30:43 +0530
Message-ID: <d30e0abe-8b08-b2bf-8410-e0fc2b18cacc@ti.com>
References: <cover.1513620412.git.cyrille.pitchen@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1513620412.git.cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

On Monday 18 December 2017 11:46 PM, Cyrille Pitchen wrote:
> Hi all,
> 
> this series of patches adds support to the Cadence PCIe controller.
> It was tested on a ARM64 platform emulated by a Palladium running the
> pci-next kernel.
> 
> The host mode was tested with some PCIe devices connected to the Palladium
> through a speed-bridge. Some of those devices were a USB host controller
> and a SATA controller. The PCIe host controller was also tested with a
> second controller configured in endpoint mode and connected back to back
> to the first controller.
> 
> The EndPoint Controller (EPC) driver of this series was tested with the
> pci-epf-test.c EndPoint Function (EPF) driver and the pcitest userspace
> program.

Did you get to test multi function EP?

Thanks
Kishon
> 
> For pci-next, I applied this series on top of Kishon's patch
> ("PCI: endpoint: Use EPC's device in dma_alloc_coherent/dma_free_coherent")
> otherwise dma_alloc_coherent() fails when called by pci_epf_alloc_space().
> 
> Best regards,
> 
> Cyrille
> 
> ChangeLog:
> 
> v1 -> v2:
> - add new properties in the device-tree bindings: 'cdns,max-outbound-regions'
>   and 'cdns,no-bar-match-nbits'.
> - add a new patch to regroup all makefile rules in drivers/pci/Makefile, hence
>   cleaning drivers/Makefile up.
> - change the license text to use the recommanded format:
>   // SPDX-License-Identifier: GPL-2.0
> - add a new patch updating the API of the EPC library to add support to
>   multi-function devices.
> - add a 2 new patches to share more common code between host controller drivers
> - remove some useless tests
> - add more comments in both drivers.
> - fix DT bindings examples
> - remove useless init of the primary, secondary and sub-ordinate bus numbers in
>   the PCI configuration space of the root port.
> - remove cdns_pcie_ep_stop() function and rework cdns_pcie_ep_start() function
> 
> Cyrille Pitchen (8):
>   PCI: Regroup all PCI related entries into drivers/pci/Makefile
>   PCI: OF: Add generic function to parse and allocate PCI resources
>   PCI: Add generic function to probe PCI host controllers
>   PCI: Add vendor ID for Cadence
>   PCI: cadence: Add host driver for Cadence PCIe controller
>   PCI: endpoint: Add the function number as argument to EPC ops
>   dt-bindings: PCI: cadence: Add DT bindings for Cadence PCIe endpoint
>     controller
>   PCI: cadence: Add EndPoint Controller driver for Cadence PCIe
>     controller
> 
> Scott Telford (1):
>   dt-bindings: PCI: cadence: Add DT bindings for Cadence PCIe host
>     controller
> 
>  .../devicetree/bindings/pci/cdns,cdns-pcie-ep.txt  |  23 +
>  .../bindings/pci/cdns,cdns-pcie-host.txt           |  60 +++
>  MAINTAINERS                                        |   7 +
>  drivers/Makefile                                   |   5 +-
>  drivers/pci/Kconfig                                |   2 +
>  drivers/pci/Makefile                               |  12 +-
>  drivers/pci/cadence/Kconfig                        |  33 ++
>  drivers/pci/cadence/Makefile                       |   4 +
>  drivers/pci/cadence/pcie-cadence-ep.c              | 531 +++++++++++++++++++++
>  drivers/pci/cadence/pcie-cadence-host.c            | 330 +++++++++++++
>  drivers/pci/cadence/pcie-cadence.c                 |  95 ++++
>  drivers/pci/cadence/pcie-cadence.h                 | 310 ++++++++++++
>  drivers/pci/dwc/pcie-designware-ep.c               |  20 +-
>  drivers/pci/endpoint/functions/pci-epf-test.c      |  41 +-
>  drivers/pci/endpoint/pci-epc-core.c                |  62 ++-
>  drivers/pci/host/Makefile                          |   2 +
>  drivers/pci/host/pci-host-common.c                 |  87 +---
>  drivers/pci/of.c                                   |  51 ++
>  drivers/pci/probe.c                                |  50 ++
>  include/linux/pci-epc.h                            |  43 +-
>  include/linux/pci.h                                |  12 +
>  include/linux/pci_ids.h                            |   2 +
>  22 files changed, 1624 insertions(+), 158 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.txt
>  create mode 100644 drivers/pci/cadence/Kconfig
>  create mode 100644 drivers/pci/cadence/Makefile
>  create mode 100644 drivers/pci/cadence/pcie-cadence-ep.c
>  create mode 100644 drivers/pci/cadence/pcie-cadence-host.c
>  create mode 100644 drivers/pci/cadence/pcie-cadence.c
>  create mode 100644 drivers/pci/cadence/pcie-cadence.h
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
