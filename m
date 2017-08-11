From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2 1/2] devicetree: ARM: zynq: Add DT binding for eFuse controller
Date: Fri, 11 Aug 2017 15:04:07 +0200
Message-ID: <7e99803ff35cc540f8ce4fccc0940f1d730e8dc5.1502456643.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add DT binding for eFuse controller available at Xilinx Zynq
SoC.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Acked-by: Sören Brinkmann <soren.brinkmann@xilinx.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v2:
- Move doc to bindings/nvmem - suggested by Rob
- Add Rob's ACK

 Documentation/devicetree/bindings/nvmem/zynq-efuse.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/zynq-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/zynq-efuse.txt b/Documentation/devicetree/bindings/nvmem/zynq-efuse.txt
new file mode 100644
index 000000000000..39817e9750c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/zynq-efuse.txt
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
