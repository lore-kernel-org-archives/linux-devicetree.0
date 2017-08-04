From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/2] devicetree: ARM: zynq: Add DT binding for eFuse controller
Date: Fri,  4 Aug 2017 12:29:53 +0200
Message-ID: <4b4bfaad88f16d7229bf3da58be8f50f9d82a461.1501842586.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>
List-Id: devicetree@vger.kernel.org

Add DT binding for eFuse controller available at Xilinx Zynq
SoC.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Acked-by: Sören Brinkmann <soren.brinkmann@xilinx.com>
---

 Documentation/devicetree/bindings/arm/zynq/zynq-efuse.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/zynq/zynq-efuse.txt

diff --git a/Documentation/devicetree/bindings/arm/zynq/zynq-efuse.txt b/Documentation/devicetree/bindings/arm/zynq/zynq-efuse.txt
new file mode 100644
index 000000000000..39817e9750c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zynq/zynq-efuse.txt
@@ -0,0 +1,15 @@
+Device tree bindings for Zynq's eFuse Controller
+
+The Zynq eFuse controller provides the access to the chip efuses which contain
+information about device DNA, security settings and also device status.
+
+Required properties:
+ compatible: Compatibility string. Must be "xlnx,zynq-efuse".
+ reg: Specify the base and size of the EFUSE controller registers
+      in the memory map. E.g.: reg = <0xf800d000 0x20>;
+
+Example:
+efuse: efuse@f800d000 {
+	compatible = "xlnx,zynq-efuse";
+	reg = <0xf800d000 0x20>;
+};
-- 
1.9.1
