From: qiaozhou <qiaozhou@asrmicro.com>
Subject: [PATCH 3/7] dt-bindings: clocks: add ASR8751C bindings
Date: Sat, 23 Mar 2019 22:01:24 +0800
Message-ID: <1553349688-1946-4-git-send-email-qiaozhou@asrmicro.com>
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

Add binding documentation for ASR8751C clocks, which are general gating
fixed rate and fixed ratio clocks derived from system PLL, external
oscillator. These clocks control registers are distributed on different
sub-controller-unit on SoCs, like APMU, MPMU, CIU etc.

Signed-off-by: qiaozhou <qiaozhou@asrmicro.com>
---
 .../devicetree/bindings/clock/asr,clock.txt        | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/asr,clock.txt

diff --git a/Documentation/devicetree/bindings/clock/asr,clock.txt b/Documentation/devicetree/bindings/clock/asr,clock.txt
new file mode 100644
index 0000000..93082a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/asr,clock.txt
@@ -0,0 +1,31 @@
+* Clock Controller of ASR8751C SoCs
+
+clock subsystem generates and supplies clock to various controllers within the
+ASR8751C SoC.
+
+Required Properties:
+
+- compatible: should be "asr,8751c-clock"
+
+- reg: iomem address and length of the clock subsystem. There are 7 places in
+  SOC has clock control logic: "mpmu", "apmu", "apbc", "apbs", "ciu", "dciu",
+  "ddrc".
+- reg-names: register names of each sub control logic.
+- interrupts : Should be the interrupt number
+- #clock-cells: should be 1.
+
+Example:
+
+	soc_clocks: clocks@d4050000{
+		compatible = "asr,8751c-clock";
+		reg = <0x0 0xd4050000 0x0 0x209c>,
+		      <0x0 0xd4282800 0x0 0x400>,
+		      <0x0 0xd4015000 0x0 0x1000>,
+		      <0x0 0xd4090000 0x0 0x1000>,
+		      <0x0 0xd4282c00 0x0 0x400>,
+		      <0x0 0xd8440000 0x0 0x98>,
+		      <0x0 0xd4200000 0x0 0x4280>;
+		reg-names = "mpmu", "apmu", "apbc", "apbs", "ciu", "dciu", "ddrc";
+		interrupts = <0 96 IRQ_TYPE_LEVEL_HIGH>;
+		#clock-cells = <1>;
+	};
-- 
2.7.4
