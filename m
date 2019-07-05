From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv6 12/28] dt-bindings: PCI: mobiveil: Change gpio_slave and apb_csr to optional
Date: Fri,  5 Jul 2019 17:56:40 +0800
Message-ID: <20190705095656.19191-13-Zhiqiang.Hou@nxp.com>
References: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, l.subrahmanya@mobiveil.co.in, shawnguo@kernel.org, leoyang.li@nxp.com, lorenzo.pieralisi@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, Xiaowei.Bao@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

Change the "gpio_slave" and "apb_csr" to optional, the "gpio_slave"
is not used in current code, and "apb_csr" is not used by some platforms.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Acked-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V6:
 - Rebased the patch, no functional change.

 .../devicetree/bindings/pci/mobiveil-pcie.txt      |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt b/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
index a618d47..6415699 100644
--- a/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
@@ -10,8 +10,10 @@ Required properties:
 	interrupt source. The value must be 1.
 - compatible: Should contain "mbvl,gpex40-pcie"
 - reg: Should contain PCIe registers location and length
+	Mandatory:
 	"config_axi_slave": PCIe controller registers
 	"csr_axi_slave"	  : Bridge config registers
+	Optional:
 	"gpio_slave"	  : GPIO registers to control slot power
 	"apb_csr"	  : MSI registers
 
-- 
1.7.1
