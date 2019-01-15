From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: reset: Add document for Broadcom STB reset controller
Date: Tue, 15 Jan 2019 10:44:05 -0800
Message-ID: <20190115184406.3164-2-f.fainelli@gmail.com>
References: <20190115184406.3164-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115184406.3164-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add a binding document for the Broadcom STB reset controller, also known
as SW_INIT-style reset controller.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/reset/brcm,brcmstb-reset.txt     | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.txt b/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.txt
new file mode 100644
index 000000000000..6e5341b4f891
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.txt
@@ -0,0 +1,27 @@
+Broadcom STB SW_INIT-style reset controller
+===========================================
+
+Broadcom STB SoCs have a SW_INIT-style reset controller with separate
+SET/CLEAR/STATUS registers and possibly multiple banks, each of 32 bit
+reset lines.
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required properties:
+- compatible: should be brcm,brcmstb-reset
+- reg: register base and length
+- #reset-cells: must be set to 1
+
+Example:
+
+	reset: reset-controller@8404318 {
+		compatible = "brcm,brcmstb-reset";
+		reg = <0x8404318 0x30>;
+		#reset-cells = <1>;
+	};
+
+	&ethernet_switch {
+		resets = <&reset>;
+		reset-names = "switch";
+	};
-- 
2.17.1
