From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH pci/next] PCI: rcar: Add compatible string for r8a7796
Date: Sun, 18 Dec 2016 21:27:02 +0900
Message-ID: <1482064022-8998-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-pci@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>

This patch adds support for r8a7796.

Signed-off-by: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the next branch of the pci tree.

 Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
 drivers/pci/host/pcie-rcar.c                       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
index eee518d..34712d6 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
+++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
@@ -6,6 +6,7 @@ compatible: "renesas,pcie-r8a7779" for the R8A7779 SoC;
 	    "renesas,pcie-r8a7791" for the R8A7791 SoC;
 	    "renesas,pcie-r8a7793" for the R8A7793 SoC;
 	    "renesas,pcie-r8a7795" for the R8A7795 SoC;
+	    "renesas,pcie-r8a7796" for the R8A7796 SoC;
 	    "renesas,pcie-rcar-gen2" for a generic R-Car Gen2 compatible device.
 	    "renesas,pcie-rcar-gen3" for a generic R-Car Gen3 compatible device.
 
diff --git a/drivers/pci/host/pcie-rcar.c b/drivers/pci/host/pcie-rcar.c
index aca85be..02e5777 100644
--- a/drivers/pci/host/pcie-rcar.c
+++ b/drivers/pci/host/pcie-rcar.c
@@ -1078,6 +1078,7 @@ static int rcar_pcie_parse_map_dma_ranges(struct rcar_pcie *pcie,
 	{ .compatible = "renesas,pcie-rcar-gen2",
 	  .data = rcar_pcie_hw_init_gen2 },
 	{ .compatible = "renesas,pcie-r8a7795", .data = rcar_pcie_hw_init },
+	{ .compatible = "renesas,pcie-r8a7796", .data = rcar_pcie_hw_init },
 	{ .compatible = "renesas,pcie-rcar-gen3", .data = rcar_pcie_hw_init },
 	{},
 };
-- 
1.9.1
