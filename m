From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/4] PCI: rcar, rcar-gen2: More Gen2 compatibility strings
Date: Thu,  3 Dec 2015 07:51:36 +0900
Message-ID: <1449096700-23304-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hi,

this short series adds generic gen2 and SoC-specific r8a7793 compatibility
strings to the rcar PCI and rcar-gen2 PCIE drivers. The intention is to
provide a complete set of compatibility strings for known Gen2 SoCs.

Key Changes in v2:
* Include "rcar-" in generic bindings

Simon Horman (4):
  PCI: rcar-gen2: add gen2 fallback compatibility string
  PCI: rcar-gen2: add device tree support for r8a7793
  PCI: rcar: add gen2 fallback compatibility string
  PCI: rcar: add device tree support for r8a7793

 Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt | 12 ++++++++++--
 Documentation/devicetree/bindings/pci/rcar-pci.txt      | 14 +++++++++++---
 drivers/pci/host/pci-rcar-gen2.c                        |  1 +
 drivers/pci/host/pcie-rcar.c                            |  1 +
 4 files changed, 23 insertions(+), 5 deletions(-)

-- 
2.1.4
