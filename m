From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH v3 05/11] dt-bindings: pci: layerscape-pci: add compatible strings for ls1088a and ls2088a
Date: Mon,  2 Sep 2019 11:17:10 +0800
Message-ID: <20190902031716.43195-6-xiaowei.bao@nxp.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902031716.43195-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, zhiqiang.hou@nxp.com, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add compatible strings for ls1088a and ls2088a.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
v2:
 - No change.
v3:
 - Use one valid combination of compatible strings.

 Documentation/devicetree/bindings/pci/layerscape-pci.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index e20ceaa..762ae41 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -22,7 +22,9 @@ Required properties:
         "fsl,ls1043a-pcie"
         "fsl,ls1012a-pcie"
   EP mode:
-	"fsl,ls1046a-pcie-ep", "fsl,ls-pcie-ep"
+	"fsl,ls1046a-pcie-ep" "fsl,ls-pcie-ep"
+	"fsl,ls1088a-pcie-ep" "fsl,ls-pcie-ep"
+	"fsl,ls2088a-pcie-ep" "fsl,ls-pcie-ep"
 - reg: base addresses and lengths of the PCIe controller register blocks.
 - interrupts: A list of interrupt outputs of the controller. Must contain an
   entry for each entry in the interrupt-names property.
-- 
2.9.5
