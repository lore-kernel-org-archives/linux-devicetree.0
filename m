From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH pci/next v3 0/3] PCI: rcar, rcar-gen2: Bindings cleanups
Date: Tue,  6 Dec 2016 16:51:28 +0100
Message-ID: <1481039491-30364-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hi,

this short series makes some bindings cleanups to the Renesas PCI drivers.

Changes v2->v3:
* Reworded changelogs to indicate that re-ordering struct of_device_id
  entries does not effect run-time behaviour
* Corrected compile error due to typo in symbol name
Changes v1->v2:
* re-order struct of_device_id entries

Simon Horman (3):
  PCI: rcar-gen2: Use gen2 fallback compatibility last
  PCI: rcar: Use gen2 fallback compatibility last
  PCI: rcar: Add gen3 fallback compatibility string for pcie-rcar

 Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
 drivers/pci/host/pci-rcar-gen2.c                   | 2 +-
 drivers/pci/host/pcie-rcar.c                       | 5 +++--
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344
