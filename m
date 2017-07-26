From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH v2 2/6] dt-bindings: usb: Add documentation for NS2 CDRU USB3
Date: Wed, 26 Jul 2017 18:56:23 -0400
Message-ID: <1501109787-15489-3-git-send-email-jon.mason@broadcom.com>
References: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation for CDRU USB3 registers available in NS2 SoC

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
---
 .../devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt

diff --git a/Documentation/devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt b/Documentation/devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt
new file mode 100644
index 000000000000..30c03bef58fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt
@@ -0,0 +1,14 @@
+Broadcom Chip Device Resource Unit USB3 register
+
+Required properties:
+- compatible: "brcm,cdru-usb3-ctrl"
+- reg: Base address and length of the USB registers
+
+
+Example:
+
+cdru_usb3_ctrl: cdru_usb3_ctrl@6501d144 {
+        compatible = "brcm,cdru-usb3-ctrl";
+        reg = <0x6501d144 0x4>;
+};
+
-- 
2.7.4
