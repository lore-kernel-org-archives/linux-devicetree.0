From: Minghuan Lian <Minghuan.Lian@nxp.com>
Subject: [PATCH 1/2 v6] dt/bindings: Add bindings for Layerscape SCFG MSI
Date: Wed, 23 Mar 2016 19:08:19 +0800
Message-ID: <1458731300-13648-1-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Roy Zang <roy.zang@nxp.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Thomas Gleixner <tglx@linutronix.de>, Scott Wood <scott.wood@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

Some Layerscape SoCs use a simple MSI controller implementation.
It contains only two SCFG register to trigger and describe a
group 32 MSI interrupts. The patch adds bindings to describe
the controller.

Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
change log:
v6-v4: no change
v4: add interrupt-parent description
v3-v1: no change
 
 .../interrupt-controller/fsl,ls-scfg-msi.txt       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
new file mode 100644
index 0000000..9e38949
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
@@ -0,0 +1,30 @@
+* Freescale Layerscape SCFG PCIe MSI controller
+
+Required properties:
+
+- compatible: should be "fsl,<soc-name>-msi" to identify
+	      Layerscape PCIe MSI controller block such as:
+              "fsl,1s1021a-msi"
+              "fsl,1s1043a-msi"
+- msi-controller: indicates that this is a PCIe MSI controller node
+- reg: physical base address of the controller and length of memory mapped.
+- interrupts: an interrupt to the parent interrupt controller.
+
+Optional properties:
+- interrupt-parent: the phandle to the parent interrupt controller.
+
+This interrupt controller hardware is a second level interrupt controller that
+is hooked to a parent interrupt controller: e.g: ARM GIC for ARM-based
+platforms. If interrupt-parent is not provided, the default parent interrupt
+controller will be used.
+Each PCIe node needs to have property msi-parent that points to
+MSI controller node
+
+Examples:
+
+	msi1: msi-controller@1571000 {
+		compatible = "fsl,1s1043a-msi";
+		reg = <0x0 0x1571000 0x0 0x8>,
+		msi-controller;
+		interrupts = <0 116 0x4>;
+	};
-- 
1.9.1
