From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/5] dt-bindings: Add Marvell PXA1928 USB EHCI controller binding
Date: Wed, 13 May 2015 17:48:57 -0500
Message-ID: <1431557340-5421-3-git-send-email-robh@kernel.org>
References: <1431557340-5421-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431557340-5421-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add binding for Marvell PXA1928 SOC's USB EHCI host controller.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/usb/ehci-pxa1928.txt          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ehci-pxa1928.txt

diff --git a/Documentation/devicetree/bindings/usb/ehci-pxa1928.txt b/Documentation/devicetree/bindings/usb/ehci-pxa1928.txt
new file mode 100644
index 0000000..25881be
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ehci-pxa1928.txt
@@ -0,0 +1,19 @@
+* EHCI controller, Marvell PXA1928
+
+Required properties:
+- compatible: must be "marvell,pxa1928-ehci"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: The EHCI interrupt
+- clocks: reference to the clock
+- phys: phandle reference to the USB PHY
+
+Example:
+
+	hsic: usb@601100 {
+		compatible = "marvell,pxa1928-ehci";
+		reg = <0x601100 0x200>;
+		interrupts = <0 22 0x4>;
+		clocks = <&apmu_clocks PXA1928_CLK_HSIC>;
+		phys = <&hsicphy>;
+	};
-- 
2.1.0
