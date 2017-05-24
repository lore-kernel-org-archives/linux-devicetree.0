From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/2] Add PCIe host driver support for Mediatek SoCs
Date: Wed, 24 May 2017 16:56:41 -0500
Message-ID: <20170524215641.GE2794@bhelgaas-glaptop.roam.corp.google.com>
References: <1495338145-9384-1-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495338145-9384-1-git-send-email-ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Red Hung <red.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, May 21, 2017 at 11:42:23AM +0800, Ryder Lee wrote:
> Hi,
> 
> This patch series add Mediatek Gen2 PCIe host controller driver and
> dt-binding document. It can be found on MT7623 series SoCs.
> 
> This driver was validated using Broadcom Tigon3 and Intel(R) 82575/82576
> gigabit ethernet card.
> 
> 
> Changes since v5:
> - rebase to Linux 4.12-rc1.
> - remove redundant module.h header and MODULE macros.
> 
> Changes since v4:
> - move the per-port registers to the parent node.
> - use a valid compatible for hifsys controller.
> - use the 'sysirq' instead of 'gic' as a correct 'interrupt-parent' of the
>   interrupt-map properties.
> 
>   'sysirq' is an interrupt-controller that could help us to reverse GIC SPIs polarity
>   so that we could properly set irq type to level low without any extra properties.
>   It was a mistake to select wrong interrupt-parent on the previous versions.
>   Now, we could remove unnecessary interrupt properties entirely from binding.
> 
> Changes since v3:
> - correct sub-nodes unit addresses.
> 
> Changes since v2:
> - modify Kconfig to avoid kbuild test error on some architecture.
> - change compatible string.
> - revise binding document:
>   add missing interrupt-names.
>   remove the board dts example and drop 'status' properties.
>   remove unnecessary descriptions bout standard PCI bus binding.
> 
> Changes since v1:
> - add .suppress_bind_attrs.
> - remove unnecessary *_valid_device() pattern.
> - remove PCI_PROBE_ONLY.
> - use the regular readl() instead of readl_relaxed().
> - add .map_bus() and change to use pci_generic_config_read/pci_generic_config_write.
> - revise dt-binding document and move nonstandard properties to root node.
> - change compatible string.
> - use interrupt-map property and replace mtk_pcie_map_irq() with of_irq_parse_and_map_pci().
> - use the new pci_register_host_bridge() method instead of pci_scan_root_bus()*
> 
> Ryder Lee (2):
>   PCI: mediatek: Add Mediatek PCIe host controller support
>   dt-bindings: pcie: Add documentation for Mediatek PCIe
> 
>  .../bindings/pci/mediatek,mt7623-pcie.txt          | 130 +++++
>  drivers/pci/host/Kconfig                           |  11 +
>  drivers/pci/host/Makefile                          |   1 +
>  drivers/pci/host/pcie-mediatek.c                   | 553 +++++++++++++++++++++
>  4 files changed, 695 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt
>  create mode 100644 drivers/pci/host/pcie-mediatek.c

Applied to pci/host-mediatek for v4.13, thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
