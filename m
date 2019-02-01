From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v4 1/3] dt-bindings: power: Add ZynqMP power domain bindings
Date: Fri, 1 Feb 2019 14:08:48 -0800
Message-ID: <1549058930-18644-2-git-send-email-jollys@xilinx.com>
References: <1549058930-18644-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1549058930-18644-1-git-send-email-jollys@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>, rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Rajan Vaja <rajan.vaja@xilinx.com>

Add documentation to describe ZynqMP power domain bindings.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Signed-off-by: Jolly Shah <jollys@xilinx.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/power/xlnx,zynqmp-genpd.txt           | 34 +++++++++++++++++++
 include/dt-bindings/power/xlnx-zynqmp-power.h      | 39 ++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/xlnx,zynqmp-genpd.txt
 create mode 100644 include/dt-bindings/power/xlnx-zynqmp-power.h

diff --git a/Documentation/devicetree/bindings/power/xlnx,zynqmp-genpd.txt b/Documentation/devicetree/bindings/power/xlnx,zynqmp-genpd.txt
new file mode 100644
index 0000000..3c7f237
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/xlnx,zynqmp-genpd.txt
@@ -0,0 +1,34 @@
+-----------------------------------------------------------
+Device Tree Bindings for the Xilinx Zynq MPSoC PM domains
+-----------------------------------------------------------
+The binding for zynqmp-power-controller follow the common
+generic PM domain binding[1].
+
+[1] Documentation/devicetree/bindings/power/power_domain.txt
+
+== Zynq MPSoC Generic PM Domain Node ==
+
+Required property:
+ - Below property should be in zynqmp-firmware node.
+ - #power-domain-cells:	Number of cells in a PM domain specifier. Must be 1.
+
+Power domain ID indexes are mentioned in
+include/dt-bindings/power/xlnx-zynqmp-power.h.
+
+-------
+Example
+-------
+
+firmware {
+	zynqmp_firmware: zynqmp-firmware {
+		...
+		#power-domain-cells = <1>;
+		...
+	};
+};
+
+sata {
+	...
+	power-domains = <&zynqmp_firmware 28>;
+	...
+};
diff --git a/include/dt-bindings/power/xlnx-zynqmp-power.h b/include/dt-bindings/power/xlnx-zynqmp-power.h
new file mode 100644
index 0000000..0d9a412
--- /dev/null
+++ b/include/dt-bindings/power/xlnx-zynqmp-power.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 2018 Xilinx, Inc.
+ */
+
+#ifndef _DT_BINDINGS_ZYNQMP_POWER_H
+#define _DT_BINDINGS_ZYNQMP_POWER_H
+
+#define		PD_USB_0	22
+#define		PD_USB_1	23
+#define		PD_TTC_0	24
+#define		PD_TTC_1	25
+#define		PD_TTC_2	26
+#define		PD_TTC_3	27
+#define		PD_SATA		28
+#define		PD_ETH_0	29
+#define		PD_ETH_1	30
+#define		PD_ETH_2	31
+#define		PD_ETH_3	32
+#define		PD_UART_0	33
+#define		PD_UART_1	34
+#define		PD_SPI_0	35
+#define		PD_SPI_1	36
+#define		PD_I2C_0	37
+#define		PD_I2C_1	38
+#define		PD_SD_0		39
+#define		PD_SD_1		40
+#define		PD_DP		41
+#define		PD_GDMA		42
+#define		PD_ADMA		43
+#define		PD_NAND		44
+#define		PD_QSPI		45
+#define		PD_GPIO		46
+#define		PD_CAN_0	47
+#define		PD_CAN_1	48
+#define		PD_GPU		58
+#define		PD_PCIE		59
+
+#endif
-- 
2.7.4
