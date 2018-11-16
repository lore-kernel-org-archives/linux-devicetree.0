From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH 8/9] dt-bindings: remoteproc: Add Xilinx R5 rproc binding
Date: Fri, 16 Nov 2018 15:56:58 -0800
Message-ID: <1542412619-387-9-git-send-email-jollys@xilinx.com>
References: <1542412619-387-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542412619-387-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: michal.simek@xilinx.com, rajanv@xilinx.com, nava.manne@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wendy Liang <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Wendy Liang <wendy.liang@xilinx.com>

Add device tree binding for Xilinx Cortex-r5 remoteproc.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Jolly Shah <jollys@xilinx.com>
---
 .../remoteproc/xlnx,zynqmp-r5-remoteproc.txt       | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5-remoteproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5-remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5-remoteproc.txt
new file mode 100644
index 0000000..4831350
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5-remoteproc.txt
@@ -0,0 +1,81 @@
+Xilinx ARM Cortex A53-R5 remoteproc driver
+==========================================
+
+ZynqMP family of devices use two Cortex R5 processors to help with various
+low power / real time tasks.
+
+This driver requires specific ZynqMP hardware design.
+
+ZynqMP R5 RemoteProc Device Node:
+=================================
+A zynqmp_r5_remoteproc device node is used to represent a R5 IP instance
+within ZynqMP SoC.
+
+Required properties:
+--------------------
+ - compatible : Should be "xlnx,zynqmp-r5-remoteproc-1.0"
+ - reg : Address and length of the register set for the device. It
+        contains in the same order as described reg-names
+ - reg-names: Contain the register set names.
+              "tcm_a" and "tcm_b" for TCM memories.
+              If the user uses the remoteproc driver with the RPMsg kernel
+              driver,"ipi" for the IPI register used to communicate with RPU
+              is also required.
+              Otherwise, if user only uses the remoteproc driver to boot RPU
+              firmware, "ipi" is not required.
+ - tcm-pnode-id: TCM resources power nodes IDs which are used to request TCM
+                 resources for the remoteproc driver to access.
+ - rpu-pnode-id : RPU power node id which is used by the remoteproc driver
+                  to start RPU or shut it down.
+
+Optional properties:
+--------------------
+ - core_conf : R5 core configuration (valid string - split0 or split1 or
+               lock-step), default is lock-step.
+ - memory-region: memories regions for RPU executable and DMA memory.
+ - interrupts : Interrupt mapping for remoteproc IPI. It is required if the
+                user uses the remoteproc driver with the RPMsg kernel driver.
+ - interrupt-parent : Phandle for the interrupt controller. It is required if
+                      the user uses the remoteproc driver with the RPMsg kernel
+                      kernel driver.
+
+Example:
+--------
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		rproc_0_fw_reserved: rproc@3ed000000 {
+			compatible = "rproc-prog-memory";
+			no-map;
+			reg = <0x0 0x3ed00000 0x0 0x40000>;
+		};
+		rproc_0_dma_reserved: rproc@3ed400000 {
+			compatible = "shared-dma-pool";
+			no-map;
+			reg = <0x0 0x3ed40000 0x0 0x80000>;
+		};
+	};
+
+	firmware {
+		zynqmp_firmware: zynqmp-firmware {
+			compatible = "xlnx,zynqmp-firmware";
+			method = "smc";
+
+			zynqmp-r5-remoteproc@0 {
+				compatible = "xlnx,zynqmp-r5-remoteproc-1.0";
+				reg = <0x0 0xFFE00000 0x0 0x10000>,
+					<0x0 0xFFE20000 0x0 0x10000>,
+					<0x0 0xff340000 0x0 0x100>;
+				reg-names = "tcm_a", "tcm_b", "ipi";
+				dma-ranges;
+				core_conf = "split0";
+				memory-region = <&rproc_0_fw_reserved>,
+						<&rproc_0_dma_reserved>;
+				tcm-pnode-id = <0xf>, <0x10>;
+				rpu-pnode-id = <0x7>;
+				interrupt-parent = <&gic>;
+				interrupts = <0 29 4>;
+			} ;
+		};
+	};
-- 
2.7.4
