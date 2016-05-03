From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] pci: host: Broadcom STB PCIE RC controller support
Date: Mon,  2 May 2016 18:25:47 -0700
Message-ID: <1462238749-19715-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series adds support for Broadcom STB SoC's PCIe root complex driver.

This was primarily tested on BCM7445 (ARM) and BCM7435 (MIPS).

Jim is the original author, and I picked up our downstream 4.1 driver and
updated it to utilize the non-ARM hw_pci functions as well as made some
stylistic changes.

Thanks!

Jim Quinlan (2):
  Documentation: DT: bindings: Add Broadcom STB PCIe bindings
  pci: host: Add Broadcom STB PCIE RC controller

 .../devicetree/bindings/pci/brcm,brcmstb-pcie.txt  |   81 ++
 MAINTAINERS                                        |    1 +
 drivers/pci/host/Kconfig                           |    9 +
 drivers/pci/host/Makefile                          |    1 +
 drivers/pci/host/pcie-brcmstb.c                    | 1243 ++++++++++++++++++++
 5 files changed, 1335 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/brcm,brcmstb-pcie.txt
 create mode 100644 drivers/pci/host/pcie-brcmstb.c

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
