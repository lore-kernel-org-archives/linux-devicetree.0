From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH v6 1/3] dt-bindings: pci: layerscape-pci: add compatible strings "fsl,ls1028a-pcie"
Date: Mon,  2 Sep 2019 11:43:17 +0800
Message-ID: <20190902034319.14026-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: bhelgaas@google.com, Xiaowei Bao <xiaowei.bao@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the PCIe compatible string for LS1028A

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
 - No change.
v3:
 - No change.
v4:
 - No change.
v5:
 - No change.
v6:
 - No change.

 Documentation/devicetree/bindings/pci/layerscape-pci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index e20ceaa..99a386e 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -21,6 +21,7 @@ Required properties:
         "fsl,ls1046a-pcie"
         "fsl,ls1043a-pcie"
         "fsl,ls1012a-pcie"
+        "fsl,ls1028a-pcie"
   EP mode:
 	"fsl,ls1046a-pcie-ep", "fsl,ls-pcie-ep"
 - reg: base addresses and lengths of the PCIe controller register blocks.
-- 
2.9.5
