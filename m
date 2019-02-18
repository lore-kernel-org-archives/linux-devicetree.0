From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH 2/6] dt-bindings: add DT binding for the layerscape PCIe GEN4 controller with EP mode
Date: Mon, 18 Feb 2019 17:46:39 +0800
Message-ID: <20190218094643.2692-2-xiaowei.bao@nxp.com>
References: <20190218094643.2692-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218094643.2692-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, Zhiqiang.Hou@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, gregkh@linuxfoundation.org, l.subrahmanya@mobiveil.co.in, arnd@arndb.de, Minghuan.Lian@nxp.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the documentation for the Device Tree binding for the layerscape
PCIe GEN4 controller with EP mode.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
depends on: http://patchwork.ozlabs.org/project/linux-pci/list/?series=88754

 .../bindings/pci/layerscape-pci-gen4.txt           |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci-gen4.txt b/Documentation/devicetree/bindings/pci/layerscape-pci-gen4.txt
index b40fb5d..1b9d0bf 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci-gen4.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci-gen4.txt
@@ -5,7 +5,10 @@ the common properties defined in mobiveil-pcie.txt.
 
 Required properties:
 - compatible: should contain the platform identifier such as:
-  "fsl,lx2160a-pcie"
+  RC mode:
+	"fsl,lx2160a-pcie"
+  EP mode:
+	"fsl,lx2160a-pcie-ep"
 - reg: base addresses and lengths of the PCIe controller register blocks.
   "csr_axi_slave": Bridge config registers
   "config_axi_slave": PCIe controller registers
-- 
1.7.1
