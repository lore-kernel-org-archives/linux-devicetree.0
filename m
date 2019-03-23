From: qiaozhou <qiaozhou@asrmicro.com>
Subject: [PATCH 2/7] dt-bindings: bus: add ASR8751C APB/AXI bindings
Date: Sat, 23 Mar 2019 22:01:23 +0800
Message-ID: <1553349688-1946-3-git-send-email-qiaozhou@asrmicro.com>
References: <1553349688-1946-1-git-send-email-qiaozhou@asrmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553349688-1946-1-git-send-email-qiaozhou@asrmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Qiao Zhou <qiaozhou@asrmicro.com>
List-Id: devicetree@vger.kernel.org

From: Qiao Zhou <qiaozhou@asrmicro.com>

Add binding documentation for ASR8751C AXI/APB bus that are used
to interface with peripherals. AXI/APB bus follow standard AXI/APB
protocols.

Signed-off-by: qiaozhou <qiaozhou@asrmicro.com>
---
 Documentation/devicetree/bindings/bus/asr,bus.txt | 42 +++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/asr,bus.txt

diff --git a/Documentation/devicetree/bindings/bus/asr,bus.txt b/Documentation/devicetree/bindings/bus/asr,bus.txt
new file mode 100644
index 0000000..cbb1b6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/asr,bus.txt
@@ -0,0 +1,42 @@
+* ASR AXI/APB Simple Bus
+
+This file documents core properties in ASR AXI and APB bus.
+
+The ASR8751C SoC has APB and AXI buses for cores to access its
+controllers, suchas i2c, sdh, rtc, clock, power management registers
+etc. Most ASR SoCs share the common architecture for buses.
+Generally APB and AXI bus have a source clock and power control, and
+clock rate can be changed and power can be shutdown in low power mode.
+
+Required properties for AXI bus:
+- compatible: should be "asr,axi-bus", "simple-bus".
+- #address-cells: could be 1, or 2
+- #size-cells: could be 1, or 2
+- reg: iomem address of AXI bus registers
+- ranges: register ranges
+
+Example:
+	axi@d4200000 {	/* AXI */
+		compatible = "asr,axi-bus", "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0 0xd4200000 0 0x00200000>;
+		ranges = <0 0 0 0xffffffff>;
+
+	};
+
+Required properties for APB bus:
+- compatible: should be "asr,apb-bus", "simple-bus".
+- #address-cells: could be 1, or 2
+- #size-cells: could be 1, or 2
+- reg: iomem address of APB bus registers
+- ranges: register ranges
+
+Example:
+	apb@d4000000 {	/* APB */
+		compatible = "asr,apb-bus", "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0 0xd4000000 0 0x00200000>;
+		ranges = <0 0 0 0xffffffff>;
+	};
-- 
2.7.4
