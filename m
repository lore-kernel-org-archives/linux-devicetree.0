From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH 2/2] dt-bindings: imx6q-pcie: add "fsl,pcie-phy-refclk-internal" for i.MX7D
Date: Tue, 13 Aug 2019 11:37:59 +0100
Message-ID: <20190813103759.38358-2-git@andred.net>
References: <20190813103759.38358-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813103759.38358-1-git@andred.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The i.MX7D variant of the IP can use either an external
crystal oscillator input or an internal clock input as
a reference clock input for the PCIe PHY.

Document the optional property 'fsl,pcie-phy-refclk-internal'

Signed-off-by: André Draszik <git@andred.net>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
index a7f5f5afa0e6..985d7083df9f 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
@@ -56,6 +56,11 @@ Additional required properties for imx7d-pcie and imx8mq-pcie:
 	       - "turnoff"
 - fsl,imx7d-pcie-phy: A phandle to an fsl,imx7d-pcie-phy node.
 
+Additional optional properties for imx7d-pcie:
+- fsl,pcie-phy-refclk-internal: If present then an internal PLL input is used
+  as PCIe PHY reference clock source. By default an external ocsillator input
+  is used.
+
 Additional required properties for imx8mq-pcie:
 - clock-names: Must include the following additional entries:
 	- "pcie_aux"
-- 
2.23.0.rc1
