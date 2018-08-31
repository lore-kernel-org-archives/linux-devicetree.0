From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH v5 2/4] dt: bindings: Document ZynqMP DDRC in Synopsys documentation
Date: Fri, 31 Aug 2018 18:57:48 +0530
Message-ID: <1535722070-10394-3-git-send-email-manish.narani@xilinx.com>
References: <1535722070-10394-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535722070-10394-1-git-send-email-manish.narani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, bp@alien8.de, mchehab@kernel.org, manish.narani@xilinx.com, leoyang.li@nxp.com, amit.kucheria@linaro.org, olof@lixom.net
Cc: sgoud@xilinx.com, anirudh@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add information of ZynqMP DDRC which reports the single bit errors that
are corrected and the double bit errors that are detected.

Signed-off-by: Manish Narani <manish.narani@xilinx.com>
---
 .../bindings/memory-controllers/synopsys.txt       | 27 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/synopsys.txt b/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
index a43d26d..9d32762 100644
--- a/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
@@ -1,15 +1,32 @@
 Binding for Synopsys IntelliDDR Multi Protocol Memory Controller
 
-This controller has an optional ECC support in half-bus width (16-bit)
-configuration. The ECC controller corrects one bit error and detects
-two bit errors.
+The ZynqMP DDR ECC controller has an optional ECC support in 64-bit and 32-bit
+bus width configurations.
+
+The Zynq DDR ECC controller has an optional ECC support in half-bus width
+(16-bit) configuration.
+
+These both ECC controllers correct single bit ECC errors and detect double bit
+ECC errors.
 
 Required properties:
- - compatible: Should be 'xlnx,zynq-ddrc-a05'
- - reg: Base address and size of the controllers memory area
+ - compatible: One of:
+	- 'xlnx,zynq-ddrc-a05' : Zynq DDR ECC controller
+	- 'xlnx,zynqmp-ddrc-2.40a' : ZynqMP DDR ECC controller
+ - reg: Should contain DDR controller registers location and length.
+
+Required properties for "xlnx,zynqmp-ddrc-2.40a":
+ - interrupts: Property with a value describing the interrupt number.
 
 Example:
 	memory-controller@f8006000 {
 		compatible = "xlnx,zynq-ddrc-a05";
 		reg = <0xf8006000 0x1000>;
 	};
+
+	mc: memory-controller@fd070000 {
+		compatible = "xlnx,zynqmp-ddrc-2.40a";
+		reg = <0x0 0xfd070000 0x0 0x30000>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 112 4>;
+	};
-- 
2.1.1
