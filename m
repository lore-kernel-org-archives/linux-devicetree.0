From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH v4 4/6] dt-bindings: imx6q-pcie: Add turnoff reset for imx7d
Date: Tue, 14 Aug 2018 19:50:18 +0300
Message-ID: <e4e35d89f8e393cd291cb612a95faf1653a26f9b.1534264292.git.leonard.crestez@nxp.com>
References: <cover.1534264292.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1534264292.git.leonard.crestez@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, linux-pci@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This is documented as "required" but won't be present in old dtbs.

These resets are also present on other imx chips but right now only
imx7d implements them through the reset controller subsystem.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
index cb33421184a0..f37494d5a7be 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
@@ -48,10 +48,11 @@ Additional required properties for imx7d-pcie:
 - resets: Must contain phandles to PCIe-related reset lines exposed by SRC
   IP block
 - reset-names: Must contain the following entires:
 	       - "pciephy"
 	       - "apps"
+	       - "turnoff"
 
 Example:
 
 	pcie@01000000 {
 		compatible = "fsl,imx6q-pcie", "snps,dw-pcie";
-- 
2.17.1
