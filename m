From: Alban Bedel <albeu@free.fr>
Subject: [PATCH v2 05/12] devicetree: Add bindings for the ATH79 MISC interrupt controllers
Date: Sun, 19 Apr 2015 14:58:01 +0200
Message-ID: <1429448288-20742-6-git-send-email-albeu@free.fr>
References: <1429448288-20742-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429448288-20742-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu@free.fr>
---
v2: * Fixed the node names to respect ePAPR
---
 .../interrupt-controller/qca,ath79-misc-intc.txt   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
new file mode 100644
index 0000000..391717a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
@@ -0,0 +1,30 @@
+Binding for Qualcomm Atheros AR7xxx/AR9XXX MISC interrupt controller
+
+The MISC interrupt controller is a secondary controller for lower priority
+interrupt.
+
+Required Properties:
+- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-misc-intc"
+  as fallback
+- reg: Base address and size of the controllers memory area
+- interrupt-parent: phandle of the parent interrupt controller.
+- interrupts: Interrupt specifier for the controllers interrupt.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode interrupt
+		     source, should be 1
+
+Please refer to interrupts.txt in this directory for details of the common
+Interrupt Controllers bindings used by client devices.
+
+Example:
+
+	interrupt-controller@18060010 {
+		compatible = "qca,ar9132-misc-intc", qca,ar7100-misc-intc";
+		reg = <0x18060010 0x4>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <6>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
-- 
2.0.0
