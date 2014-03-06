From: Markus Mayer <markus.mayer@linaro.org>
Subject: [PATCH v2 1/3] ARM: DT: bcm21664: Device tree bindings
Date: Thu,  6 Mar 2014 17:18:12 +0800
Message-ID: <1394097494-29899-2-git-send-email-markus.mayer@linaro.org>
References: <1394097494-29899-1-git-send-email-markus.mayer@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394097494-29899-1-git-send-email-markus.mayer@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <matt.porter@linaro.org>, Christian Daudt <bcm@fixthebug.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Broadcom Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add binding documents for the Broadcom BCM21664 SoC.

Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
---
 Documentation/devicetree/bindings/arm/bcm/bcm21664.txt    | 15 +++++++++++++++
 .../devicetree/bindings/arm/bcm/kona-resetmgr.txt         | 14 ++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm21664.txt
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/kona-resetmgr.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm21664.txt b/Documentation/devicetree/bindings/arm/bcm/bcm21664.txt
new file mode 100644
index 0000000..e077425
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm21664.txt
@@ -0,0 +1,15 @@
+Broadcom BCM21664 device tree bindings
+--------------------------------------
+
+This document describes the device tree bindings for boards with the BCM21664
+SoC.
+
+Required root node property:
+  - compatible: brcm,bcm21664
+
+Example:
+	/ {
+		model = "BCM21664 SoC";
+		compatible = "brcm,bcm21664";
+		[...]
+	}
diff --git a/Documentation/devicetree/bindings/arm/bcm/kona-resetmgr.txt b/Documentation/devicetree/bindings/arm/bcm/kona-resetmgr.txt
new file mode 100644
index 0000000..93f31ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/kona-resetmgr.txt
@@ -0,0 +1,14 @@
+Broadcom Kona Family Reset Manager
+----------------------------------
+
+The reset manager is used on the Broadcom BCM21664 SoC.
+
+Required properties:
+  - compatible: brcm,bcm21664-resetmgr
+  - reg: memory address & range
+
+Example:
+	brcm,resetmgr@35001f00 {
+		compatible = "brcm,bcm21664-resetmgr";
+		reg = <0x35001f00 0x24>;
+	};
-- 
1.9.0
