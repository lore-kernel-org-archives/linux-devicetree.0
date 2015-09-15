From: Dongsheng Wang <dongsheng.wang@freescale.com>
Subject: [PATCH v2 1/2] fsl: Add binding for RCPM
Date: Tue, 15 Sep 2015 16:55:38 +0800
Message-ID: <1442307339-15225-1-git-send-email-dongsheng.wang@freescale.com>
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
To: scottwood@freescale.com
Cc: devicetree@vger.kernel.org, Chenhui Zhao <chenhui.zhao@freescale.com>, alison.wang@freescale.com, Wang Dongsheng <dongsheng.wang@freescale.com>, Tang Yuantian <Yuantian.Tang@freescale.com>, robh+dt@kernel.org, jason.jin@freescale.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Wang Dongsheng <dongsheng.wang@freescale.com>

RCPM is the Run Control and Power Management module performs all
device-level tasks associated with device run control and power
management.

Add this for freescale powerpc platform and layerscape platform.

Signed-off-by: Chenhui Zhao <chenhui.zhao@freescale.com>
Signed-off-by: Tang Yuantian <Yuantian.Tang@freescale.com>
Signed-off-by: Wang Dongsheng <dongsheng.wang@freescale.com>
---
*v2*
- Remove P4080 example.
- Modify rcpm-wakeup property description.
diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
new file mode 100644
index 0000000..ea24d76
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
@@ -0,0 +1,60 @@
+* Run Control and Power Management
+-------------------------------------------
+The RCPM performs all device-level tasks associated with device run control
+and power management.
+
+Required properites:
+  - reg : Offset and length of the register set of RCPM block.
+  - compatible : Sould contain a chip-specific RCPM block compatible string
+	and (if applicable) may contain a chassis-version RCPM compatible string.
+	Chip-specific strings are of the form "fsl,<chip>-rcpm", such as:
+	* "fsl,p2041-rcpm"
+	* "fsl,p3041-rcpm"
+	* "fsl,p4080-rcpm"
+	* "fsl,p5020-rcpm"
+	* "fsl,p5040-rcpm"
+	* "fsl,t4240-rcpm"
+	* "fsl,b4420-rcpm"
+	* "fsl,b4860-rcpm"
+
+	Chassis-version strings are of the form "fsl,qoriq-rcpm-<version>",
+	such as:
+	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
+	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
+	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
+
+All references to "1.0" and "2.0" refer to the QorIQ chassis version to
+which the chip complies.
+Chassis Version		Example Chips
+---------------		-------------------------------
+1.0				p4080, p5020, p5040, p2041, p3041
+2.0				t4240, b4860, b4420
+2.1				t1040, ls1021
+
+Example:
+The RCPM node for T4240:
+	rcpm: global-utilities@e2000 {
+		compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
+		reg = <0xe2000 0x1000>;
+	};
+
+* Freescale RCPM Wakeup Source Device Tree Bindings
+-------------------------------------------
+Required rcpm-wakeup property should be added to a device node if the device
+can be used as a wakeup source.
+
+  - rcpm-wakeup: The value of the property consists of 3 cells. The first cell
+	is a pointer to the rcpm node, the second cell is the bit mask that
+	should be set in IPPDEXPCR0, and the last cell is for IPPDEXPCR1.
+	Note: If the platform has no IPPDEXPCR1 register, put a zero here.
+
+Example:
+	lpuart0: serial@2950000 {
+		compatible = "fsl,ls1021a-lpuart";
+		reg = <0x0 0x2950000 0x0 0x1000>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&sysclk>;
+		clock-names = "ipg";
+		rcpm-wakeup = <&rcpm 0x0 0x40000000>;
+		status = "disabled";
+	};
-- 
2.1.0.27.g96db324
