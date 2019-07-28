From: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 2/2] dt-bindings: pci: pci-msi: Correct the unit-address of the pci node name
Date: Sun, 28 Jul 2019 02:30:19 -0700
Message-ID: <1564306219-17439-2-git-send-email-bmeng.cn@gmail.com>
References: <1564306219-17439-1-git-send-email-bmeng.cn@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564306219-17439-1-git-send-email-bmeng.cn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The unit-address must match the first address specified in the
reg property of the node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 Documentation/devicetree/bindings/pci/pci-msi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/pci-msi.txt b/Documentation/devicetree/bindings/pci/pci-msi.txt
index 9b3cc81..b73d839 100644
--- a/Documentation/devicetree/bindings/pci/pci-msi.txt
+++ b/Documentation/devicetree/bindings/pci/pci-msi.txt
@@ -201,7 +201,7 @@ Example (5)
 		#msi-cells = <1>;
 	};
 
-	pci: pci@c {
+	pci: pci@f {
 		reg = <0xf 0x1>;
 		compatible = "vendor,pcie-root-complex";
 		device_type = "pci";
-- 
2.7.4
