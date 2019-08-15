From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH 08/10] dt-bindings: PCI: Add the pf-offset property
Date: Thu, 15 Aug 2019 16:37:14 +0800
Message-ID: <20190815083716.4715-8-xiaowei.bao@nxp.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815083716.4715-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the pf-offset property for multiple PF.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 Documentation/devicetree/bindings/pci/designware-pcie.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
index 5561a1c..d658687 100644
--- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
@@ -43,6 +43,7 @@ RC mode:
 
 EP mode:
 - max-functions: maximum number of functions that can be configured
+- pf-offset: the offset of each PF's config space
 
 Example configuration:
 
-- 
2.9.5
