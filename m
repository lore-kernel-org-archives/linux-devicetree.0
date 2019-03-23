From: qiaozhou <qiaozhou@asrmicro.com>
Subject: [PATCH 4/7] dt-bindings: serial: add ASR8751C serial bindings
Date: Sat, 23 Mar 2019 22:01:25 +0800
Message-ID: <1553349688-1946-5-git-send-email-qiaozhou@asrmicro.com>
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

Add binding documentation for ASR8751C serial device.

Signed-off-by: qiaozhou <qiaozhou@asrmicro.com>
---
 .../devicetree/bindings/serial/asr-serial.txt      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/asr-serial.txt

diff --git a/Documentation/devicetree/bindings/serial/asr-serial.txt b/Documentation/devicetree/bindings/serial/asr-serial.txt
new file mode 100644
index 0000000..9e0e191
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/asr-serial.txt
@@ -0,0 +1,23 @@
+* UART Controller of ASR8751C SoCs
+
+Required properties:
+- compatible : should be "asr,uart"
+- reg: iomem address and length of uart registers
+- interrupts : Should be the interrupt number
+- clocks: clock required by uart
+- clock-frequency: frequency of clock source
+- dmas: dma channel used by uart tx or rx
+- dma-names: dma name of uart tx or rx
+
+Example:
+
+	uart0: uart@d4017000 {
+		compatible = "asr,uart";
+		reg = <0xd4017000 0x1000>;
+		interrupts = <0 32 0x4>;
+		clock-frequency = <13000000>;
+		dmas = <&pdma0 AP_UART0_RX 1
+			&pdma0 AP_UART0_TX 1>;
+		dma-names = "rx", "tx";
+		clocks = <&soc_clocks ASR_CLK_UART0>;
+	};
-- 
2.7.4
