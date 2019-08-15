From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH 04/10] dt-bindings: pci: layerscape-pci: add compatible strings for ls1088a and ls2088a
Date: Thu, 15 Aug 2019 16:37:10 +0800
Message-ID: <20190815083716.4715-4-xiaowei.bao@nxp.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815083716.4715-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add compatible strings for ls1088a and ls2088a.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 Documentation/devicetree/bindings/pci/layerscape-pci.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index e20ceaa..16f592e 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -22,7 +22,10 @@ Required properties:
         "fsl,ls1043a-pcie"
         "fsl,ls1012a-pcie"
   EP mode:
-	"fsl,ls1046a-pcie-ep", "fsl,ls-pcie-ep"
+	"fsl,ls-pcie-ep"
+	"fsl,ls1046a-pcie-ep"
+	"fsl,ls1088a-pcie-ep"
+	"fsl,ls2088a-pcie-ep"
 - reg: base addresses and lengths of the PCIe controller register blocks.
 - interrupts: A list of interrupt outputs of the controller. Must contain an
   entry for each entry in the interrupt-names property.
-- 
2.9.5
