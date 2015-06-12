From: Yi Zhang <yizhang@marvell.com>
Subject: [PATCH V2 1/2] mfd: add Marvell 88pm88x description
Date: Fri, 12 Jun 2015 16:43:20 +0800
Message-ID: <1434098601-3498-2-git-send-email-yizhang@marvell.com>
References: <1434098601-3498-1-git-send-email-yizhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434098601-3498-1-git-send-email-yizhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, lee.jones@linaro.org, pebolle@tiscali.nl
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yizhang@marvell.com, zhouqiao@marvell.com, zhenzh@marvell.com
List-Id: devicetree@vger.kernel.org

88pm880 and 88pm886 are two combo PMIC chips, most of the function and the
register mapping are the same

Signed-off-by: Yi Zhang <yizhang@marvell.com>
---
 Documentation/devicetree/bindings/mfd/88pm88x.txt | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/88pm88x.txt

diff --git a/Documentation/devicetree/bindings/mfd/88pm88x.txt b/Documentation/devicetree/bindings/mfd/88pm88x.txt
new file mode 100644
index 0000000..72e741c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/88pm88x.txt
@@ -0,0 +1,33 @@
+Marvell 88pm88x combo PMIC chip
+
+This series of chip integrates regulator, rtc, onkey, switch charger,
+fuelgauge, gpadc and a range of I/O pins.
+
+88pm886 and 88pm880 are two very similar chips, most of the registers mapping
+and functions are the same, the main difference is the latter has a separate
+i2c slave address to cover BUCK related setting
+
+Required properties:
+- compatible: one of the strings for a specific chip:
+  "marvell,88pm886"
+  "marvell,88pm880"
+- reg: the i2c address
+- interrupt-controller: it works as an interrupt controller managing its irqs
+- interrupt-cells: this value is 1
+
+Optional properties:
+- marvell,88pm88x-irq-write-clear: the interrupt ack method
+
+
+Example:
+
+	pmic: 88pm886@30 {
+		compatible = "marvell,88pm886";
+		reg = <0x30>;
+		interrupts = <0 4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		marvell,88pm88x-irq-write-clear;
+	};
-- 
1.9.1
