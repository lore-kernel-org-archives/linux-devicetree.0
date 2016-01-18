From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 1/4] PCI: rcar-gen2: add gen2 fallback compatibility string
Date: Mon, 18 Jan 2016 14:09:42 +0900
Message-ID: <1453093785-21067-2-git-send-email-horms+renesas@verge.net.au>
References: <1453093785-21067-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1453093785-21067-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Add fallback compatibility string for R-Car Gen 2 family.
This is in keeping with the fallback scheme being adopted wherever
appropriate for drivers for Renesas SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>

---
v2
* Include "rcar-" in new compatibility string
---
 Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt | 11 +++++++++--
 drivers/pci/host/pci-rcar-gen2.c                        |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
index 7fab84b33531..7f3d383e605f 100644
--- a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
+++ b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
@@ -8,7 +8,14 @@ OHCI and EHCI controllers.
 Required properties:
 - compatible: "renesas,pci-r8a7790" for the R8A7790 SoC;
 	      "renesas,pci-r8a7791" for the R8A7791 SoC;
-	      "renesas,pci-r8a7794" for the R8A7794 SoC.
+	      "renesas,pci-r8a7794" for the R8A7794 SoC;
+	      "renesas,pci-rcar-gen2" for a generic R-Car Gen2 compatible device.
+
+
+	      When compatible with the generic version, nodes must list the
+	      SoC-specific version corresponding to the platform first
+	      followed by the generic version.
+
 - reg:	A list of physical regions to access the device: the first is
 	the operational registers for the OHCI/EHCI controllers and the
 	second is for the bridge configuration and control registers.
@@ -27,7 +34,7 @@ Required properties:
 Example SoC configuration:
 
 	pci0: pci@ee090000  {
-		compatible = "renesas,pci-r8a7790";
+		compatible = "renesas,pci-r8a7790", "renesas,pci-rcar-gen2";
 		clocks = <&mstp7_clks R8A7790_CLK_EHCI>;
 		reg = <0x0 0xee090000 0x0 0xc00>,
 		      <0x0 0xee080000 0x0 0x1100>;
diff --git a/drivers/pci/host/pci-rcar-gen2.c b/drivers/pci/host/pci-rcar-gen2.c
index c4f64bfee551..5683e7068b29 100644
--- a/drivers/pci/host/pci-rcar-gen2.c
+++ b/drivers/pci/host/pci-rcar-gen2.c
@@ -360,6 +360,7 @@ static int rcar_pci_probe(struct platform_device *pdev)
 }
 
 static struct of_device_id rcar_pci_of_match[] = {
+	{ .compatible = "renesas,pci-rcar-gen2", },
 	{ .compatible = "renesas,pci-r8a7790", },
 	{ .compatible = "renesas,pci-r8a7791", },
 	{ .compatible = "renesas,pci-r8a7794", },
-- 
2.1.4
