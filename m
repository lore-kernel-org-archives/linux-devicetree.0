From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 07/14] devicetree: Add bindings for the ATH79 PLL controllers
Date: Fri, 17 Apr 2015 16:24:22 +0200
Message-ID: <1429280669-2986-8-git-send-email-albeu@free.fr>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 .../devicetree/bindings/clock/qca,ath79-pll.txt    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qca,ath79-pll.txt

diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
new file mode 100644
index 0000000..2d2da3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
@@ -0,0 +1,33 @@
+Binding for Qualcomm Atheros AR7xxx/AR9XXX PLL controller
+
+The PPL controller provides the 3 main clocks of the SoC: CPU, DDR and AHB.
+
+Required Properties:
+- compatible: has to be "qca,<soctype>-cpu-intc" and one of the following
+  fallback:
+  - "qca,ar7100-pll"
+  - "qca,ar7240-pll"
+  - "qca,ar9130-pll"
+  - "qca,ar9330-pll"
+  - "qca,ar9340-pll"
+  - "qca,ar9550-pll"
+- reg: Base address and size of the controllers memory area
+- clock-names: Name of the input clock, has to be "ref"
+- clock: phandle of the external reference clock
+- #clock-cells: has to be one
+
+Optional properties:
+- clock-output-names: should be "cpu", "ddr", "ahb"
+
+Example:
+
+	pll-controller@18050000 {
+		compatible = "qca,ar9132-ppl", "qca,ar9130-pll";
+		reg = <0x18050000 0x20>;
+
+		clock-names = "ref";
+		clocks = <&extosc>;
+
+		#clock-cells = <1>;
+		clock-output-names = "cpu", "ddr", "ahb";
+	};
-- 
2.0.0
