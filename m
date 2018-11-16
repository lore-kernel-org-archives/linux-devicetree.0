From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH 6/9] dt-bindings: spi: zynqmp: Move SPI node under zynqmp firmware
Date: Fri, 16 Nov 2018 15:56:56 -0800
Message-ID: <1542412619-387-7-git-send-email-jollys@xilinx.com>
References: <1542412619-387-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542412619-387-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: michal.simek@xilinx.com, rajanv@xilinx.com, nava.manne@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Rajan Vaja <rajan.vaja@xilinx.com>

SPI driver uses ZynqMP firmware interface and so it should be
populated by firmware driver.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Signed-off-by: Jolly Shah <jollys@xilinx.com>
---
 .../devicetree/bindings/spi/spi-zynqmp-qspi.txt    | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.txt b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.txt
index 0f6d37f..767bb8e 100644
--- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.txt
@@ -14,12 +14,18 @@ Optional properties:
 - num-cs		: Number of chip selects used.
 
 Example:
-	qspi: spi@ff0f0000 {
-		compatible = "xlnx,zynqmp-qspi-1.0";
-		clock-names = "ref_clk", "pclk";
-		clocks = <&misc_clk &misc_clk>;
-		interrupts = <0 15 4>;
-		interrupt-parent = <&gic>;
-		num-cs = <1>;
-		reg = <0x0 0xff0f0000 0x1000>,<0x0 0xc0000000 0x8000000>;
+firmware {
+	zynqmp_firmware: zynqmp-firmware {
+		compatible = "xlnx,zynqmp-firmware";
+		method = "smc";
+		qspi: spi@ff0f0000 {
+			compatible = "xlnx,zynqmp-qspi-1.0";
+			clock-names = "ref_clk", "pclk";
+			clocks = <&misc_clk &misc_clk>;
+			interrupts = <0 15 4>;
+			interrupt-parent = <&gic>;
+			num-cs = <1>;
+			reg = <0x0 0xff0f0000 0x1000>,<0x0 0xc0000000 0x8000000>;
+		};
 	};
+};
-- 
2.7.4
