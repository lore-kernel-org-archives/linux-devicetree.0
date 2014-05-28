From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 4/4] dt-bindings: extcon: Add support for SM5502 MUIC device
Date: Wed, 28 May 2014 18:39:36 +0900
Message-ID: <1401269976-12754-5-git-send-email-cw00.choi@samsung.com>
References: <1401269976-12754-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1401269976-12754-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add documentation for binding of SM5502 MUIC (Micro-USB Interface
Controller) device which is using EXTCON subsystem. The SM5502 MUIC device
can detect various external accessories when external accessories is attached
or detached.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
 .../devicetree/bindings/extcon/extcon-sm5502.txt   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-sm5502.txt

diff --git a/Documentation/devicetree/bindings/extcon/extcon-sm5502.txt b/Documentation/devicetree/bindings/extcon/extcon-sm5502.txt
new file mode 100644
index 0000000..4ecda22
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-sm5502.txt
@@ -0,0 +1,23 @@
+
+* SM5502 MUIC (Micro-USB Interface Controller) device
+
+The Silicon Mitus SM5502 is a MUIC (Micro-USB Interface Controller) device
+which can detect the state of external accessory when external accessory is
+attached or detached and button is pressed or released. It is interfaced to
+the host controller using an I2C interface.
+
+Required properties:
+- compatible: Should be "siliconmitus,sm5502-muic"
+- reg: Specifies the I2C slave address of the MUIC block. It should be 0x25
+- interrupt-parent: Specifies the phandle of the interrupt controller to which
+  the interrupts from sm5502 are delivered to.
+- interrupts: Interrupt specifiers for detection interrupt sources.
+
+Example:
+
+	sm5502@25 {
+		compatible = "siliconmitus,sm5502-muic";
+		interrupt-parent = <&gpx1>;
+		interrupts = <5 0>;
+		reg = <0x25>;
+	};
-- 
1.8.0
